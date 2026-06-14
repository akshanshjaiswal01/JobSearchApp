import Foundation

protocol JobServiceProtocol: Sendable {
    func fetchJobs() async throws -> [Job]
}
