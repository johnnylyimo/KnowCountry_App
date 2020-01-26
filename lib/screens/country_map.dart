import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CountryMap extends StatefulWidget {
  String countryName;
  List latlng;
  CountryMap(this.countryName, this.latlng);

  @override
  _CountryMapState createState() => _CountryMapState();
}

class _CountryMapState extends State<CountryMap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
