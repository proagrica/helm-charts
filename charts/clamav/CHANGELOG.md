# ClamAV Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## v0.3.0 - 2021-09-16

### Changed

- Freshclam init container copies cvd from base image.
- Setting of `databaseDirectory`

## v0.2.0 - 2021-09-13

### Added

- Added `HorizontalPodAutoscaler` and `PodDisruptionBudget`

### Changed

- For `Deployment` exposed `replicas` and `updateStrategy`

## v0.1.0 - 2021-09-09

### Added

- Initial release
