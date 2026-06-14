import Foundation

protocol SearchJobsUseCaseProtocol: Sendable {
    func execute(query: String) async throws -> [Job]
}

struct SearchJobsUseCase: SearchJobsUseCaseProtocol {
    let repository: JobRepositoryProtocol
    func execute(query: String) async throws -> [Job] { try await repository.searchJobs(query: query) }
}
