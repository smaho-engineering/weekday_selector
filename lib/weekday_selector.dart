library weekday_selector;

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
/// * i18n? LTR RTL languages???
/// * disable (for example for displaying weekday selection that is not
///   editable by the user
/// * focus nodes, autofocus, semantics enabled? Enable feedback?
///   See Material IconButton
/// * onChanged is up to the user so if he wants, it can serve as a radio button
///   or as a checkbox (select one vs select many vs select 3). reason for
///   letting the user handle updates!
/// * Support first day of the week. I need to shift it somehow!
/// * Support weekdays, weekends
/// * form should accept the same params as the selector
/// * split into smaller, more manageable files... WIP
/// * should also add a weekday selector controller???

//export 'src/legacy.dart';
export 'src/weekday_selector_theme.dart';
export 'src/weekday_selector.dart';
