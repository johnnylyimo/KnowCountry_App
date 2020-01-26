import 'package:flutter/material.dart';

class BackCountryInfoCard extends StatelessWidget {
  final String data;
  BackCountryInfoCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade200,
      elevation: 10,
      child: Center(
        child: Text(
          data,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}

// **********************************************

class FrontCountryInfoCard extends StatelessWidget {
  final String title;
  FrontCountryInfoCard({this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple.shade300,
      elevation: 10.0,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
