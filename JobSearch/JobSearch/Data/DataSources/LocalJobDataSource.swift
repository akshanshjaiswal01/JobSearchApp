import Foundation

final class LocalJobDataSource: JobDataSourceProtocol, @unchecked Sendable {
    func loadJobs() async throws -> [Job] {
        guard let url = Bundle.main.url(forResource: "jobs", withExtension: "json") else {
            throw NetworkError.invalidResponse
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Job].self, from: data)
    }
}
