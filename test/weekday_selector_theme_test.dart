import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weekday_selector/weekday_selector.dart';

final Matcher throwsAssertionError = throwsA(isA<AssertionError>());
final Matcher dontThrowAssertionError = isNot(throwsA(isA<AssertionError>()));

void main() {
  group('$WeekdaySelectorThemeData', () {
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
      List<DiagnosticsNode> properties;

      findByName(List<DiagnosticsNode> properties, String name) {
        return properties.firstWhere((n) => n.name == name);
      }

      setUp(() {
        final themeData = buildThemeData();
        final builder = DiagnosticPropertiesBuilder();
        themeData.debugFillProperties(builder);
        properties = builder.properties;
      });

      // I have no idea what I'm doing... :)
      // These tests might not make much sense yet

      test('count', () {
        // 19 + text styles optional
        expect(properties, hasLength(greaterThanOrEqualTo(19)));
      });

      test('feedback', () {
        final feedback = findByName(properties, 'feedback');
        expect(feedback, isA<FlagProperty>());
        expect(feedback.value, true);
        expect(feedback.toDescription(), 'enabled');
      });

      test('color', () {
        final color = findByName(properties, 'color');
        expect(color, isA<ColorProperty>());
      });

      test('selectedColor', () {
        final selectedColor = findByName(properties, 'selectedColor');
        expect(selectedColor, isA<ColorProperty>());
      });

      test('disabledColor', () {
        final disabledColor = findByName(properties, 'disabledColor');
        expect(disabledColor, isA<ColorProperty>());
      });

      test('fillColor', () {
        final fillColor = findByName(properties, 'fillColor');
        expect(fillColor, isA<ColorProperty>());
      });

      test('selectedFillColor', () {
        final selectedFillColor = findByName(properties, 'selectedFillColor');
        expect(selectedFillColor, isA<ColorProperty>());
      });

      test('disabledFillColor', () {
        final disabledFillColor = findByName(properties, 'disabledFillColor');
        expect(disabledFillColor, isA<ColorProperty>());
      });

      test('focusColor', () {
        final focusColor = findByName(properties, 'focusColor');
        expect(focusColor, isA<ColorProperty>());
      });

      test('selectedFocusColor', () {
        final selectedFocusColor = findByName(properties, 'selectedFocusColor');
        expect(selectedFocusColor, isA<ColorProperty>());
      });

      test('hoverColor', () {
        final hoverColor = findByName(properties, 'hoverColor');
        expect(hoverColor, isA<ColorProperty>());
      });

      test('selectedHoverColor', () {
        final selectedHoverColor = findByName(properties, 'selectedHoverColor');
        expect(selectedHoverColor, isA<ColorProperty>());
      });

      test('selectedSplashColor', () {
        final selectedSplashColor =
            findByName(properties, 'selectedSplashColor');
        expect(selectedSplashColor, isA<ColorProperty>());
      });

      test('elevation', () {
        final elevation = findByName(properties, 'elevation');
        expect(elevation, isA<DoubleProperty>());
      });

      test('disabledElevation', () {
        final disabledElevation = findByName(properties, 'disabledElevation');
        expect(disabledElevation, isA<DoubleProperty>());
      });

      test('selectedElevation', () {
        final selectedElevation = findByName(properties, 'selectedElevation');
        expect(selectedElevation, isA<DoubleProperty>());
      });
    });
  });

  group('$WeekdaySelectorTheme', () {
    group('constructor', () {
      test('asserts data is not null', () {
        expect(
          () => WeekdaySelectorTheme(data: null),
          throwsAssertionError,
        );
      });

      test('works?', () {
        expect(
          () => WeekdaySelectorTheme(data: buildThemeData()),
          dontThrowAssertionError,
        );
      });
    });

    group('updateShouldNotify', () {
      test('notify when data is different', () {
        final theme1 = WeekdaySelectorTheme(data: buildThemeData());
        final theme2 = WeekdaySelectorTheme(data: buildThemeData(Colors.black));
        expect(theme1.updateShouldNotify(theme2), true);
      });
      test('do not notify when data is the same', () {
        final theme1 = WeekdaySelectorTheme(data: buildThemeData());
        final theme2 = WeekdaySelectorTheme(data: buildThemeData());
        expect(theme1.updateShouldNotify(theme2), false);
      });
    });
  });

  group('$WeekdaySelectorTheme with the $WeekdaySelector widget - not selected',
      () {
    // For these tests, the only important thing is that Monday isn't selected,
    // let's just use the same values for all test cases.
    const values = [null, false, null, null, null, null, null];

    testWidgets(
      'text color uses material theme by default',
      (t) async {
        final widget = MaterialApp(
          theme: ThemeData(
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.dark(surface: Colors.green),
            ),
          ),
          home: WeekdaySelector(onChanged: null, values: values),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
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
            child: WeekdaySelector(onChanged: null, values: values),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
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
                child: WeekdaySelector(onChanged: null, values: values),
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
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
                values: values,
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
        expect(aButton.fillColor, Colors.deepOrange);
      },
    );
  });
  group('$WeekdaySelectorTheme with the $WeekdaySelector widget - selected',
      () {
    // For these tests, the only important thing is that Monday isn't selected,
    // let's just use the same values for all test cases.
    const values = [null, true, null, null, null, null, null];

    testWidgets(
      'text color uses material theme by default',
      (t) async {
        final widget = MaterialApp(
          theme: ThemeData(
            buttonTheme: ButtonThemeData(
              colorScheme: ColorScheme.dark(primary: Colors.black),
            ),
          ),
          home: WeekdaySelector(onChanged: (_) {}, values: values),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
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
            child: WeekdaySelector(onChanged: (_) {}, values: values),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
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
                child: WeekdaySelector(onChanged: (_) {}, values: values),
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
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
                values: values,
              ),
            ),
          ),
        );
        await t.pumpWidget(widget);
        final RawMaterialButton aButton =
            find.byType(RawMaterialButton).evaluate().first.widget;
        expect(aButton.fillColor, Colors.lightBlue);
      },
    );
  });

  group('wrap', () {
    // It's probably stupid. Maybe we should skip it?
    testWidgets('I guess works????????', (t) async {
      Widget wrapped;
      final themeKey = GlobalKey();
      final widget = MaterialApp(
        home: WeekdaySelectorTheme(
          key: themeKey,
          data: buildThemeData(),
          child: Builder(
            builder: (context) {
              return FlatButton(
                child: Text('Tap me'),
                onPressed: () {
                  final WeekdaySelectorTheme typedTheme =
                      themeKey.currentWidget;
                  wrapped = typedTheme.wrap(context, Text('Wrapped!'));
                },
              );
            },
          ),
        ),
      );
      await t.pumpWidget(widget);
      final buttonFinder = find.text('Tap me');
      expect(buttonFinder, findsOneWidget);
      await t.tap(buttonFinder);

      expect(wrapped, isNot(null));
      await t.pumpWidget(MaterialApp(home: wrapped));
      expect(find.text('Wrapped!'), findsOneWidget);
      expect(find.byType(WeekdaySelectorTheme), findsNothing);
    });

    // It's probably stupid. Maybe we should skip it?
    testWidgets('I guess works????????', (t) async {
      Widget wrapped;
      final themeKey = GlobalKey();
      final widget = MaterialApp(
        home: WeekdaySelectorTheme(
          key: themeKey,
          data: buildThemeData(Colors.green),
          child: WeekdaySelectorTheme(
            data: buildThemeData(Colors.red),
            child: Builder(
              builder: (context) {
                return FlatButton(
                  child: Text('Tap me'),
                  onPressed: () {
                    final WeekdaySelectorTheme typedTheme =
                        themeKey.currentWidget;
                    wrapped = typedTheme.wrap(context, Text('Wrapped!'));
                  },
                );
              },
            ),
          ),
        ),
      );
      await t.pumpWidget(widget);
      final buttonFinder = find.text('Tap me');
      expect(buttonFinder, findsOneWidget);
      await t.tap(buttonFinder);

      expect(wrapped, isNot(null));
      await t.pumpWidget(MaterialApp(home: wrapped));
      expect(find.text('Wrapped!'), findsOneWidget);
      final themeFinder = find.byType(WeekdaySelectorTheme);
      expect(themeFinder, findsOneWidget);
      final WeekdaySelectorTheme theme = themeFinder.evaluate().first.widget;
      expect(theme.data.color, Colors.green);
    });
  });
}

WeekdaySelectorThemeData buildThemeData([Color color]) {
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
