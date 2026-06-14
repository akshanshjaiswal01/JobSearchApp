import SwiftUI

struct JobDetailsView: View {
    @StateObject var viewModel: JobDetailsViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.lg) {
                header
                ExpandableSection(title: "Description") {
                    AppTypography.body(viewModel.job.description)
                }
                ExpandableSection(title: "Responsibilities") {
                    bulletList(viewModel.job.responsibilities)
                }
                ExpandableSection(title: "Requirements") {
                    bulletList(viewModel.job.requirements)
                }
                ExpandableSection(title: "Benefits") {
                    bulletList(viewModel.job.benefits)
                }
                CompanyInfoView(job: viewModel.job)
            }
            .padding()
        }
        .navigationTitle(viewModel.job.title)
        .navigationBarTitleDisplayMode(.inline)
    }

    private var header: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            HStack(spacing: Spacing.md) {
                CompanyLogoView(symbolName: viewModel.job.companyLogo ?? "building.2.fill")
                VStack(alignment: .leading) {
                    Text(viewModel.job.title).font(.title2.bold())
                    Text(viewModel.job.company).font(.headline).foregroundStyle(.secondary)
                }
            }
            HStack { SalaryBadgeView(salary: viewModel.job.salaryRange); Spacer() }
            Label(viewModel.job.location, systemImage: "mappin.and.ellipse")
            Label(viewModel.job.employmentType, systemImage: "clock")
            Label(viewModel.job.experienceRequired, systemImage: "person.badge.clock")
        }
        .padding(Spacing.md)
        .background(AppColors.cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    private func bulletList(_ items: [String]) -> some View {
        VStack(alignment: .leading, spacing: Spacing.xs) {
            ForEach(items, id: \.self) { item in
                HStack(alignment: .top) {
                    Text("•")
                    Text(item)
                }
                .font(.body)
            }
        }
    }
}
