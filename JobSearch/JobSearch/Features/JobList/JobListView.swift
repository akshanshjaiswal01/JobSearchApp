import SwiftUI

struct JobListView: View {
    @StateObject var viewModel: JobListViewModel
    @ObservedObject var router: AppRouter
    @EnvironmentObject var container: AppContainer

    init(viewModel: JobListViewModel, router: AppRouter) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _router = ObservedObject(wrappedValue: router)
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationTitle("Job Search")
                .searchable(
                    text: $viewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search jobs or companies"
                )
                .refreshable { await viewModel.refresh() }
                .task { viewModel.onAppear() }
                .navigationDestination(for: Job.self) { job in
                    JobDetailsView(viewModel: container.makeJobDetailsViewModel(job: job))
                }
        }
    }

    @ViewBuilder private var content: some View {
        switch viewModel.state {
        case .idle, .loading:
            LoadingView()
        case .loaded(let jobs):
            List(jobs) { job in
                Button { viewModel.selectJob(job) } label: {
                    JobCardView(job: job, searchQuery: viewModel.searchText)
                }
                .buttonStyle(.plain)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        case .empty:
            EmptyStateView(message: "No jobs found. Try a different search.") {
                Task { await viewModel.refresh() }
            }
        case .error(let error):
            ErrorView(error: error) { Task { await viewModel.refresh() } }
        }
    }
}
