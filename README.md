# Flutter Storyline

<img src="https://raw.githubusercontent.com/Topolo-io/flutter-storyline/main/README/topolo-logo-dark.svg#gh-light-mode-only" width="164">
<img src="https://raw.githubusercontent.com/Topolo-io/flutter-storyline/main/README/topolo-logo-light.svg#gh-dark-mode-only" width="164">

Developed with 💙 by [Topolo][topolo_link] 🦄

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: BSD-3][license_badge]][license_link]

Display stories just like Instagram & TikTok. Handles preloading, caching and all the hard bits, so you can focus on the UI

## Installation 💻

**❗ In order to start using Flutter Storyline Package you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Install via `flutter pub add`:

```sh
dart pub add flutter_storyline
```

---

### Integration tests 🧪

Very Good Flutter Plugin uses [fluttium][fluttium_link] for integration tests. Those tests are located 
in the front facing package `flutter_storyline` example. 

**❗ In order to run the integration tests, you need to have the `fluttium_cli` installed. [See how][fluttium_install].**

To run the integration tests, run the following command from the root of the project:

```sh
cd flutter_storyline/example
fluttium test flows/test_platform_name.yaml
```
[flutter_install_link]: https://docs.flutter.dev/get-started/install
[coverage_badge]: flutter_storyline/coverage_badge.svg
[license_badge]: https://img.shields.io/github/license/topolo-io/flutter-storyline
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/Topolo-io/flutter-storyline/main/README/topolo-logo-dark.svg#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/Topolo-io/flutter-storyline/main/README/topolo-logo-light.svg#gh-dark-mode-only
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[topolo_link]: https://topolo.io/?utm_source=github&utm_medium=banner&utm_campaign=core
[topolo_link_dark]: https://topolo.io/?utm_source=github&utm_medium=banner&utm_campaign=core#gh-dark-mode-only
[topolo_link_light]: https://topolo.io/?utm_source=github&utm_medium=banner&utm_campaign=core#gh-light-mode-only
[fluttium_link]: https://fluttium.dev/
[fluttium_install]: https://fluttium.dev/docs/getting-started/installing-cli
