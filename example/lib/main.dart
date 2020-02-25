import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Weekday Selector Example';
    return MaterialApp(
      title: title,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Center(
          child: MaterialWeekdaySelector(
            onChanged: print,
            values: [
              true,
              false,
              false,
              false,
              false,
              false,
              true,
            ],
          ),
        ),
      ),
    );
  }
}
