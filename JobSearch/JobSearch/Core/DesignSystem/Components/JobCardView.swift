import SwiftUI

struct JobCardView: View {
    let job: Job
    var searchQuery: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.sm) {
            HStack(spacing: Spacing.md) {
                CompanyLogoView(symbolName: job.companyLogo ?? "building.2.fill")
                VStack(alignment: .leading, spacing: Spacing.xs) {
                    HighlightedText(text: job.title, query: searchQuery).font(.headline)
                    HighlightedText(text: job.company, query: searchQuery).font(.subheadline).foregroundStyle(.secondary)
                }
                Spacer()
            }
            HStack {
                Label(job.location, systemImage: "mappin.and.ellipse")
                Spacer()
                SalaryBadgeView(salary: job.salaryRange)
            }
            .font(.caption)
            .foregroundStyle(.secondary)
            HStack {
                Text(job.employmentType)
                Spacer()
                Text(job.postedDate).font(.caption2)
            }
            .font(.caption)
            .foregroundStyle(.tertiary)
        }
        .padding(Spacing.md)
        .background(AppColors.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(
            color: .black.opacity(0.15),
            radius: 0.5,
            x: 0,
            y: 0.5
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(job.title) at \(job.company), \(job.location), \(job.salaryRange)")
    }
}
