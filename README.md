# `weekday_selector`

> A collection of Flutter widgets and classes to help you select weekdays in your apps. Perfect for recurring events, alarms.

[![smaho-engineering/weekday_selector](https://img.shields.io/static/v1?label=smaho-engineering&message=weekday_selector&logo=flutter&logoWidth=30&color=FF8200&labelColor=08589c&labelWidth=30)](https://github.com/smaho-engineering)

[![Build Status](https://travis-ci.org/smaho-engineering/weekday_selector.svg?branch=master)](https://travis-ci.org/smaho-engineering/weekday_selector 'Check build status on TravisCI') [![Code coverage](https://img.shields.io/codecov/c/github/smaho-engineering/weekday_selector.svg)](https://codecov.io/gh/smaho-engineering/weekday_selector 'Check coverage info')

[![weekday_selector](https://img.shields.io/pub/v/weekday_selector?label=weekday_selector&logo=data:image/png;base64,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)](https://pub.dev/packages/weekday_selector 'See weekday_selector package info on pub.dev')
[![GitHub Stars Count](https://img.shields.io/github/stars/smaho-engineering/weekday_selector?logo=github)](https://github.com/smaho-engineering/weekday_selector 'Star our repository on GitHub!')

<img src="https://github.com/smaho-engineering/weekday_selector/blob/master/example/assets/styles.gif?raw=true" alt="GIF Flutter plugin weekday_selector - Example app in action: Styles" height="600"/>

## Important links

* [**Star the repo on GitHub! ⭐️**](https://github.com/smaho-engineering/weekday_selector)
* [Check package info on `pub.dev`](https://pub.dev/packages/weekday_selector)
* [Open an issue](https://github.com/smaho-engineering/weekday_selector/issues)
* [Read the docs](https://pub.dev/documentation/weekday_selector/latest/)
* This Dart package is created by the [SMAHO development team](https://github.com/smaho-engineering).

## Usage

### Example app

You'll find the best examples in the package's `/example` folder on [GitHub](https://github.com/smaho-engineering/weekday_selector/blob/master/example/lib/main.dart).
There, you'll see examples for basic usage, style customization, and internationalization.

### Basic usage

The `WeekdaySelector` works well with any state management solution. This is how the typical usage with a simple stateful widget looks like:

```dart
class ExampleState extends State<ExampleWidget> {
  // We start with all days selected.
  final values = List.filled(7, true);

  @override
  Widget build(BuildContext context) {
    return WeekdaySelector(
      onChanged: (int day) {
        setState(() {
          // Use module % 7 as Sunday's index in the array is 0 and
          // DateTime.sunday constant integer value is 7.
          final index = day % 7;
          // We "flip" the value in this example, but you may also
          // perform validation, a DB write, an HTTP call or anything
          // else before you actually flip the value,
          // it's up to your app's needs.
          values[index] = !values[index];
        });
      },
      values: values,
    );
  }
}
```

When creating a `WeekdaySelector` widget, pass a `List<bool>` of length 7 as the `values` parameter.
`values[0]` is Sunday, `values[1]` for Monday, and so on.
The `values` list may also contain `null`s, in that case the day will be disabled.

Implement the `onChanged` callback, if you want to handle user interaction.
The `onChanged` callback will be called with the `int` integers matching the `DateTime` day constants: [`DateTime.monday == 1`](https://api.dart.dev/stable/2.6.1/dart-core/DateTime/monday-constant.html), ..., [`DateTime.sunday == 7`](https://api.dart.dev/stable/latest/dart-core/DateTime/sunday-constant.html):
if the user taps on Wednesday, the `onChanged` callback will be called with `3`.

#### Full control

You have full control over how you handle user interaction and what you set the weekday selectors state to.

In the example in "Basic usage", the way the weekday selector works is similar to how a checkbox works: the user can select as many days as needed. However, this might not always be what you want.

We designed the widget's interface to make the widget's behavior easy to customize. So, for example, you want the
weekday selector to resemble how a radio button works, you just need to tweak the `onChanged` callback.

```dart
class RadioLikeWeekdaySelector extends State<ExampleWidget> {
  List<bool> values = List.filled(7, false);

  @override
  Widget build(BuildContext context) {
    return WeekdaySelector(
      onChanged: (int day) {
        setState(() {
          // Set all values to false except the "day"th element
          values = List.filled(7, false, growable: false)..[day] = true;
        });
      },
      values: values,
    );
  }
}
```

### Customization

The [`WeekdaySelector`](https://pub.dev/documentation/weekday_selector/latest/weekday_selector/WeekdaySelector-class.html) class accepts many customization options: you can tweak the fill colors, text style, shape of the days, elevation, and more. In case you don't provide any of these values, the library will do its best to figure out a style that matches your material app's theme.

To see the list of all supported arguments, check out the [API reference](https://pub.dev/documentation/weekday_selector/latest/weekday_selector/WeekdaySelector/WeekdaySelector.html)

#### Theme support

If you want to control multiple selectors' appearance, take a look at the [`WeekdaySelectorTheme`](https://pub.dev/documentation/weekday_selector/latest/weekday_selector/WeekdaySelectorTheme-class.html) widget.

It works exactly like other theme widgets: the descendant weekday widgets will use the theme's attributes. Arguments passed directly to the widgets override the values inherited from the theme.

### Internationalization

We aim to provide you with a widget that supports all languages.
The `WeekdaySelector` accepts custom button texts, tooltips, the first day of the wee, and text direction RTL-LTR (see `shortWeekdays`, `weekdays`, `firstDayOfWeek`, `textDirection` arguments, respectively).

In case these parameters are omitted, English ("en ISO") will be used.

<img src="https://github.com/smaho-engineering/weekday_selector/blob/master/example/assets/intl.gif?raw=true" alt="GIF Flutter plugin weekday_selector - Example app in action: Internationalization" height="600"/>

#### `intl`

We recommend you check out the [`intl`](https://pub.dev/packages/intl) package's [`DateSymbols`](https://pub.dev/documentation/intl/latest/date_symbols/DateSymbols-class.html) class, if you need to support multiple languages.

##### First day of week

Please keep in mind that the `intl` package uses `0` value as `FIRSTDAYOFWEEK` value for locales that start with Monday, whereas `DateTime.monday` is equal to `1`. See [`dart-lang #265` ](https://github.com/dart-lang/intl/issues/265). The `intl` package and the core Dart library days notation is inconsistent, so we decided to use the Dart core library's convention in the `weekday_selector` package.

**Therefore, if you use the `intl` library to decide which day should the week start with, do not forget to add `+1` to `FIRSTDAYOFWEEK` before you pass it to the `WeekdaySelector` widget:**

```dart
WeekdaySelector(
  // intl package uses 0 for Monday, but DateTime uses 1 for Monday,
  // so we need to make sure the values match
  firstDayOfWeek: dateSymbols.FIRSTDAYOFWEEK + 1,
),
```

## Community

I gave a talk about how I developed this package at Flutter Munich. Watch the video recording here or see the [slides](https://docs.google.com/presentation/d/1A5uJXmFGgDsagU4JS7f6Ug18pXmGQRS72XKmLKrhKbQ/edit?usp=sharing).

[![Vince Varga - Developing a weekday selector widget thumbnail 1](https://img.youtube.com/vi/F7EiRb5PT2U/1.jpg)![Vince Varga - Developing a weekday selector widget thumbnail 2](https://img.youtube.com/vi/F7EiRb5PT2U/2.jpg)![Vince Varga - Developing a weekday selector widget thumbnail 3](https://img.youtube.com/vi/F7EiRb5PT2U/3.jpg)](https://www.youtube.com/watch?v=F7EiRb5PT2U)
