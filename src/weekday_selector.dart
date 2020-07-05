import 'package:flutter/material.dart';

import 'weekday_selector_theme.dart';

/// The values used for the weekday tooltips if the tooltips list is omitted.
///
/// The default value corresponds to the value of
/// dateTimeSymbolMap()['en_ISO].WEEKDAYS.
const defaultWeekdays = <String>[
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];

/// The values used for the weekday buttons if the short names list is omitted.
///
/// The default value corresponds to the value of
/// dateTimeSymbolMap()['en_ISO].NARROWWEEKDAYS.
const defaultShortWeekdays = <String>[
  'S',
  'M',
  'T',
  'W',
  'T',
  'F',
  'S',
];

/// The value we use for the first day of the week if the value is omitted.
///
/// The default value corresponds to the value of
/// dateTimeSymbolMap()['en_ISO].FIRSTDAYOFWEEK + 1.
const defaultFirstDayOfWeek = 1;

const defaultTextDirection = TextDirection.ltr;

/// The days that we display if the displayedDays argument is omitted.
///
/// By default, we display all days.
const defaultDisplayedDays = {
  DateTime.monday,
  DateTime.tuesday,
  DateTime.wednesday,
  DateTime.thursday,
  DateTime.friday,
  DateTime.saturday,
  DateTime.sunday,
};

/// The [WeekdaySelector] displays buttons that correspond to weekdays and lets
/// the user select some of these weekdays.
///
/// Requires one of its ancestors to be a [Material] widget.
class WeekdaySelector extends StatefulWidget {
  WeekdaySelector({
    Key key,
    @required this.onChanged,
    @required this.values,
    this.shortWeekdays = defaultShortWeekdays,
    this.weekdays = defaultWeekdays,
    this.firstDayOfWeek = defaultFirstDayOfWeek,
    this.textDirection = defaultTextDirection,
    this.displayedDays = defaultDisplayedDays,
    this.enableFeedback,
    this.color,
    this.selectedColor,
    this.disabledColor,
    this.fillColor,
    this.selectedFillColor,
    this.disabledFillColor,
    this.elevation,
    this.selectedElevation,
    this.disabledElevation,
    this.focusColor,
    this.selectedFocusColor,
    this.hoverColor,
    this.selectedHoverColor,
    this.splashColor,
    this.selectedSplashColor,
    this.textStyle,
    this.selectedTextStyle,
    this.disabledTextStyle,
    this.shape,
    this.selectedShape,
    this.disabledShape,
  })  : assert(values != null),
        assert(shortWeekdays != null),
        assert(weekdays != null),
        assert(values.length == 7),
        assert(shortWeekdays.length == 7),
        assert(shortWeekdays.every((d) => d != null)),
        assert(weekdays.length == 7),
        assert(weekdays.every((d) => d != null)),
        super(key: key);

  /// Very short names for days of the week, starting with Sunday, e.g. 'S'.
  ///
  /// These values are displayed to the user in the [WeekdayButton]s.
  ///
  /// If omitted, [defaultShortWeekdays] is used (en_ISO).
  final List<String> shortWeekdays;

  /// The days of the week, starting with Sunday, e.g. 'Sunday'.
  ///
  /// If omitted, [defaultWeekdays] is used (en_ISO).
  ///
  /// These values are used as tooltips: long-press on a [WeekdayButton] widget.
  /// For more information, see the `material` library's [Tooltip] widget.
  ///
  /// If you want to provide strings that match your app's current locale, read
  /// the weekday_selector's README and see the `intl` package
  final List<String> weekdays;

  /// Which days are rendered in the weekday selector.
  ///
  /// By default, all days are displayed.
  final Set<int> displayedDays;

  /// The first day of the week, in ISO 8601 style, where the first day of the
  /// week, i.e. index 0, is Monday.
  ///
  /// If omitted, [defaultFirstDayOfWeek] is used (en_ISO).
  final int firstDayOfWeek;

  /// The text direction to be used when creating the day buttons.
  final TextDirection textDirection;

