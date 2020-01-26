import 'package:flutter/material.dart';
import 'package:search_country/screens/home_page.dart';

void main() => runApp(KnowCountry());

class KnowCountry extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Country App',
      theme: ThemeData(),
      home: new AllCountriesHomePage(),
    );
  }
}
