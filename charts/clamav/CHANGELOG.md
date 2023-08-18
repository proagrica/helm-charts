# ClamAV Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## v0.9.0 - 2023-07-19

### Changed

- Update the autoscaling api version to autoscaling/v2

## v0.8.0 - 2023-03-22

### Changed

- Update the _ClamAV_ image version to 0.105.2


## v0.7.0 - 2022-02-15

### Changed

- Update the _ClamAV_ image version to 0.105.0

## v0.6.0 - 2022-02-17

### Added

- Add the ability to set yara rules

## v0.5.0 - 2022-02-15

### Changed

- Update the _ClamAV_ image version to 0.104.2

## v0.4.0 - 2021-09-17

### Changed

- Set default `targetMemoryUtilizationPercentage` to `nil`.

## v0.3.0 - 2021-09-16

### Changed

- Freshclam init container copies cvd from base image.
- Expose setting of `databaseDirectory`

## v0.2.0 - 2021-09-13

### Added

- Added `HorizontalPodAutoscaler` and `PodDisruptionBudget`

### Changed

- For `Deployment` exposed `replicas` and `updateStrategy`

## v0.1.0 - 2021-09-09

### Added

- Initial release
