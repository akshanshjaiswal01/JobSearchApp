import Foundation

protocol JobRepositoryProtocol: Sendable {
    func fetchJobs() async throws -> [Job]
    func searchJobs(query: String) async throws -> [Job]
    func getJob(id: String) async throws -> Job?
}
