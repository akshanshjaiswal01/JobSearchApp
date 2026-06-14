import XCTest
@testable import JobSearch

final class JobRepositoryTests: XCTestCase {
    func testFetchJobs() async throws {
        let repo = JobRepository(service: MockJobService())
        let jobs = try await repo.fetchJobs()
        XCTAssertFalse(jobs.isEmpty)
    }

    func testSearchJobs() async throws {
        let repo = JobRepository(service: MockJobService())
        _ = try await repo.fetchJobs()
        let results = try await repo.searchJobs(query: "iOS")
        XCTAssertFalse(results.isEmpty)
    }

    func testGetJobById() async throws {
        let repo = JobRepository(service: MockJobService())
        let job = try await repo.getJob(id: "1")
        XCTAssertNotNil(job)
    }
}
