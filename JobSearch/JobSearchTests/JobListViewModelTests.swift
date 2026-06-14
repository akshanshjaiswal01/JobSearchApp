import XCTest
@testable import JobSearch

@MainActor
final class JobListViewModelTests: XCTestCase {
    var sut: JobListViewModel!
    var mockRepo: MockJobRepository!
    var router: AppRouter!

    override func setUp() {
        mockRepo = MockJobRepository()
        router = AppRouter()
        sut = JobListViewModel(
            fetchJobsUseCase: FetchJobsUseCase(repository: mockRepo),
            searchJobsUseCase: SearchJobsUseCase(repository: mockRepo),
            networkMonitor: MockNetworkMonitor(),
            router: router
        )
    }

    func testLoadJobsSuccess() async {
        mockRepo.jobs = [Job.mock]
        await sut.loadJobs()
        if case .loaded(let jobs) = sut.state { XCTAssertEqual(jobs.count, 1) }
        else { XCTFail("Expected loaded state") }
    }

    func testLoadJobsEmpty() async {
        mockRepo.jobs = []
        await sut.loadJobs()
        XCTAssertEqual(sut.state, .empty)
    }

    func testLoadJobsError() async {
        mockRepo.shouldFail = true
        await sut.loadJobs()
        if case .error = sut.state {} else { XCTFail("Expected error state") }
    }

    func testSearchFiltersJobs() async {
        mockRepo.jobs = [Job.mock, Job.mock2]
        await sut.loadJobs()
        sut.searchText = "TechCorp"
        try? await Task.sleep(nanoseconds: 400_000_000)
        if case .loaded(let jobs) = sut.state { XCTAssertEqual(jobs.count, 1) }
        else { XCTFail("Expected loaded state") }
    }

    func testRefreshReloads() async {
        mockRepo.jobs = [Job.mock]
        await sut.refresh()
        if case .loaded = sut.state {} else { XCTFail("Expected loaded") }
    }
}