  /// The corresponding selection state of each day.
  ///
  /// * true: selected
  /// * false: enabled but not selected
  /// * null: disabled
  ///
  /// For example, for a weekend selector where the weekend values are selected
  /// (assuming Saturday, Sunday) and weekday values are not, [values] would be:
  ///
  /// ```dart
  /// values: <int>[
  ///   true, // Sunday
  ///   false, // Monday
  ///   false, // Tuesday
  ///   false, // Wednesday
  ///   false, // Thursday
  ///   false, // Friday
  ///   true, // Saturday
  /// ],
  /// ```
  final List<bool> values;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// The color for descendant [Text] widgets if the day is enabled.
  ///
  /// The [Text] widget contains the shortened version of the day.
  final Color color;

  /// The color for descendant [Text] widgets if the day is selected.
  ///
  /// The [Text] widget contains the shortened version of the day.
  final Color selectedColor;

  /// The color for descendant [Text] widgets if the day is enabled.
  ///
  /// The [Text] widget contains the shortened version of the day.
  final Color disabledColor;

  /// The background color of the day button if the day is enabled.
  final Color fillColor;

  /// The background color of the day button if the day is selected.
  final Color selectedFillColor;

  /// The background color of the day button if the day is disabled.
  final Color disabledFillColor;

  /// The elevation of the button when the day is enabled.
  final double elevation;

  /// The elevation of the button when the day is selected.
  final double selectedElevation;

  /// The elevation of the button when the day is disabled.
  final double disabledElevation;

  /// The background color of the day button if the day is enabled.
  final Color focusColor;

  /// The focus color of the day button if the day is selected.
  final Color selectedFocusColor;

  /// The color for the button's [Material] when a pointer is hovering over it
  /// and the day is enabled.
  final Color hoverColor;

  /// The color for the button's [Material] when a pointer is hovering over it
  /// and the day is selected.
  final Color selectedHoverColor;

  /// The splash color for the button's [InkWell] if the day is enabled.
  final Color splashColor;

  /// The splash color for the button's [InkWell] if the day is selected.
  final Color selectedSplashColor;

  /// The text style of the button's text if the day is not selected.
  final TextStyle textStyle;

  /// The text style of the button's text if the day is selected.
  final TextStyle selectedTextStyle;

  /// The text style of the button's text if the day is disabled.
  final TextStyle disabledTextStyle;

  /// The shape of the enabled day button's [Material].
  final ShapeBorder shape;

  /// The shape of the selected day button's [Material].
  final ShapeBorder selectedShape;

  /// The shape of the disabled day button's [Material].
  final ShapeBorder disabledShape;

  /// Called when the user taps on a day.
  ///
  /// The selector passes the day value as per the [DateTime] weekday constants
  /// to the callback.
  ///
  /// The callback provided to [onChanged] could update the state of the parent
  /// [StatefulWidget[ using the [State.setState] method (or use your favorite
  /// state management library) so that the parent gets rebuilt.
  final ValueChanged<int> onChanged;

  @override
  _WeekdaySelectorState createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  Widget buildButtonWith(int value) {
    // In the arrays, element at index 0 correspond to Sunday...
    final arrayIndex = value % 7;
    // ...but in the onChanged method, we want to let users of this package use
    // the DateTime.monday, ..., DateTime.sunday constants.
    final dateTimeDay = arrayIndex == 0 ? DateTime.sunday : arrayIndex;
    return WeekdayButton(
      text: widget.shortWeekdays[arrayIndex],
      selected: widget.values[arrayIndex],
      tooltip: widget.weekdays[arrayIndex],
      onPressed: widget.values[arrayIndex] == null
          ? null
          : () => widget.onChanged(dateTimeDay),
      enableFeedback: widget.enableFeedback,
      color: widget.color,
      selectedColor: widget.selectedColor,
      disabledColor: widget.disabledColor,
      fillColor: widget.fillColor,
      selectedFillColor: widget.selectedFillColor,
      disabledFillColor: widget.disabledFillColor,
      elevation: widget.elevation,
      selectedElevation: widget.selectedElevation,
      disabledElevation: widget.disabledElevation,
      focusColor: widget.focusColor,
      selectedFocusColor: widget.selectedFocusColor,
      hoverColor: widget.hoverColor,
      selectedHoverColor: widget.selectedHoverColor,
      splashColor: widget.splashColor,
      selectedSplashColor: widget.selectedSplashColor,
      textStyle: widget.textStyle,
      selectedTextStyle: widget.selectedTextStyle,
      disabledTextStyle: widget.disabledTextStyle,
      shape: widget.shape,
      selectedShape: widget.selectedShape,
      disabledShape: widget.disabledShape,
    );
  }

