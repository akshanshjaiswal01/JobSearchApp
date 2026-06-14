import SwiftUI

struct ExpandableSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content
    @State private var isExpanded = true

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            Button {
                withAnimation { isExpanded.toggle() }
            } label: {
                HStack {
                    Text(title).font(.headline)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                }
            }
            .buttonStyle(.plain)
            if isExpanded { content }
        }
        .padding(Spacing.md)
        .background(AppColors.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
