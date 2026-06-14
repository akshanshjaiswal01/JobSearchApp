import Foundation
@testable import JobSearch

final class MockJobRepository: JobRepositoryProtocol, @unchecked Sendable {
    var jobs: [Job] = []
    var shouldFail = false

    func fetchJobs() async throws -> [Job] {
        if shouldFail { throw NetworkError.unknown("fail") }
        return jobs
    }
    func searchJobs(query: String) async throws -> [Job] {
        if shouldFail { throw NetworkError.unknown("fail") }
        let q = query.lowercased()
        return jobs.filter { $0.title.lowercased().contains(q) || $0.company.lowercased().contains(q) }
    }
    func getJob(id: String) async throws -> Job? { jobs.first { $0.id == id } }
}
