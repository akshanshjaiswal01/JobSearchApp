# JobFinder

A production-ready iOS application built using SwiftUI and MVVM architecture that allows users to browse available jobs, search opportunities, and view detailed job information.

## Features

### Job Listing

* Browse available job opportunities
* Display job title, company, location, salary range, employment type, and posting date
* Pull-to-refresh support
* Responsive card-based UI

### Search

* Search jobs by title
* Search jobs by company name
* Real-time filtering
* Highlight matching search text

### Job Details

* Detailed job description
* Company information
* Salary information
* Location details
* Employment type
* Requirements and responsibilities

### State Handling

* Loading state
* Empty state
* Error state
* Retry support

### Accessibility

* VoiceOver support
* Dynamic Type support
* Accessibility labels

---

## Screenshots

<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 13 - 2026-06-14 at 10 22 42" src="https://github.com/user-attachments/assets/3f1d203c-b718-4a27-80e4-fd39f59d4732" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 13 - 2026-06-14 at 10 22 31" src="https://github.com/user-attachments/assets/5cd82654-d67b-4efb-93ad-83bd213b3d8a" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 13 - 2026-06-14 at 10 22 23" src="https://github.com/user-attachments/assets/42550ccd-763c-4c9e-b2ee-bd37b6f33403" />
<img width="1170" height="2532" alt="Simulator Screenshot - iPhone 13 - 2026-06-14 at 10 22 19" src="https://github.com/user-attachments/assets/a1e4505d-8f5f-47d1-9f06-66d170ee789c" />


---

## Technical Stack

* Swift 5.10+
* SwiftUI
* MVVM Architecture
* Swift Concurrency (Async/Await)
* Dependency Injection
* XCTest / Swift Testing
* Local JSON Data Source

---

## Architecture

The application follows the MVVM (Model-View-ViewModel) architecture pattern with clear separation of concerns.

### Architecture Overview

```text
View
 ↓
ViewModel
 ↓
Repository
 ↓
Data Source
```

### Layers

#### Presentation Layer

Responsible for UI rendering and user interactions.

* Views
* Reusable Components
* Navigation
* ViewModels

#### Domain Layer

Contains business logic and models.

* Models
* Protocols
* Use Cases

#### Data Layer

Responsible for data retrieval and persistence.

* Repository
* Services
* Local Data Source
* Network Layer (Extensible)

---

## Project Structure

```text
JobFinder
│
├── App
│   └── JobFinderApp.swift
│
├── Core
│   ├── DI
│   ├── DesignSystem
│   ├── Extensions
│   ├── Utilities
│   └── Navigation
│
├── Domain
│   ├── Models
│   ├── Protocols
│   └── UseCases
│
├── Data
│   ├── Repositories
│   ├── Services
│   └── DataSources
│
├── Features
│   ├── JobList
│   └── JobDetails
│
├── Resources
│   └── jobs.json
│
└── Tests
    ├── ViewModelTests
    └── ServiceTests
```

---

## Dependency Injection

The application uses protocol-based dependency injection to improve:

* Testability
* Maintainability
* Flexibility

Example:

```swift
protocol JobRepositoryProtocol
protocol JobServiceProtocol
protocol APIClientProtocol
```

Dependencies are injected through initializers.

---

## Data Source

The application currently uses a local JSON file as a mock data source.

Benefits:

* No external API dependency
* Faster development
* Consistent test data
* Easy evaluation and setup

The architecture allows replacing the local data source with a remote API implementation without modifying the UI layer.

---

## State Management

A reusable state management approach is used throughout the application.

```swift
enum ViewState<T> {
    case idle
    case loading
    case loaded(T)
    case empty
    case error(AppError)
}
```

This ensures consistent handling of:

* Loading states
* Success states
* Empty states
* Failure states

---

## Testing

### Test Coverage

The project includes unit tests covering:

* ViewModels
* Services
* Repositories
* Search Logic
* Error Handling
* State Management

### Covered Scenarios

#### Job List ViewModel

* Fetch jobs successfully
* Handle loading state
* Handle empty state
* Handle error state
* Search by title
* Search by company

#### Repository

* Load jobs successfully
* Handle malformed data
* Handle missing data

#### Service Layer

* Data retrieval
* Error propagation

---

## Running the Project

### Requirements

* Xcode 16 or later
* iOS 17.0+
* macOS Sonoma or later

### Installation

1. Clone the repository

```bash
git clone <repository-url>
```

2. Open the project

```bash
open JobFinder.xcodeproj
```

3. Build and run

```text
⌘ + R
```

---

## Running Tests

Run all tests:

```text
⌘ + U
```

View test results:

```text
Report Navigator (⌘ + 9)
```

---

## Design Decisions

### Why SwiftUI?

* Modern declarative UI framework
* Reduced boilerplate
* Better state management
* Improved Swift integration

### Why MVVM?

* Separation of concerns
* Improved testability
* Scalable architecture
* Better maintainability

### Why Async/Await?

* Cleaner asynchronous code
* Improved readability
* Structured concurrency
* Modern Swift best practices

### Why Protocol-Based Dependency Injection?

* Easy mocking
* Loose coupling
* Better test coverage
* Scalability

---

## Assumptions

* Authentication is out of scope.
* Jobs are loaded from a local JSON file.
* Search functionality is performed locally.
* Pagination is not required for the current dataset.
* Offline support is not required because data is bundled locally.

---

## Future Enhancements

* Remote API integration
* Pagination support
* Saved/Favorite jobs
* SwiftData persistence
* Offline caching
* Advanced filtering
* Sorting options
* Deep linking
* Analytics integration
* CI/CD pipeline
* Snapshot testing

---

## Author

Developed as part of an iOS engineering assessment to demonstrate:

* SwiftUI
* MVVM
* Async/Await
* Dependency Injection
* Testing
* Clean Architecture
* Production-ready code organization
