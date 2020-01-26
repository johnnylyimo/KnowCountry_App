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
