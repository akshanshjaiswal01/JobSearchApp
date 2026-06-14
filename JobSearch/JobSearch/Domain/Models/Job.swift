import Foundation

struct Job: Identifiable, Equatable, Codable, Hashable {
    let id: String
    let title: String
    let company: String
    let companyLogo: String?
    let location: String
    let salaryRange: String
    let employmentType: String
    let postedDate: String
    let experienceRequired: String
    let description: String
    let responsibilities: [String]
    let requirements: [String]
    let benefits: [String]
    let companyOverview: String
    let companyWebsite: String
    let companySize: String
    let industry: String
}