  @override
  Widget build(BuildContext context) {
    const days = [0, 1, 2, 3, 4, 5, 6];
    final displayedIndices = widget.displayedDays.map((e) => e % 7);
    return Row(
      textDirection: widget.textDirection,
      children: days
          .where((d) => displayedIndices.contains(d))
          .map((i) => i + widget.firstDayOfWeek)
          .map(buildButtonWith)
          .toList(),
    );
  }
}

/// A single button that holds a weekday.
///
/// This widget is used in the [WeekdaySelector] widget,
/// and for most use-cases, you should consider using the
/// [WeekdaySelector] widget instead of the [WeekdayButton] widget.
class WeekdayButton extends StatelessWidget {
  /// Creates a [WeekdayButton] widget.
  const WeekdayButton({
    Key key,
    @required this.text,
    @required this.tooltip,
    @required this.onPressed,
    @required this.selected,
    this.enableFeedback,
    this.color,
    this.selectedColor,
    this.disabledColor,
    this.fillColor,
    this.selectedFillColor,
    this.disabledFillColor,
    this.elevation,
    this.selectedElevation,
    this.disabledElevation,
    this.focusColor,
    this.selectedFocusColor,
    this.hoverColor,
    this.selectedHoverColor,
    this.splashColor,
    this.selectedSplashColor,
    this.textStyle,
    this.selectedTextStyle,
    this.disabledTextStyle,
    this.shape,
    this.selectedShape,
    this.disabledShape,
  })  : assert(text != null),
        assert(tooltip != null),
        assert(text.length != 0),
        assert(tooltip.length != 0),
        super(key: key);

  /// The displayed text on the day button.
  ///
  /// Use a short string, as the button is small on most displays.
  final String text;

  /// Day of the week in grammatically correct, long form.
  ///
  /// This text is displayed when the user long-presses on the day button and
  /// is used for accessibility. Use an unambiguous string.
  final String tooltip;

  /// The callback which is called when the user taps on the weekday button.
  final VoidCallback onPressed;

  /// Whether this day is selected.
  ///
  /// This property must not be null if [onPressed] is provided.
  final bool selected;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// The color for descendant [Text] widgets if the day is enabled.
  ///
  /// The [Text] widget contains the shortened version of the day.
  final Color color;

  /// The color for descendant [Text] widgets if the day is selected.
  ///
  /// The [Text] widget contains the shortened version of the day.
  final Color selectedColor;

  /// The color for descendant [Text] widgets if the day is enabled.
  ///
  /// The [Text] widget contains the shortened version of the day.
  final Color disabledColor;

  /// The background color of the day button if the day is enabled.
  final Color fillColor;

  /// The background color of the day button if the day is selected.
  final Color selectedFillColor;

  /// The background color of the day button if the day is disabled.
  final Color disabledFillColor;

  /// The elevation of the button when the day is enabled.
  final double elevation;

  /// The elevation of the button when the day is selected.
  final double selectedElevation;

  /// The elevation of the button when the day is disabled.
  final double disabledElevation;

  /// The color for the button's [Material] when it has the input focus and the
  /// day is enabled
  final Color focusColor;

  /// The color for the button's [Material] when it has the input focus and the
  /// day is selected
  final Color selectedFocusColor;

  /// The color for the button's [Material] when a pointer is hovering over it
  /// and the day is enabled.
  final Color hoverColor;

  /// The color for the button's [Material] when a pointer is hovering over it
  /// and the day is selected.
  final Color selectedHoverColor;

  /// The splash color for the button's [InkWell] if the day is enabled.
  final Color splashColor;

  /// The splash color for the button's [InkWell] if the day is selected.
  final Color selectedSplashColor;

  /// The text style of the day button's [Text] descendant if the day is enabled.
  final TextStyle textStyle;

  /// The text style of the day button's [Text] descendant if the day is selected.
  final TextStyle selectedTextStyle;

  /// The text style of the day button's [Text] descendant if the day is disabled.
  final TextStyle disabledTextStyle;

  /// The shape of the enabled day button's [Material].
  final ShapeBorder shape;

