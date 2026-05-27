# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

### Added
- **2026-05-27 17:09:** Restructured project to support multiple target applications by creating `projects/`, `tools/`, and `scenarios/` directories.
- **2026-05-27 17:10:** Created `setup-tools.sh` to download JDK and Maven on-demand, removing large binaries from the repository.
- **2026-05-27 17:10:** Created `start-backend.sh` and `stop-backend.sh` to handle standalone lifecycle management of target project backends.
- **2026-05-27 17:12:** Created a root-level `.env.example` file to simplify initial configuration.
- **2026-05-27 17:12:** Added a `--scenario <name>` command-line argument to pipeline scripts (`record.js`, `generate_audio.js`, `merge_video_audio.js`) for dynamic project selection.

### Changed
- **2026-05-27 17:10:** Updated `.gitignore` to explicitly exclude `projects/`, `tools/`, and previous heavy directories (`local_jdk/`, etc.).
- **2026-05-27 17:11:** Refactored the hardcoded `scenario.js` into a dynamic configuration `scenarios/logistics-ai-bridge.js` that includes project metadata (name, start command, health check).
- **2026-05-27 17:12:** Updated `package.json` with new lifecycle npm scripts (`start-backend`, `stop-backend`, `setup-tools`).
- **2026-05-27 17:12:** Completely rewrote `README.md` and updated `RECORDING.md` to document the new decoupled, multi-project architecture.

### Verified
- **2026-05-27 17:20:** Completed end-to-end testing of the full video pipeline against the isolated `logistics-ai-bridge` project.
