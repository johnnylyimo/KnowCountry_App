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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Know a Country more',
              style: TextStyle(fontSize: 24.0),
            ),
            FlutterLogo(
              size: 300.0,
              colors: Colors.deepPurple,
            ),
            Text(
              'Enjoy Knowing more!',
              style: TextStyle(fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }
}
