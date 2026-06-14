import Foundation
@testable import JobSearch

extension Job {
    static let mock = Job(id: "1", title: "Senior iOS Developer", company: "TechCorp", companyLogo: "building.2.fill",
        location: "Remote", salaryRange: "$120k", employmentType: "Full-time", postedDate: "2026-06-01",
        experienceRequired: "5+ years", description: "Test", responsibilities: ["A"], requirements: ["B"],
        benefits: ["C"], companyOverview: "Overview", companyWebsite: "https://example.com",
        companySize: "100", industry: "Tech")
    static let mock2 = Job(id: "2", title: "Android Dev", company: "OtherCo", companyLogo: nil,
        location: "NYC", salaryRange: "$90k", employmentType: "Contract", postedDate: "2026-06-02",
        experienceRequired: "2 years", description: "Test2", responsibilities: ["D"], requirements: ["E"],
        benefits: ["F"], companyOverview: "Other", companyWebsite: "https://other.com",
        companySize: "50", industry: "Mobile")
}
