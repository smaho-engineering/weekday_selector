import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///
/// Thoughts:
/// * Focus? How to use them?
///
/// Ideas:
/// * let developers submit their own labels (language issues?)
/// * support multiple languages
/// * Disable weekend, disable weekdays
/// * Disable any set of days
/// * Circles, rounded edges, segmented pickers
/// * iOS picker with the list and stuff
/// * Colors for borders, backgrounds, text colors, drop shadows
/// * how to use it well with material themes?
/// * i18n? LTR RTL languages???
/// * handle initial values
/// * disable (for example for displaying weekday selection that is not
///   editable by the user
/// * focus nodes, autofocus, semantics enabled? Enable feedback?
///   See Material IconButton
/// * onChanged is up to the user so if he wants, it can serve as a radio button
///   or as a checkbox (select one vs select many vs select 3). reason for
///   letting the user handle updates!
/// * Support first day of the week. I need to shift it somehow!
/// * Support weekdays, weekends
/// * Theme is missing the comparisons, hashes.
///
/// Inspiration: ToggleButtonsThemeData

/// Defines the appearance of [MaterialWeekdayButton] widgets.
///
/// Used by [MaterialWeekdaySelectorTheme] to control the appearance of
/// [MaterialWeekdayButton] widgets in a widget subtree.
///
/// To obtain the current [MaterialWeekdaySelectorTheme], use
/// [MaterialWeekdaySelectorTheme.of].
///
/// See also:
///
/// * [MaterialWeekdaySelectorTheme], which describes the actual configuration
///   of a weekday selector and its buttons' theme.
class MaterialWeekdaySelectorThemeData {
  /// Creates the set of attributes used to configure the appearance of
  /// [MaterialWeekdayButton] widgets.
  const MaterialWeekdaySelectorThemeData({
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
  });

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// The color for descendant [MaterialWeekdayButton] widgets'
  /// [Text] widgets if the day is enabled.
  ///
  /// The [Text] widget by default contains the shortened version of the day.
  final Color color;

  /// The color for descendant [MaterialWeekdayButton] widgets'
  /// [Text] widgets if the day is selected.
  ///
  /// The [Text] widget by default contains the shortened version of the day.
  final Color selectedColor;

  /// The color for descendant [MaterialWeekdayButton] widgets'
  /// [Text] widgets if the day is disabled.
  ///
  /// The [Text] widget by default contains the shortened version of the day.
  final Color disabledColor;

  /// The background color for enabled day buttons.
  final Color fillColor;

  /// The background color for selected day buttons.
  final Color selectedFillColor;

  /// The background color for disabled day buttons.
  final Color disabledFillColor;

  /// The elevation for enabled day buttons.
  final double elevation;

  /// The elevation for selected day buttons.
  final double selectedElevation;

  /// The elevation for disabled day buttons.
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
}

