import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
import 'package:weekday_selector/weekday_selector.dart';

/// These automated tests are added so that we enforce consistency between
/// the intl package and the weekday_selector package upon publishing
/// (and upon every commit or automated test run) without having to
/// add a dependency to the package itself.
void main() {
  group('default values must match intl package', () {
    final DateSymbols enIso = dateTimeSymbolMap()['en_ISO'];

    test('defaultWeekdays', () {
      expect(defaultWeekdays, enIso.WEEKDAYS);
    });
    test('defaultShortWeekdays', () {
      expect(defaultShortWeekdays, enIso.NARROWWEEKDAYS);
    });
    test('defaultFirstDayOfWeek', () {
      // IMPORTANT: https://github.com/dart-lang/intl/issues/265
      expect(defaultFirstDayOfWeek, enIso.FIRSTDAYOFWEEK + 1);
    });
  });
}
