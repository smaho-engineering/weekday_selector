import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weekday_selector/weekday_selector.dart';

extension on List<DiagnosticsNode> {
  DiagnosticsNode find(String name) {
    return firstWhere((dn) => dn.name == name);
  }
}

void main() {
  WeekdaySelectorThemeData buildThemeData([Color? color]) {
    return WeekdaySelectorThemeData(
      enableFeedback: true,
      color: color ?? Colors.red,
      selectedColor: Colors.blue,
      disabledColor: Colors.green,
      fillColor: Colors.yellow,
      elevation: 1,
      selectedElevation: 2,
      disabledElevation: 3,
    );
  }

  group(WeekdaySelectorThemeData, () {
    group('overrides equals operator', () {
      test('equal', () {
        expect(
          buildThemeData(),
          equals(buildThemeData()),
        );
      });

      test('not equal', () {
        expect(
          buildThemeData(Colors.amber),
          isNot(equals(buildThemeData())),
        );
      });
    });

    group('overrides hash code', () {
      test('matching hash codes', () {
        final set = <WeekdaySelectorThemeData>{};
        set.add(buildThemeData());
        set.add(buildThemeData());
        expect(set, hasLength(1));
      });

      test('different hash codes', () {
        final set = <WeekdaySelectorThemeData>{};
        set.add(buildThemeData());
        set.add(buildThemeData(Colors.black));
        expect(set, hasLength(2));
      });
    });

    group('debugFillProperties', () {
      late List<DiagnosticsNode> properties;

      setUpAll(() {
        final builder = DiagnosticPropertiesBuilder();
        buildThemeData().debugFillProperties(builder);
        properties = builder.properties;
      });

      test('feedback', () {
        final feedback = properties.find('feedback');
        expect(feedback, isA<FlagProperty>());
        expect(feedback.value, true);
        expect(feedback.toDescription(), 'enabled');
      });

      test('color', () {
        expect(properties.find('color'), isA<ColorProperty>());
      });

      test('selectedColor', () {
        expect(properties.find('selectedColor'), isA<ColorProperty>());
      });

      test('disabledColor', () {
        expect(properties.find('disabledColor'), isA<ColorProperty>());
      });

      test('fillColor', () {
        expect(properties.find('fillColor'), isA<ColorProperty>());
      });

      test('selectedFillColor', () {
        expect(properties.find('selectedFillColor'), isA<ColorProperty>());
      });

      test('disabledFillColor', () {
        expect(properties.find('disabledFillColor'), isA<ColorProperty>());
      });

      test('focusColor', () {
        expect(properties.find('focusColor'), isA<ColorProperty>());
      });

      test('selectedFocusColor', () {
        expect(properties.find('selectedFocusColor'), isA<ColorProperty>());
      });

      test('hoverColor', () {
        expect(properties.find('hoverColor'), isA<ColorProperty>());
      });

      test('selectedHoverColor', () {
        expect(properties.find('selectedHoverColor'), isA<ColorProperty>());
      });

      test('selectedSplashColor', () {
        expect(properties.find('selectedSplashColor'), isA<ColorProperty>());
      });

      test('elevation', () {
        expect(properties.find('elevation'), isA<DoubleProperty>());
      });

      test('disabledElevation', () {
        expect(properties.find('disabledElevation'), isA<DoubleProperty>());
      });

      test('selectedElevation', () {
        expect(properties.find('selectedElevation'), isA<DoubleProperty>());
      });
    });
  });

  group(WeekdaySelectorTheme, () {
    group('updateShouldNotify', () {
      test('notify when data is different', () {
        final theme1 = WeekdaySelectorTheme(
          child: Text(''),
          data: buildThemeData(),
        );
        final theme2 = WeekdaySelectorTheme(
          child: Text(''),
          data: buildThemeData(Colors.black),
        );
        expect(theme1.updateShouldNotify(theme2), true);
      });

      test('do not notify when data is the same', () {
        final theme1 = WeekdaySelectorTheme(
          child: Text(''),
          data: buildThemeData(),
        );
        final theme2 = WeekdaySelectorTheme(
          child: Text(''),
          data: buildThemeData(),
        );
        expect(theme1.updateShouldNotify(theme2), false);
      });
    });
  });

  group('$WeekdaySelectorTheme with the $WeekdaySelector widget - not selected',
      () {
    // For these tests, the only important thing is that Monday isn't selected.
    const mondayNotSelected = [null, false, null, null, null, null, null];

    testWidgets(
      'text color uses material theme by default',
      (t) async {
        final widget = MaterialApp(
          theme: ThemeData(
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.dark(surface: Colors.green),
            ),
          ),
          home: WeekdaySelector(onChanged: null, values: mondayNotSelected),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.green);
      },
    );

    testWidgets(
      'text color uses the theme if available',
      (t) async {
        final widget = MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: WeekdaySelectorTheme(
            data: WeekdaySelectorThemeData(fillColor: Colors.red),
            child: WeekdaySelector(onChanged: null, values: mondayNotSelected),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.red);
      },
    );

    testWidgets(
      'text color uses the nearest theme if multiple available',
      (t) async {
        final widget = MaterialApp(
          home: WeekdaySelectorTheme(
            data: WeekdaySelectorThemeData(fillColor: Colors.cyanAccent),
            child: WeekdaySelectorTheme(
              data: WeekdaySelectorThemeData(fillColor: Colors.purple),
              child: WeekdaySelectorTheme(
                data: WeekdaySelectorThemeData(fillColor: Colors.yellow),
                child:
                    WeekdaySelector(onChanged: null, values: mondayNotSelected),
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.yellow);
      },
    );

    testWidgets(
      'text color uses the named argument if specified (overriding any themes)',
      (t) async {
        final widget = MaterialApp(
          home: WeekdaySelectorTheme(
            data: WeekdaySelectorThemeData(fillColor: Colors.purple),
            child: WeekdaySelectorTheme(
              data: WeekdaySelectorThemeData(fillColor: Colors.yellow),
              child: WeekdaySelector(
                fillColor: Colors.deepOrange,
                onChanged: null,
                values: mondayNotSelected,
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.deepOrange);
      },
    );
  });

  group('$WeekdaySelectorTheme with the $WeekdaySelector widget - selected',
      () {
    // For these tests, the only important thing is that Monday is selected.
    const mondaySelected = [null, true, null, null, null, null, null];

    testWidgets(
      'text color uses material theme by default',
      (t) async {
        final widget = MaterialApp(
          theme: ThemeData(
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.dark(primary: Colors.black),
            ),
          ),
          home: WeekdaySelector(onChanged: (_) {}, values: mondaySelected),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.black);
      },
    );

    testWidgets(
      'text color uses the theme if available',
      (t) async {
        final widget = MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: WeekdaySelectorTheme(
            data: WeekdaySelectorThemeData(selectedFillColor: Colors.cyan),
            child: WeekdaySelector(onChanged: (_) {}, values: mondaySelected),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.cyan);
      },
    );

    testWidgets(
      'text color uses the nearest theme if multiple available',
      (t) async {
        final widget = MaterialApp(
          home: WeekdaySelectorTheme(
            data: WeekdaySelectorThemeData(selectedFillColor: Colors.lightBlue),
            child: WeekdaySelectorTheme(
              data: WeekdaySelectorThemeData(selectedFillColor: Colors.grey),
              child: WeekdaySelectorTheme(
                data: WeekdaySelectorThemeData(selectedFillColor: Colors.lime),
                child:
                    WeekdaySelector(onChanged: (_) {}, values: mondaySelected),
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.lime);
      },
    );

    testWidgets(
      'text color uses the named argument if specified (overriding any themes)',
      (t) async {
        final widget = MaterialApp(
          home: WeekdaySelectorTheme(
            data: WeekdaySelectorThemeData(selectedFillColor: Colors.lime),
            child: WeekdaySelectorTheme(
              data: WeekdaySelectorThemeData(selectedFillColor: Colors.orange),
              child: WeekdaySelector(
                selectedFillColor: Colors.lightBlue,
                onChanged: (_) {},
                values: mondaySelected,
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton = find
            .byType(RawMaterialButton)
            .evaluate()
            .first
            .widget as RawMaterialButton;
        expect(aButton.fillColor, Colors.lightBlue);
      },
    );
  });
}
