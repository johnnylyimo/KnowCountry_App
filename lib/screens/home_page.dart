import 'package:flutter/material.dart';
import 'package:search_country/services/networking.dart';
import 'package:search_country/screens/country.dart';
import 'package:connectivity/connectivity.dart';

class AllCountriesHomePage extends StatefulWidget {
  @override
  _AllCountriesHomePageState createState() => _AllCountriesHomePageState();
}

class _AllCountriesHomePageState extends State<AllCountriesHomePage> {
  bool isSearching = false;
  List countries = []; // store countries from API
  List filterCountries = []; // store filtered countries

  // async-await method get data from API
  getCountries() async {
    var response =
    await GetHttp('https://restcountries.eu/rest/v2/all').getData();
    return response;
  }

  void _filterCountries(value) {
    setState(() {
      filterCountries = countries
          .where((country) =>
          country['name']
              .toLowerCase()
              .contains(value.trim().toLowerCase()))
          .toList();
    });
  }


  _showDialog(){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No Internet Connnection!', textAlign: TextAlign.center,),
            content: Text('Please turn on Internet,\nthen Close and Open again this App', textAlign: TextAlign.center,),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            backgroundColor: Colors.deepPurple.shade100,
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ],

          );
        }

    );
  }


  //Check device is connected to the internet or not.
  void checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      getCountries().then((data) {
        setState(() {
          countries = filterCountries = data;
        });
      });
    } else {
      _showDialog();
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getCountries().then((data) {
//      setState(() {
//        countries = filterCountries = data;
//      });
//    });
    checkInternetConnectivity();
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: !isSearching
              ? Text(
            'All Countries',
            style: Theme
                .of(context)
                .textTheme
                .title,
          )
              : TextField(
            onChanged: (value) {
              _filterCountries(value);
            },
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
                  height: 720.0,
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
                      ? ListView.builder(
                      itemCount: filterCountries.length,
                      itemBuilder: (context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    Country(filterCountries[index]),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 10.0,
                            color: Colors.indigo.shade200,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(filterCountries[index]['name']),
                            ),
                          ),
                        );
                      })
                      : Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
