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
  getCountries() async {
    var response =
        await GetHttp('https://restcountries.eu/rest/v2/all').getData();
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountries().then((data) {
      setState(() {
        countries = filterCountries = data;
      });
    });
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
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      // negate to false to bring input field or get out of input field
                      this.isSearching = false;
                      filterCountries = countries;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      // negate to false to bring input field or get out of input field
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Container(
                height: 540.0,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade200,
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.deepPurple.shade300,
                      Colors.deepPurple.shade200,
                      Colors.deepPurple.shade100,
                    ],
                  ),
                ),
                child: filterCountries.length > 0
                    ? ListView.builder(itemCount: filterCountries.length,itemBuilder: (context, int index) {
                        return GestureDetector(
                        );
                      })
              )
            ],
          ),
        ),
      ),
    );
  }
}
