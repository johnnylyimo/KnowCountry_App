import 'package:flutter/material.dart';
import 'package:search_country/services/networking.dart';

class AllCountriesHomePage extends StatefulWidget {
  @override
  _AllCountriesHomePageState createState() => _AllCountriesHomePageState();
}

class _AllCountriesHomePageState extends State<AllCountriesHomePage> {
  Future<dynamic> getCountries() async {
    var response =
        await GetHttp('https://restcountries.eu/rest/v2/all').getData();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
