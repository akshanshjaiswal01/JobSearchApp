import Foundation

protocol JobDataSourceProtocol: Sendable {
    func loadJobs() async throws -> [Job]
}
