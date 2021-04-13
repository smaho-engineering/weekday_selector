## 1.0.0-nullsafety.0

Migrate to null-safety.

## 0.4.0

Remove `DiagnosticableMixin` and use the `Diagnosticable` mixin. [`#2`](https://github.com/smaho-engineering/weekday_selector/pull/2)

Remove enormous example videos from the repository, use hashed URLs. For more info, see: [`pub-dev #3849`](https://github.com/dart-lang/pub-dev/issues/3849) 

## 0.3.1

Change text style themes from body1 -> bodyText2. Material updates landed in Flutter's stable channel.

## 0.3.0

Add `displayedDays` argument.

## 0.2.2

Revert `Diagnoticable` and text theme changes.

0.2.1 was not tested with the stable channel, so some changes were made to this package only worked on the `dev` and `beta` channels, but not on `stable`.

As the package aims to support the `stable` channel, those updates were reverted.

The CI/CD pipeline has been also updated so that this won't occur again: we run the tests on the `stable` channel.

## 0.2.1

Fix issue with `WeekdaySelectorTheme`. The build error was: "The superclass, 'Diagnosticable', has no unnamed constructor that takes no arguments."

Link Vince's talk about the package: YouTube video and slides.

Moaaar README improvements.

## 0.2.0

`WeekdaySelector`, `WeekdaySelectorTheme` should be ready to use and the README is also not so terrible anymore :)

## 0.1.2

Improve READMEs, documentation and the example project.

## 0.1.1

### `WeekdaySelector` widget

* **internationalization-friendly**: change texts, directionality, and first day of the week
* **highly-customizable**: customize colors, text styles, elevations, and shapes
* **sane defaults**: colors are picked based on your material theme

### Theming with `WeekdaySelectorTheme`

The weekday selector provides its own inherited widget which you can use if you want to customize multiple weekday selectors in your subtree.

### Example app, testing

The initial version of the example app is added to the project. We improved the automated test suite, and execute checks on every commit to master to ensure good quality.

## 0.1.0

Initial release.
