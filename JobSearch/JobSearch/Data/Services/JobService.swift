import Foundation

final class JobService: JobServiceProtocol, @unchecked Sendable {
    private let apiClient: APIClientProtocol
    private let dataSource: JobDataSourceProtocol
    private var cache: [Job] = []

    init(apiClient: APIClientProtocol, dataSource: JobDataSourceProtocol) {
        self.apiClient = apiClient
        self.dataSource = dataSource
    }

    func fetchJobs() async throws -> [Job] {
        do {
            let jobs = try await dataSource.loadJobs()
            cache = jobs
            return jobs
        } catch {
            if !cache.isEmpty { return cache }
            throw error
        }
    }
}