/// An inherited widget that defines the appearance of [MaterialWeekdayButton]
/// widgets in this widget's subtree.
class MaterialWeekdaySelectorTheme extends InheritedTheme {
  /// Create a weekday selector and weekday buttons theme that controls
  /// the appearance of [MaterialWeekdayButton] widgets.
  ///
  /// The [data] argument must not be null.
  const MaterialWeekdaySelectorTheme({
    Key key,
    @required this.data,
    Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

  /// Specifies the appearance for descendant [MaterialWeekdayButton] widgets.
  final MaterialWeekdaySelectorThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [MaterialWeekdaySelectorTheme] widget,
  /// then null is returned.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final theme = MaterialWeekdaySelectorTheme.of(context);
  /// ```
  static MaterialWeekdaySelectorThemeData of(BuildContext context) {
    final MaterialWeekdaySelectorTheme theme = context
        .dependOnInheritedWidgetOfExactType<MaterialWeekdaySelectorTheme>();
    return theme?.data;
  }

  @override
  bool updateShouldNotify(MaterialWeekdaySelectorTheme oldWidget) =>
      data != oldWidget.data;

  @override
  Widget wrap(BuildContext context, Widget child) {
    final MaterialWeekdaySelectorTheme ancestorTheme =
    context.findAncestorWidgetOfExactType<MaterialWeekdaySelectorTheme>();
    return identical(this, ancestorTheme)
        ? child
        : MaterialWeekdaySelectorTheme(data: data, child: child);
  }
}

const _weekdayTooltips = <String>[
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
];

const _weekdayVeryShortNames = <String>[
  'S',
  'M',
  'T',
  'W',
  'T',
  'F',
  'S',
];

// We should also add controller???
class MaterialWeekdaySelectorFormField extends FormField<List<bool>> {
  MaterialWeekdaySelectorFormField({
    Key key,
    FormFieldSetter<List<bool>> onSaved,
    FormFieldValidator<List<bool>> validator,
    List<bool> initialValue,
    List<String> shortWeekdays,
    List<String> weekdays,
    bool autovalidate = false,
  }) : super(
    key: key,
    onSaved: onSaved,
    validator: validator,
    initialValue: initialValue,
    autovalidate: autovalidate,
    builder: (FormFieldState<List<bool>> state) {
      return Column(
        children: <Widget>[
          MaterialWeekdaySelector(
            shortWeekdays: shortWeekdays,
            weekdays: weekdays,
            onChanged: (index) {
              final i = index % 7;
              final newValue = List<bool>.from(state.value);
              newValue[i] = !newValue[i];
              state.didChange(newValue);
              if (autovalidate) state.validate();
              onSaved(state.value);
            },
            values: initialValue,
          ),
          // TODO: Look up how the InputDecorator works and use it?
          if (state.hasError)
            Text(
              state.errorText,
              style: const TextStyle(color: Colors.red),
            ),
        ],
      );
    },
  );
}

/// Weekday selector
class MaterialWeekdaySelector extends StatefulWidget {
  // TODO: idea: f onChanged is null, display items as unmodifiable???
  const MaterialWeekdaySelector({
    Key key,
    @required this.onChanged,
    @required this.values,
    this.shortWeekdays = _weekdayVeryShortNames,
    this.weekdays = _weekdayTooltips,
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
        assert(shortWeekdays == null || shortWeekdays.length == 7),
        assert(weekdays == null || weekdays.length == 7),
        super(key: key);

  /// Very short names for days of the week, starting with Sunday, e.g. 'S'.
  ///
  /// If omitted, English is used.
  final List<String> shortWeekdays;

  /// The days of the week, starting with Sunday, e.g. 'Sunday'.
  ///
  /// If omitted, English is used.
  ///
  /// If you want to provide strings that match your app's current locale, read
  /// the weekday_selector's README and see the `intl` package
  final List<String> weekdays;

  // TODO: colors: if color is set, use fill colors automatically, if they are omitted
  // TODO: add assertions: only one of those should be set.
  // TODO: describe default colors

  /// The corresponding selection state of each day.
  ///
  /// Each value in this set represents a day, therefore every element of this
  /// set must be one of 1, 2, 3, 4, 5, 6, 7, corresponding to the [DateTime]
  /// day constants.
  ///
  /// * true: selected
  /// * false: enabled but not selected
  /// * null: disabled (TODO)
  ///
  /// For example, [values] for the weekend would be a <int>{6, 7}.
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

  final TextStyle textStyle;
  final TextStyle selectedTextStyle;
  final TextStyle disabledTextStyle;

  /// The shape of the enabled day button's [Material].
  final ShapeBorder shape;

  /// The shape of the selected day button's [Material].
  final ShapeBorder selectedShape;

  /// The shape of the disabled day button's [Material].
  final ShapeBorder disabledShape;

  /// Called when the user taps on a day.
  ///
  /// The selector passes the day value as per the [DateTime]weekday constants
  /// to the callback.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget[ using the [State.setState] method (or use your favorite
  /// state management library) so that the parent gets rebuilt, for example:
  ///
  /// ```dart
  /// final days = <int>{ DateTime.monday };
  /// MaterialWeekdaySelector(
  ///   values: days,
  ///   onChanged: (day) {
  ///     if (days.contains(day) {
  ///       days.remove(day);
  ///     } else {
  ///       days.add(day);
  ///     }
  ///   },
  /// )
  /// ```
  final ValueChanged<int> onChanged;

  @override
  _MaterialWeekdaySelectorState createState() =>
      _MaterialWeekdaySelectorState();
}

class _MaterialWeekdaySelectorState extends State<MaterialWeekdaySelector> {
  Widget buildButtonWith(int value) {
    final v = value % 7;
    return MaterialWeekdayButton(
      text: widget.shortWeekdays[v],
      selected: widget.values[v],
      tooltip: widget.weekdays[v],
      onPressed: () => widget.onChanged(value),
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
    return Row(
      children: <Widget>[
        buildButtonWith(DateTime.monday),
        buildButtonWith(DateTime.tuesday),
        buildButtonWith(DateTime.wednesday),
        buildButtonWith(DateTime.thursday),
        buildButtonWith(DateTime.friday),
        buildButtonWith(DateTime.saturday),
        buildButtonWith(DateTime.sunday),
      ],
    );
  }
}

// Inspired by the Android alarm app
class MaterialWeekdayButton extends StatelessWidget {
  // Use for the days, e.g. in German M T W T F S S.

  const MaterialWeekdayButton({
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
        assert(onPressed == null && selected == null ||
            onPressed != null && selected != null),
        super(key: key);

  /// The displayed text on the day button.
  final String text;

  /// Day of the week in grammatically correct, long form.
  ///
  /// This text is displayed when the user long-presses on the day button and
  /// is used for accessibility.
  final String tooltip;

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
    final weekdayTheme = MaterialWeekdaySelectorTheme.of(context);

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
          theme.textTheme.body1.copyWith(color: currentColor);
      currentShape = shape;
    } else if (onPressed != null && selected == true) {
      currentColor = selectedColor ??
          weekdayTheme?.selectedColor ??
          theme.buttonTheme.colorScheme.onPrimary;
      currentFillColor = selectedFillColor ??
          weekdayTheme?.selectedFillColor ??
          theme.buttonTheme.colorScheme.primary;
      // TODO: elevation should use themes... at least our themes
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
          theme.textTheme.body1.copyWith(color: currentColor);
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
          theme.textTheme.body1.copyWith(color: currentColor);
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