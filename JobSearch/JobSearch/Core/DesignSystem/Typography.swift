import SwiftUI

enum AppTypography {
    static func title(_ text: String) -> some View {
        Text(text).font(.title2).fontWeight(.bold)
    }
    static func headline(_ text: String) -> some View {
        Text(text).font(.headline)
    }
    static func body(_ text: String) -> some View {
        Text(text).font(.body)
    }
    static func caption(_ text: String) -> some View {
        Text(text).font(.caption).foregroundStyle(.secondary)
    }
}
