import 'package:flutter/material.dart';
import 'package:search_country/screens/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AllCountriesHomePage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
