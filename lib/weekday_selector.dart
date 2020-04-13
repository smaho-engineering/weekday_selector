library weekday_selector;

/// Ideas:
/// * List picker like on the iOS Clock or Google Calendar recurring events
/// * Do not render every day (for example render only weekdays)
/// * Verify A11y OK? focus nodes, autofocus, semantics enabled, screen readers?
/// * onChanged is up to the user so if he wants, it can serve as a radio button
///   or as a checkbox (select one vs select many vs select 3). reason for
///   letting the user handle updates!
/// * Support forms: accept the same parameters as simple selector,
///   we are going to need a controller and display errors.
/// * How it works on the web? Tabs to jump and space toggle.

export 'src/weekday_selector_theme.dart';
export 'src/weekday_selector.dart';
