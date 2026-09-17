# BeMySponsor

[![Swift](https://img.shields.io/badge/Swift-5.0-F05138?style=flat&logo=swift&logoColor=white)](https://swift.org/)
[![UIKit](https://img.shields.io/badge/UIKit-iOS-2396F3?style=flat&logo=apple&logoColor=white)](https://developer.apple.com/documentation/uikit)
[![iOS](https://img.shields.io/badge/iOS-16.0%2B-000000?style=flat&logo=apple&logoColor=white)](https://developer.apple.com/ios/)
[![Firebase](https://img.shields.io/badge/Firebase-12.19.1-FFCA28?style=flat&logo=firebase&logoColor=black)](https://firebase.google.com/docs/ios/setup)
[![License](https://img.shields.io/badge/license-all%20rights%20reserved-lightgrey?style=flat)](#license)

BeMySponsor is a native iOS sponsorship-matching app: an account registers either as an organization looking for sponsors or as a company looking to sponsor, each side keeps a profile with its category, budget, contact details, past events and partners, and both browse a shared feed. It is written in Swift and UIKit and backed by Firebase Authentication and Cloud Firestore. The app is at the development stage: sign-up, log-in, password reset and Firestore profile creation work, while the feed, search and profile screens are scaffolded and still render placeholder content. The Xcode project is named `SponsorApp`.

> **Context:** Built for Ovvl Company, the author's own startup. Published for reference, not as a general-purpose open-source project; see [License](#license) before reusing anything.

## Features

- Email/password sign-up and log-in via Firebase Authentication, with email verification on registration and a password-reset flow
- Account type chosen at sign-up (organization or company) and saved on the user's Firestore profile
- Client-side password policy: at least 8 characters, one digit and one special character
- Firestore user profiles with name, explanation, user type, events, partners, budget, contact, category and Instagram / LinkedIn / YouTube handles
- Auth gate on the Profile tab that presents the log-in flow to signed-out users
- Three-tab shell (Home, Search, Profile) built programmatically
- Compositional-layout feed made of header, caption, image and like cells
- Slide-out side menu with a language row that shows the flag for the device's preferred language (English, German, Spanish, French, Russian, Turkish and Chinese artwork included)
- Light and dark colour palette centralised in `ColorCodes`

## Tech stack

| Layer | What is used |
| --- | --- |
| Language / UI | Swift 5.0, UIKit (programmatic layout, only `LaunchScreen.storyboard`) |
| Auth and data | Firebase 12.19.1: Auth, Firestore, Analytics |
| Navigation | SideMenu 6.5.0 |
| Local storage | Core Data stack (model currently empty) and `UserDefaults` for the cached user id |
| Dependencies | Swift Package Manager |

## Getting started

### Prerequisites

- macOS with Xcode 27 or later
- iOS 16.0 or later on a simulator or device
- A Firebase project with Email/Password Authentication and Cloud Firestore enabled

### Installation

1. Clone the repository.

   ```bash
   git clone https://github.com/CanDuru4/be-my-sponsor.git
   ```

2. Open `SponsorApp.xcodeproj` in Xcode. Swift Package Manager resolves Firebase and SideMenu automatically.
3. Add your own `GoogleService-Info.plist` (see [Configuration](#configuration)).
4. Select the `SponsorApp` scheme and an iOS 16+ simulator or device, then run (⌘R).

### Configuration

`AppDelegate` calls `FirebaseApp.configure()` at launch, so the app needs one configuration file that is not committed:

| File | Location | Where it comes from |
| --- | --- | --- |
| `GoogleService-Info.plist` | `SponsorApp/`, added to the `SponsorApp` target | Firebase console → Project settings → Your apps → iOS app for bundle id `com.CanDuru.SponsorApp` |

The file is git-ignored; never commit it. Without it the app shows a setup screen instead of calling Firebase. No other environment variables, API keys or secrets are needed.

## Project structure

```
SponsorApp/
├── Setup/                          AppDelegate, SceneDelegate, tab bar controller
├── ViewControllers/
│   ├── RegisterViewController/     Log in, sign up
│   ├── MenuViewController/         Side menu list and cell
│   └── Tabbar/
│       ├── HomeViewController/     Feed and its header/caption/like cells
│       ├── SearchViewController/   Scaffold
│       └── ProfileViewController/  Profile, auth gate, profile cell
├── Helpers/Color Codes/            ColorCodes palette and design references
├── Assets.xcassets/                Logo, language flags, app icon
├── Base.lproj/                     LaunchScreen.storyboard
└── SponsorApp.xcdatamodeld/        Core Data model
SponsorApp.xcodeproj/               Xcode project to open (Swift Package Manager)
CHANGELOG.md                        Version history
```

## Deployment

There is no CI pipeline or automated release workflow; builds are produced locally from Xcode.

## Screenshots

No screenshots are committed yet.

## Known limitations

- The three authored feed-cell files were already deleted before the September 2026 modernization. The home feed shows an unavailable message until they are restored; menu and navigation code remains intact.

## License

No license file is provided. The code is public for reference only: all rights are reserved by Can Duru (Ovvl Company), and no permission to use, copy, modify or redistribute it is granted.

## Author

Can Duru — [canduru.net](https://canduru.net)
