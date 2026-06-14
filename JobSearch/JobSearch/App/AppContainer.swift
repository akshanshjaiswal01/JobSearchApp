import Foundation
import Combine

@MainActor
final class AppContainer: ObservableObject {
    var objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher()
    private let apiClient: APIClientProtocol
    private let networkMonitor: NetworkMonitorProtocol
    private let jobService: JobServiceProtocol
    private let jobRepository: JobRepositoryProtocol
    private let fetchJobsUseCase: FetchJobsUseCaseProtocol
    private let searchJobsUseCase: SearchJobsUseCaseProtocol
    let router = AppRouter()

    init(
        apiClient: APIClientProtocol = APIClient(),
        networkMonitor: NetworkMonitorProtocol = NetworkMonitor(),
        dataSource: JobDataSourceProtocol = LocalJobDataSource()
    ) {
        self.apiClient = apiClient
        self.networkMonitor = networkMonitor
        self.jobService = JobService(apiClient: apiClient, dataSource: dataSource)
        self.jobRepository = JobRepository(service: jobService)
        self.fetchJobsUseCase = FetchJobsUseCase(repository: jobRepository)
        self.searchJobsUseCase = SearchJobsUseCase(repository: jobRepository)
    }

    func makeJobListViewModel() -> JobListViewModel {
        JobListViewModel(
            fetchJobsUseCase: fetchJobsUseCase,
            searchJobsUseCase: searchJobsUseCase,
            networkMonitor: networkMonitor,
            router: router
        )
    }

    func makeJobDetailsViewModel(job: Job) -> JobDetailsViewModel {
        JobDetailsViewModel(job: job, router: router)
    }
}
