import XCTest
@testable import JobSearch

final class APIClientTests: XCTestCase {
    func testDecodingFailure() async {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        MockURLProtocol.responseData = Data("invalid".utf8)
        MockURLProtocol.statusCode = 200
        let client = APIClient(session: URLSession(configuration: config))
        do {
            _ = try await client.request(JobsEndpoint(), type: [Job].self)
            XCTFail("Expected error")
        } catch let error as NetworkError {
            if case .decodingFailure = error {} else { XCTFail("Expected decoding failure") }
        } catch { XCTFail("Unexpected error") }
    }

    func testServerError() async {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        MockURLProtocol.responseData = Data()
        MockURLProtocol.statusCode = 500
        let client = APIClient(session: URLSession(configuration: config))
        do {
            _ = try await client.request(JobsEndpoint(), type: [Job].self)
            XCTFail("Expected error")
        } catch let error as NetworkError {
            if case .serverError(500) = error {} else { XCTFail("Expected server error") }
        } catch { XCTFail("Unexpected error") }
    }
}
