import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
import 'package:weekday_selector/weekday_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Weekday Selector Example';
    final examples = <Widget>[
      SimpleExampleWeekendsStatic(),
      CustomWeekdaysTexts(),
      ShortAndNarrowGermanExample(),
      RegionMattersSpanishExample(),
      ThemedSelector(),
      FirstDayOfWeekExample(),
    ];
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.separated(
          padding: EdgeInsets.all(12),
          separatorBuilder: (_, __) => Divider(height: 24),
          itemBuilder: (_, index) => examples[index],
          itemCount: examples.length,
        ),
      ),
    );
  }
}

/// Print the integer and the day it corresponds to for demo and debug purposes.
printIntAsDay(int intDay) {
  String stringDay;
  if (intDay % 7 == DateTime.monday % 7) stringDay = 'Monday';
  if (intDay % 7 == DateTime.tuesday % 7) stringDay = 'Tueday';
  if (intDay % 7 == DateTime.wednesday % 7) stringDay = 'Wednesday';
  if (intDay % 7 == DateTime.thursday % 7) stringDay = 'Thursday';
  if (intDay % 7 == DateTime.friday % 7) stringDay = 'Friday';
  if (intDay % 7 == DateTime.saturday % 7) stringDay = 'Saturday';
  if (intDay % 7 == DateTime.sunday % 7) stringDay = 'Sunday';
  print('Received integer: $intDay. Corresponds to day: $stringDay');
}

/// [SimpleExampleWeekendsStatic] shows how to pass initial values to the
/// [WeekdaySelector] widget and demonstrates how the `onChanged`
/// callback works.
class SimpleExampleWeekendsStatic extends StatefulWidget {
  @override
  _SimpleExampleWeekendsStaticState createState() =>
      _SimpleExampleWeekendsStaticState();
}

class _SimpleExampleWeekendsStaticState
    extends State<SimpleExampleWeekendsStatic> {
  int lastTapped;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
            'We set the initial values to the weekend. The onChanged function will be called with the indices of the days. In accordance with ISO 8601 a week starts with Monday, which has the value 1.'),
        Text(
          lastTapped == null
              ? 'onChanged callback was not yet called'
              : 'onChanged callback was last called with $lastTapped',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        WeekdaySelector(
          // We display the last tapped value in the example app
          onChanged: (v) {
            printIntAsDay(v);
            setState(() => lastTapped = v);
          },
          values: [
            true, // Sunday
            false, // Monday
            false, // Tuesday
            false, // Wednesday
            false, // Thursday
            false, // Friday
            true, // Saturday
          ],
        ),
      ],
    );
  }
}

class FirstDayOfWeekDateTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
            'Use the "firstDayOfWeek" property to change which day is the first day of the week.'),
        Text('Starting with Monday'),
        WeekdaySelector(
          onChanged: print,
          values: valuesSaturdaySunday,
          firstDayOfWeek: DateTime.monday,
        ),
        Text('Starting with Sunday'),
        WeekdaySelector(
          onChanged: print,
          values: valuesSaturdaySunday,
          firstDayOfWeek: DateTime.sunday,
        ),
        Text('Starting with Saturday'),
        WeekdaySelector(
          onChanged: print,
          values: valuesSaturdaySunday,
          firstDayOfWeek: DateTime.saturday,
        ),
      ],
    );
  }
}

class CustomWeekdaysTexts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
            'In case you need to support only a couple of languages or for some reason, or you disagree with the labels from the intl package, you can set the days to any strings. In this example, I used emojis to represent days, so for example "😎" is for Sunday.'),
        WeekdaySelector(
          // We display the last tapped value in the example app
          onChanged: printIntAsDay,
          values: valuesSaturdaySunday,
          shortWeekdays: [
            '😎', // Sunday
            '🌚', // MOONday
            '👽', // https://en.wikipedia.org/wiki/Names_of_the_days_of_the_week
            '🙂', // I ran out of ideas...
            '🍺', // Thirst-day
            '🍻', // It's Friday, Friday, Gotta get down on Friday!
            '🆓', // Everybody's lookin' forward to the weekend, weekend
          ],
        ),
      ],
    );
  }
}

class ShortAndNarrowGermanExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DateSymbols de = dateTimeSymbolMap()['de'];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
            'Use of the intl package is recommended in case you need to support multiple languages. This example is using the German date symbols\' "STANDALONESHORTWEEKDAYS" property.'),
        WeekdaySelector(
          // We display the last tapped value in the example app
          onChanged: printIntAsDay,
          values: List.filled(7, true),
          weekdays: de.STANDALONEWEEKDAYS,
          shortWeekdays: de.STANDALONESHORTWEEKDAYS,
          firstDayOfWeek: de.FIRSTDAYOFWEEK + 1,
        ),
        Text(
            'This example is using the German date symbols\' "STANDALONENARROWWEEKDAYS" property. Use the narrow weekdays if you want a *really short* version of the weekdays.'),
        WeekdaySelector(
          onChanged: printIntAsDay,
          values: List.filled(7, true),
          weekdays: de.STANDALONEWEEKDAYS,
          shortWeekdays: de.STANDALONENARROWWEEKDAYS,
          firstDayOfWeek: de.FIRSTDAYOFWEEK + 1,
        ),
      ],
    );
  }
}

class RegionMattersSpanishExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    final DateSymbols mx = dateTimeSymbolMap()['es_MX'];
    final DateSymbols es = dateTimeSymbolMap()['es_ES'];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
            'The same language from two different countries might use different abbreviations for the weekdays or might start the week with a different value.\n\nIn this example, we used "es_MX" and "es_ES" that correspond to Mexico and Spain. In Mexico, miércoles is abbreviated to M, in Spain, it is X. In Mexico, weeks start with Saturday, and in Spain they start with Sunday.\n\nSaturday and Sunday are the selected days.'),
        WeekdaySelector(
          onChanged: printIntAsDay,
          values: valuesSaturdaySunday,
          weekdays: mx.STANDALONEWEEKDAYS,
          shortWeekdays: mx.STANDALONENARROWWEEKDAYS,
          firstDayOfWeek: mx.FIRSTDAYOFWEEK + 1,
        ),
        WeekdaySelector(
          onChanged: printIntAsDay,
          values: valuesSaturdaySunday,
          weekdays: es.STANDALONEWEEKDAYS,
          shortWeekdays: es.STANDALONENARROWWEEKDAYS,
          firstDayOfWeek: es.FIRSTDAYOFWEEK + 1,
        ),
      ],
    );
  }
}

final x = DateTime.monday;

const valuesSundayTuesdayThursday = <bool>[
  true,
  false,
  true,
  false,
  true,
  false,
  false,
];

const valuesSaturdaySunday = <bool>[
  // Sunday
  true,
  // Monday-Friday
  ...[false, false, false, false, false],
  // Saturday
  true,
];

class ThemedSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WeekdaySelectorTheme(
      data: WeekdaySelectorThemeData(
        color: Colors.red,
        fillColor: Colors.white70,
        selectedFillColor: Colors.red,
        // Warning: text style overwrites this!
        selectedColor: Colors.black,
        selectedTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          // Beautiful!
          decoration: TextDecoration.combine([
            TextDecoration.overline,
            TextDecoration.underline,
          ]),
          decorationColor: Colors.amber,
          decorationThickness: 4,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Did you notice how every selector so far was blue? '
            'The weekday selector widget automatically picks its color based on your theme. '
            'The package also has its own theme widget: MaterialWeekdaySelectorTheme. '
            'With this widget, you control the appearance of multiple weekday selectors. '
            'You can still overwrite the theme by passing values directly to the widget.',
          ),
          WeekdaySelector(
            onChanged: printIntAsDay,
            values: valuesSundayTuesdayThursday,
          ),
          WeekdaySelector(
            onChanged: printIntAsDay,
            values: valuesSundayTuesdayThursday,
            // Overwrites the theme.
            selectedFillColor: Colors.green,
          ),
        ],
      ),
    );
  }
}

/// Demo how to change the first day of week.
class FirstDayOfWeekExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
            'The first day of the week changes from country to country. You can use the "first day of week" parameter to configure this value.'),
        Text('If firstDayOfWeek is omitted, Monday is used.'),
        WeekdaySelector(
          onChanged: printIntAsDay,
          values: valuesSundayTuesdayThursday,
        ),
        Text('First day is Sunday:'),
        WeekdaySelector(
          onChanged: printIntAsDay,
          values: valuesSundayTuesdayThursday,
          firstDayOfWeek: DateTime.sunday,
        ),
        Text('First day is Thursday:'),
        WeekdaySelector(
          onChanged: printIntAsDay,
          values: valuesSundayTuesdayThursday,
          firstDayOfWeek: DateTime.thursday,
        ),
      ],
    );
  }
}

final monday = DateTime.monday;
