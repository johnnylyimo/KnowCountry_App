import 'package:flutter/material.dart';
import 'package:search_country/screens/country_map.dart';
import 'package:search_country/utils/custom_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          country['name'],
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: OrientationBuilder(builder: (context, orientation) {
            return GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  crossAxisSpacing: 2.0),
              children: <Widget>[
                FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: FrontCountryInfoCard(
                    title: 'Capital',
                  ),
                  back: BackCountryInfoCard(
                    data: country['capital'],
                  ),
                ),
                FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: FrontCountryInfoCard(
                    title: 'Population',
                  ),
                  back: BackCountryInfoCard(
                    data: country['population'].toString(),
                  ),
                ),
                FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: FrontCountryInfoCard(
                    title: 'Flag',
                  ),
                  back: Card(
                    color: Colors.deepPurple.shade200,
                    elevation: 10.0,
                    child: Center(
                      child: SvgPicture.network(
                        country['flag'],
                        width: 200.0,
                        height: 200.0,
                      ),
                    ),
                  ),
                ),
                FlipCard(
                  direction: FlipDirection.VERTICAL,
                  front: FrontCountryInfoCard(
                    title: 'Currency',
                  ),
                  back: BackCountryInfoCard(
                    data: country['currencies'][0]['name'],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryMap(country['name'], country['latlng']),
                      ),
                    );
                  },
                  child: FrontCountryInfoCard(
                    title: 'Show Map',
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
