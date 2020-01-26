import 'package:flutter/material.dart';
import 'package:search_country/services/networking.dart';

class AllCountriesHomePage extends StatefulWidget {
  @override
  _AllCountriesHomePageState createState() => _AllCountriesHomePageState();
}

class _AllCountriesHomePageState extends State<AllCountriesHomePage> {
  bool isSearching = false;
  List countries = [];
  List filterCountries = [];

  // async-await method get data from API
  Future<dynamic> getCountries() async {
    var response =
        await GetHttp('https://restcountries.eu/rest/v2/all').getData();
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: !isSearching
            ? Text('All Countries')
            : TextField(
                onChanged: (value) {},
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  hintText: 'Type here, Search Country',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
        actions: <Widget>[],
      ),
    );
  }
}
