[![Swift Version][swift-image]][swift-url]
[![Platform][platform-image]][platform-url]
[![Firebase][firebase-image]][firebase-url]
[![License][license-image]](#license)

# BeMySponsor

<br />
<p align="center">
  <a href="https://canduru.net">
    <img src="docs/assets/canduru-banner.png" alt="Can Duru" width="221" height="90">
  </a>
</p>

BeMySponsor (Xcode project name: `SponsorApp`) is a native iOS app **built for Ovvl Company**. It is a
sponsorship-matching platform: an account is registered either as an *Organization* looking for sponsors or
as a *Company* looking to sponsor, each side keeps a profile with its category, budget, contact details,
past events and partners, and both browse a shared feed. The app is written in Swift/UIKit and backed by
Firebase Authentication and Cloud Firestore.

> This repository is published for reference. It was developed for Ovvl Company, not as a general-purpose
> open-source project — see [License](#license) before reusing anything.

## Status

This application is currently in the development stage. Sign-up, log-in, password reset and Firestore
profile creation are implemented; the feed, search and profile screens are scaffolded and still render
placeholder content.

## Features

- Email/password **sign-up and log-in** via Firebase Authentication, with email verification sent on
  registration and a password-reset flow.
- **Account type at sign-up** — Organization or Company — persisted on the user's Firestore profile.
- **Client-side password policy**: at least 8 characters, one digit and one special character.
- **Firestore user profiles** holding name, explanation, user type, events, partners, budget, contact,
  category and Instagram / LinkedIn / YouTube handles.
- **Auth gate** on the Profile tab: an unauthenticated user is presented the log-in flow automatically.
- **Three-tab shell** (Home, Search, Profile) built programmatically, no storyboard except the launch screen.
- **Compositional-layout feed** composed of header, caption, image and like cells.
- **Slide-out side menu** with a language row that shows the flag matching the device's preferred language;
  artwork for English, German, Spanish, French, Russian, Turkish and Chinese ships in the asset catalog.
- **Light/dark colour palette** centralised in `ColorCodes`.

## Tech stack

| Layer | Choice |
| --- | --- |
| Language / UI | Swift 5.0, UIKit (programmatic layout) |
| Minimum iOS | 16.0 |
| Dependencies | CocoaPods 1.11.3 |
| Auth & data | Firebase 9.3.0 — Auth, Firestore, Analytics |
| Navigation | SideMenu 6.5.0 |
| Networking | Alamofire 5.6.2 (declared in the `Podfile`, not yet used in code) |
| Local storage | Core Data stack (model currently empty) and `UserDefaults` for the cached user id |

## Getting started

### Prerequisites

- macOS with Xcode 14 or newer (iOS 16 SDK)
- CocoaPods 1.11.3 or newer
- A Firebase project with **Email/Password Authentication** and **Cloud Firestore** enabled

### Install

```bash
git clone https://github.com/CanDuru4/BeMySponsor.git
cd BeMySponsor
pod install
```

### Configuration

`AppDelegate` calls `FirebaseApp.configure()` at launch, so the app needs one configuration file that is
deliberately **not** committed to this repository:

| Name | Location | Where it comes from |
| --- | --- | --- |
| `GoogleService-Info.plist` | `SponsorApp/`, added to the `SponsorApp` target | Firebase console → Project settings → Your apps → iOS app for bundle id `com.CanDuru.SponsorApp` |

That file is git-ignored — never commit it. No other environment variables, API keys or secrets are
required to build or run the app.

### Run

Open **`SponsorApp.xcworkspace`** (not `SponsorApp.xcodeproj` — the project uses CocoaPods), pick the
`SponsorApp` scheme and an iOS 16+ simulator or device, then Run (⌘R).

## Project structure

```
SponsorApp/
├── Setup/                          AppDelegate, SceneDelegate, tab bar controller
├── ViewControllers/
│   ├── RegisterViewController/     Log in, sign up
│   ├── MenuViewController/         Side menu list + cell
│   └── Tabbar/
│       ├── HomeViewController/     Feed and its header/caption/like cells
│       ├── SearchViewController/   Scaffold
│       └── ProfileViewController/  Profile, auth gate, profile cell
├── Helpers/Color Codes/            ColorCodes palette and design references
├── Assets.xcassets/                Logo, language flags, app icon
├── Base.lproj/                     LaunchScreen.storyboard
└── SponsorApp.xcdatamodeld/        Core Data model
Podfile / Podfile.lock              CocoaPods dependency manifest and lock
SponsorApp.xcworkspace/             Workspace to open (project + Pods)
```

## Build and release

There is no CI pipeline or automated release workflow in this repository; builds are produced locally from
Xcode. Version history is kept in [CHANGELOG.md](CHANGELOG.md).

## License

No license file is provided. The code is public for reference only — all rights are reserved by the author
and Ovvl Company, and no permission to use, copy, modify or redistribute it is granted. Ask before reusing
any part of it.

## Meta

Can Duru — canduru2004@gmail.com, support@canduru.net — [https://canduru.net](https://canduru.net)

[https://github.com/CanDuru4](https://github.com/CanDuru4)

[swift-image]: https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[platform-image]: https://img.shields.io/badge/platform-iOS%2016.0%2B-lightgrey.svg
[platform-url]: https://developer.apple.com/ios/
[firebase-image]: https://img.shields.io/badge/Firebase-9.3.0-ffca28.svg
[firebase-url]: https://firebase.google.com/docs/ios/setup
[license-image]: https://img.shields.io/badge/license-all%20rights%20reserved-lightgrey.svg
