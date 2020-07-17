import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Defines the appearance of [MaterialWeekdayButton] widgets.
///
/// Used by [WeekdaySelectorTheme] to control the appearance of
/// [MaterialWeekdayButton] widgets in a widget subtree.
///
/// To obtain the current [WeekdaySelectorTheme], use
/// [WeekdaySelectorTheme.of].
///
/// See also:
///
/// * [WeekdaySelectorTheme], which describes the actual configuration
///   of a weekday selector and its buttons' theme.
///
/// The [WeekdaySelectorThemeData] here is inspired by theme data
/// classes in Flutter, for example [ToggleButtonsThemeData],
/// [TooltipThemeData].
class WeekdaySelectorThemeData with Diagnosticable {
  /// Creates the set of attributes used to configure the appearance of
  /// [MaterialWeekdayButton] widgets.
  WeekdaySelectorThemeData({
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

  @override
  int get hashCode {
    return hashList([
      enableFeedback,
      color,
      selectedColor,
      disabledColor,
      fillColor,
      selectedFillColor,
      disabledFillColor,
      elevation,
      selectedElevation,
      disabledElevation,
      focusColor,
      selectedFocusColor,
      hoverColor,
      selectedHoverColor,
      splashColor,
      selectedSplashColor,
      textStyle,
      selectedTextStyle,
      disabledTextStyle,
      shape,
      selectedShape,
      disabledShape,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final WeekdaySelectorThemeData typedOther = other;
    return typedOther.enableFeedback == enableFeedback &&
        typedOther.color == color &&
        typedOther.selectedColor == selectedColor &&
        typedOther.disabledColor == disabledColor &&
        typedOther.fillColor == fillColor &&
        typedOther.selectedFillColor == selectedFillColor &&
        typedOther.disabledFillColor == disabledFillColor &&
        typedOther.elevation == elevation &&
        typedOther.selectedElevation == selectedElevation &&
        typedOther.disabledElevation == disabledElevation &&
        typedOther.focusColor == focusColor &&
        typedOther.selectedFocusColor == selectedFocusColor &&
        typedOther.hoverColor == hoverColor &&
        typedOther.selectedHoverColor == selectedHoverColor &&
        typedOther.splashColor == splashColor &&
        typedOther.selectedSplashColor == selectedSplashColor &&
        typedOther.textStyle == textStyle &&
        typedOther.selectedTextStyle == selectedTextStyle &&
        typedOther.disabledTextStyle == disabledTextStyle &&
        typedOther.shape == shape &&
        typedOther.selectedShape == selectedShape &&
        typedOther.disabledShape == disabledShape;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(FlagProperty(
      'feedback',
      value: enableFeedback,
      ifTrue: 'enabled',
      ifFalse: 'disabled',
      showName: true,
      defaultValue: null,
    ));
    textStyle?.debugFillProperties(
      properties,
      prefix: 'textStyle.',
    );
    selectedTextStyle?.debugFillProperties(
      properties,
      prefix: 'selectedTextStyle.',
    );
    disabledTextStyle?.debugFillProperties(
      properties,
      prefix: 'disabledTextStyle.',
    );
    properties.add(ColorProperty(
      'color',
      color,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'selectedColor',
      selectedColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'disabledColor',
      disabledColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'fillColor',
      fillColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'selectedFillColor',
      selectedFillColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'disabledFillColor',
      disabledFillColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'focusColor',
      focusColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'selectedFocusColor',
      selectedFocusColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'hoverColor',
      hoverColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'selectedHoverColor',
      selectedHoverColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'splashColor',
      splashColor,
      defaultValue: null,
    ));
    properties.add(ColorProperty(
      'selectedSplashColor',
      selectedSplashColor,
      defaultValue: null,
    ));
    properties.add(DoubleProperty(
      'elevation',
      elevation,
      defaultValue: null,
    ));
    properties.add(DoubleProperty(
      'selectedElevation',
      selectedElevation,
      defaultValue: null,
    ));
    properties.add(DoubleProperty(
      'disabledElevation',
      disabledElevation,
      defaultValue: null,
    ));
    properties.add(DiagnosticsProperty<ShapeBorder>(
      'shape',
      shape,
      defaultValue: null,
    ));
    properties.add(DiagnosticsProperty<ShapeBorder>(
      'selectedShape',
      selectedShape,
      defaultValue: null,
    ));
    properties.add(DiagnosticsProperty<ShapeBorder>(
      'disabledShape',
      disabledShape,
      defaultValue: null,
    ));
  }
}

/// An inherited widget that defines the appearance of [MaterialWeekdayButton]
/// widgets in this widget's subtree.
class WeekdaySelectorTheme extends InheritedTheme {
  /// Create a weekday selector and weekday buttons theme that controls
  /// the appearance of [MaterialWeekdayButton] widgets.
  ///
  /// The [data] argument must not be null.
  const WeekdaySelectorTheme({
    Key key,
    @required this.data,
    Widget child,
  })  : assert(data != null),
        super(key: key, child: child);

  /// Specifies the appearance for descendant [WeekdayButton] widgets.
  final WeekdaySelectorThemeData data;

  /// The closest instance of this class that encloses the given context.
  ///
  /// If there is no enclosing [WeekdaySelectorTheme] widget,
  /// then this method returns null.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// final MaterialWeekdaySelectorTheme theme = MaterialWeekdaySelectorTheme.of(context);
  /// ```
  static WeekdaySelectorThemeData of(BuildContext context) {
    final WeekdaySelectorTheme theme =
        context.dependOnInheritedWidgetOfExactType<WeekdaySelectorTheme>();
    return theme?.data;
  }

  @override
  bool updateShouldNotify(WeekdaySelectorTheme oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    final WeekdaySelectorTheme ancestorTheme =
        context.findAncestorWidgetOfExactType<WeekdaySelectorTheme>();
    return identical(this, ancestorTheme)
        ? child
        : WeekdaySelectorTheme(data: data, child: child);
  }
}
