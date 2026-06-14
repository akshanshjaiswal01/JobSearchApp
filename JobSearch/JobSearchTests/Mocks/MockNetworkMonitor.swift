import Foundation
@testable import JobSearch

final class MockNetworkMonitor: NetworkMonitorProtocol {
    var isConnected = true
}
