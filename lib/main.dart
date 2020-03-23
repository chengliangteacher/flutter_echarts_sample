import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

import 'extension.dart' show chart_ext;
import 'map.dart' show map;
import 'country_marker_option.dart' show country_marker_chart_option;
import 'circle_marker_option.dart' show circle_marker_chart_option;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echarts sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Echarts sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Echarts(
            extensions: [map, chart_ext],
            // option: circle_marker_chart_option, // Provides a circle pointer style of marker for each country.
            option: country_marker_chart_option, // Marks the whole country with a different color based on the population.
          ),
        ),
      ),
    );
  }
}
