import Foundation
import Combine

@MainActor
final class JobListViewModel: ObservableObject {
    @Published private(set) var state: ViewState<[Job]> = .idle
    @Published var searchText = "" { didSet { Task { await debouncedSearch() } } }

    private let fetchJobsUseCase: FetchJobsUseCaseProtocol
    private let searchJobsUseCase: SearchJobsUseCaseProtocol
    private let networkMonitor: NetworkMonitorProtocol
    private let router: AppRouter
    private let debouncer = Debouncer()
    private var loadTask: Task<Void, Never>?
    private var allJobs: [Job] = []

    init(fetchJobsUseCase: FetchJobsUseCaseProtocol, searchJobsUseCase: SearchJobsUseCaseProtocol,
         networkMonitor: NetworkMonitorProtocol, router: AppRouter) {
        self.fetchJobsUseCase = fetchJobsUseCase
        self.searchJobsUseCase = searchJobsUseCase
        self.networkMonitor = networkMonitor
        self.router = router
    }

    func onAppear() { Task { await loadJobs() } }

    func loadJobs() async {
        loadTask?.cancel()
        loadTask = Task {
            state = .loading
            do {
                let jobs = try await fetchJobsUseCase.execute()
                guard !Task.isCancelled else { return }
                allJobs = jobs
                if jobs.isEmpty { state = .empty }
                else { state = .loaded(jobs) }
            } catch {
                guard !Task.isCancelled else { return }
                let appError = (error as? NetworkError)?.appError ?? AppError(message: error.localizedDescription, isOffline: !networkMonitor.isConnected)
                state = .error(appError)
            }
        }
        await loadTask?.value
    }

    func refresh() async { await loadJobs() }

    private func debouncedSearch() async {
        await debouncer.debounce { [weak self] in
            guard let self else { return }
            await self.performSearch()
        }
    }

    private func performSearch() async {
        let query = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        if query.isEmpty {
            state = allJobs.isEmpty ? .empty : .loaded(allJobs)
            return
        }
        do {
            let results = try await searchJobsUseCase.execute(query: query)
            state = results.isEmpty ? .empty : .loaded(results)
        } catch {
            state = .error(AppError(message: error.localizedDescription))
        }
    }

    func selectJob(_ job: Job) { router.showDetails(for: job) }
}