  /// The shape of the selected day button's [Material].
  final ShapeBorder selectedShape;

  /// The shape of the disabled day button's [Material].
  final ShapeBorder disabledShape;

  @override
  Widget build(BuildContext context) {
    Color currentColor;
    Color currentFillColor;
    Color currentFocusColor;
    Color currentHoverColor;
    Color currentSplashColor;
    double currentElevation;
    double currentDisabledElevation;
    TextStyle currentTextStyle;
    ShapeBorder currentShape;

    final theme = Theme.of(context);
    final weekdayTheme = WeekdaySelectorTheme.of(context);

    final currentEnableFeedback = enableFeedback ?? true;
    // Based on the official material toggle buttons
    if (onPressed != null && selected == false) {
      currentColor = color ??
          weekdayTheme?.color ??
          theme.buttonTheme.colorScheme.onSurface;
      currentFillColor = fillColor ??
          weekdayTheme?.fillColor ??
          theme.buttonTheme.colorScheme.surface;
      currentElevation = elevation ?? weekdayTheme?.elevation ?? 1;
      currentFocusColor = focusColor ??
          weekdayTheme?.focusColor ??
          theme.buttonTheme.colorScheme.onSurface.withOpacity(0.12);
      currentHoverColor = hoverColor ??
          weekdayTheme?.hoverColor ??
          theme.buttonTheme.colorScheme.onSurface.withOpacity(0.04);
      currentSplashColor = splashColor ??
          weekdayTheme?.splashColor ??
          theme.buttonTheme.colorScheme.onSurface.withOpacity(0.16);
      currentTextStyle = textStyle ??
          weekdayTheme?.textStyle ??
          theme.textTheme.bodyText2.copyWith(color: currentColor);
      currentShape = shape;
    } else if (onPressed != null && selected == true) {
      currentColor = selectedColor ??
          weekdayTheme?.selectedColor ??
          theme.buttonTheme.colorScheme.onPrimary;
      currentFillColor = selectedFillColor ??
          weekdayTheme?.selectedFillColor ??
          theme.buttonTheme.colorScheme.primary;
      currentElevation =
          selectedElevation ?? weekdayTheme?.selectedElevation ?? 2;
      currentFocusColor = selectedFocusColor ??
          weekdayTheme?.selectedFocusColor ??
          theme.buttonTheme.colorScheme.primary.withOpacity(0.12);
      currentHoverColor = selectedHoverColor ??
          weekdayTheme?.selectedHoverColor ??
          theme.buttonTheme.colorScheme.primary.withOpacity(0.04);
      currentSplashColor = selectedSplashColor ??
          weekdayTheme?.selectedSplashColor ??
          theme.buttonTheme.colorScheme.primary.withOpacity(0.16);
      currentShape = selectedShape ?? weekdayTheme?.selectedShape;
      currentTextStyle = selectedTextStyle ??
          weekdayTheme?.selectedTextStyle ??
          theme.textTheme.bodyText2.copyWith(color: currentColor);
    } else {
      currentDisabledElevation =
          disabledElevation ?? weekdayTheme?.disabledElevation ?? 0;
      currentColor = disabledColor ??
          weekdayTheme?.disabledColor ??
          theme.colorScheme.onSurface.withOpacity(0.38);
      currentFillColor = disabledFillColor ??
          weekdayTheme?.disabledFillColor ??
          theme.colorScheme.onSurface.withOpacity(0.05);
      currentShape = disabledShape ?? weekdayTheme?.disabledShape;
      currentTextStyle = disabledTextStyle ??
          weekdayTheme?.disabledTextStyle ??
          theme.textTheme.bodyText2.copyWith(color: currentColor);
    }

    return Expanded(
      child: Tooltip(
        message: tooltip,
        child: RawMaterialButton(
          textStyle: currentTextStyle,
          elevation: currentElevation ?? 0.0,
          disabledElevation: currentDisabledElevation ?? 0.0,
          fillColor: currentFillColor,
          focusColor: currentFocusColor,
          hoverColor: currentHoverColor,
          splashColor: currentSplashColor,
          enableFeedback: currentEnableFeedback,
          onPressed: onPressed,
          shape: currentShape ?? const CircleBorder(side: BorderSide.none),
          child: Text(text),
        ),
      ),
    );
  }
}
