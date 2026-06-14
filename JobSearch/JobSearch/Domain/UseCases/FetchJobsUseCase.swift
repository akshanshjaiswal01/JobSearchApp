import Foundation

protocol FetchJobsUseCaseProtocol: Sendable {
    func execute() async throws -> [Job]
}

struct FetchJobsUseCase: FetchJobsUseCaseProtocol {
    let repository: JobRepositoryProtocol
    func execute() async throws -> [Job] { try await repository.fetchJobs() }
}
