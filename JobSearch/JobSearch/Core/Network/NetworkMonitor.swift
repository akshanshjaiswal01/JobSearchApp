import Foundation
import Network

protocol NetworkMonitorProtocol: AnyObject {
    var isConnected: Bool { get }
}

final class NetworkMonitor: NetworkMonitorProtocol {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    private(set) var isConnected = true

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }

    deinit { monitor.cancel() }
}
