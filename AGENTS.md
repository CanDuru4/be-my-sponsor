# BeMySponsor (SponsorApp)

Native iOS sponsorship-matching app for Ovvl Company, the owner's own startup (not client work). Organizations and companies register, keep profiles, and browse a shared feed. Swift 5 + UIKit (programmatic), Firebase Auth/Firestore/Analytics, SideMenu, all via Swift Package Manager. Status: early development / low activity; auth and profile creation work, feed/search/profile screens are scaffolds. Public repo, all rights reserved (no license).

## Repo map

- `SponsorApp.xcodeproj` — the only project to open. Target and auto-generated scheme are both `SponsorApp`; no shared scheme is committed. Package pins live in `SponsorApp.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved` (Firebase 12.19.1, SideMenu 6.5.0).
- `SponsorApp/Setup/` — `AppDelegate` (Firebase configure + empty Core Data stack), `SceneDelegate` (root `UINavigationController` → `TabBarViewController`), `TabbarViewController.swift`.
- `SponsorApp/ViewControllers/RegisterViewController/` — log-in, sign-up (Firebase Auth + Firestore profile write).
- `SponsorApp/ViewControllers/Tabbar/{Home,Search,Profile}ViewController/` — tab screens; `AuthViewController` gates Profile for signed-out users.
- `SponsorApp/ViewControllers/MenuViewController/` — SideMenu list and language-flag cell.
- `SponsorApp/Helpers/Color Codes/ColorCodes.swift` — central light/dark palette (`LightMode.jpeg`/`DarkMode.jpeg` are the design references).
- `SponsorApp/Assets.xcassets` — logo, app icon, language flag images.
- `CHANGELOG.md` — version history (only 0.0.0 so far). `docs/assets/` — README banner.

## Commands

- Open and run: open `SponsorApp.xcodeproj`, scheme `SponsorApp`, iOS 16+ simulator, Cmd-R. SPM resolves packages on open.
- CLI build (no signing): `xcodebuild -project SponsorApp.xcodeproj -scheme SponsorApp -destination 'generic/platform=iOS Simulator' CODE_SIGNING_ALLOWED=NO build`
- List targets/schemes: `xcodebuild -list -project SponsorApp.xcodeproj`
- Tests: there is no test target.
- Deploy: none. No CI, no fastlane, no release workflow; builds are made locally in Xcode.

## Configuration and secrets

- `SponsorApp/GoogleService-Info.plist` is git-ignored and must never be committed (repo is public). A local copy may exist in the working tree; leave it alone and never print its contents.
- Without the plist (or when launched with the `-FirebaseSetupPreview` argument) `AppDelegate` skips `FirebaseApp.configure` and `SceneDelegate` shows a "Firebase setup required" screen instead of the tab bar. Keep that fallback working.
- Bundle id `com.CanDuru.SponsorApp`; app deployment target iOS 16.0 (project-level setting still says 14.0; the target overrides it).
- `SponsorApp.xcworkspace/` may exist locally but is untracked, stale, and not used; do not reintroduce it.

## Conventions observed

- UI is fully programmatic (Auto Layout via `NSLayoutConstraint.activate`); the only storyboard is `LaunchScreen.storyboard`. Do not add storyboards/XIBs.
- Code is plain MVC in view controllers; Firebase calls are made directly from controllers (no service layer yet). Existing files use `//MARK:` section markers heavily.
- The Xcode project uses explicit file references (not synchronized folders): a new `.swift` file must be added to `project.pbxproj` / the `SponsorApp` target or it will not compile in.
- Prefer `ColorCodes` (instantiated as `ColorCodes().<name>`) over inline `UIColor` literals; `SignUpViewController` still has a few inline ones.
- Firestore: sign-up writes one document per user to the `users` collection via `addDocument` (auto id) with fields `name, explanation, usertype, events, partners, Instagram, LinkedIn, YouTube, budget, contact, category, uid`. Keep that field set and casing. Because the doc id is not the uid, `ProfileViewController` finds the profile with `whereField("uid", isEqualTo:)` first. The signed-in uid is cached in `UserDefaults` under `user_uid_key`.
- Password policy (client-side regex in `SignUpViewController`): at least 8 chars with a lowercase letter, a digit and one of `$@#!%*?&`, and only characters from `[A-Za-z0-9$@#!%*?&]` (spaces, `-`, `_` etc. are rejected). The README omits the lowercase and allowed-character rules.

## Gotchas

- The feed cell classes (header/caption/image/like) were deleted before the Sept 2026 modernization. `HomeViewController` registers a plain `UICollectionViewCell` and shows "Feed content is unavailable in this checkout." The README's feature list and project-structure line still mention those cells; its Known limitations section is the accurate one.
- Core Data model `SponsorApp.xcdatamodeld` is empty; `persistentContainer` `fatalError`s on load failure (template code).
- GitHub repo is `CanDuru4/be-my-sponsor` (renamed from `BeMySponsor`).
- No `Localizable` strings or string catalog is committed, so `String(localized:)` keys (`dataError`, `okButton`) render as the raw key. `SponsorApp/Translation/` is an empty, untracked local folder.
- The README follows the owner's portfolio README standard (fixed skeleton ending with License and Author); keep that structure when editing it.

## Docs

- `README.md` — features, setup, Firebase configuration table, project structure, license.
