import SwiftUI

struct HighlightedText: View {
    let text: String
    let query: String

    var body: some View {
        Text(highlighted)
    }

    private var highlighted: AttributedString {
        var result = AttributedString(text)
        let q = query.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard !q.isEmpty, let range = text.lowercased().range(of: q) else { return result }
        let start = text.distance(from: text.startIndex, to: range.lowerBound)
        let length = text.distance(from: range.lowerBound, to: range.upperBound)
        let attrStart = result.index(result.startIndex, offsetByCharacters: start)
        let attrEnd = result.index(attrStart, offsetByCharacters: length)
        result[attrStart..<attrEnd].backgroundColor = .yellow.opacity(0.4)
        return result
    }
}
