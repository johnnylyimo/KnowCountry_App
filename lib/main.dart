import 'package:flutter/material.dart';
import 'package:search_country/screens/splash_screen.dart';

void main() => runApp(KnowCountry());

class KnowCountry extends StatelessWidget {
  final TextTheme textTheme = TextTheme(
    title: TextStyle(
      fontSize: 24.0,
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Country App',
      theme: ThemeData(
        textTheme: textTheme,
        primaryColor: Colors.deepPurple.shade300,
        scaffoldBackgroundColor: Colors.indigo.shade100,
      ),
      home: SplashScreen(),
    );
  }
}
