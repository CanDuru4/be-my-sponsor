@AGENTS.md

## Claude Code

- Verify Swift edits with the CLI build in AGENTS.md; there are no tests. If SPM resolution fails with "already exists in file system" under `~/Library/Caches/org.swift.swiftpm/artifacts`, another session is resolving the same Firebase binaries concurrently; wait and retry rather than deleting the cache.
- Keep `project.pbxproj` edits minimal when adding or moving Swift files; Xcode may have the project open and will rewrite it.
