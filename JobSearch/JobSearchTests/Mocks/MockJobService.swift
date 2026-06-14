import Foundation
@testable import JobSearch

final class MockJobService: JobServiceProtocol, @unchecked Sendable {
    func fetchJobs() async throws -> [Job] { [Job.mock, Job.mock2] }
}
