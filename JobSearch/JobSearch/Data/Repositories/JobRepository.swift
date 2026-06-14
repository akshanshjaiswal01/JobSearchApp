import Foundation

final class JobRepository: JobRepositoryProtocol, @unchecked Sendable {
    private let service: JobServiceProtocol
    private var allJobs: [Job] = []

    init(service: JobServiceProtocol) { self.service = service }

    func fetchJobs() async throws -> [Job] {
        let jobs = try await service.fetchJobs()
        allJobs = jobs
        return jobs
    }

    func searchJobs(query: String) async throws -> [Job] {
        if allJobs.isEmpty { allJobs = try await service.fetchJobs() }
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty else { return allJobs }
        return allJobs.filter {
            $0.title.lowercased().contains(q) || $0.company.lowercased().contains(q)
        }
    }

    func getJob(id: String) async throws -> Job? {
        if allJobs.isEmpty { allJobs = try await service.fetchJobs() }
        return allJobs.first { $0.id == id }
    }
}
