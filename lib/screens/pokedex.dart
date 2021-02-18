import 'package:flutter/material.dart';
import 'package:pokedex/api/api.dart';
import 'package:pokedex/model/pokedexmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Pokedex extends StatefulWidget {
  Pokedex({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Pokedex createState() => _Pokedex();
}

class _Pokedex extends State<Pokedex> {
  final API api = API();
  List<PokemonEntry> pokemon = new List<PokemonEntry>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFd7d9d6), shape: BoxShape.circle),
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Color(0xFF2aacfc), shape: BoxShape.circle),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                                color: Color(0xFF186b9f),
                                shape: BoxShape.circle)),
                        Positioned(
                          left: 2,
                          top: 1,
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Color(0xFF2aacfc),
                                shape: BoxShape.circle),
                            // color: Color(0xFFa1dafd), shape: BoxShape.circle
                          ),
                        ),
                        Positioned(
                          left: 8,
                          top: 5,
                          child: Container(
                            margin: EdgeInsets.all(2.0),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: Color(0xFFa1dafd),
                                shape: BoxShape.circle),
                            // color: Color(0xFFa1dafd), shape: BoxShape.circle
                          ),
                        ),
                      ],
                    ),
                  ));
            },
          ),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(2.0),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Color(0xFFcd0a2c),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.0, color: Color(0xFF000000)),
                ),

                // color: Color(0xFFa1dafd), shape: BoxShape.circle
              ),
              Container(
                margin: EdgeInsets.all(2.0),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Color(0xFFf0e159),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.0, color: Color(0xFF000000)),
                ),
                // color: Color(0xFFa1dafd), shape: BoxShape.circle
              ),
              Container(
                margin: EdgeInsets.all(2.0),
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: Color(0xFF66b271),
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.0, color: Color(0xFF000000)),
                ),
                // color: Color(0xFFa1dafd), shape: BoxShape.circle
              ),
            ],
          )
          // actions: <Widget>[
          //   IconButton(
          //     icon: new Icon(Icons.merge_type),
          //     onPressed: () => print('hi on icon action'),
          //   ),
          // ],
          ),
      body: Container(
        color: Color(0xFFdc0a2d),
        padding: EdgeInsets.all(15),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(10)),
            color: Color(0xFF29aafd),
            border: Border.all(width: 2.0, color: Color(0xFF1a6a9f)),
            boxShadow: [
              BoxShadow(color: Color(0xFF1a6a9f), spreadRadius: 3),
            ],
          ),
          child: FutureBuilder<Pokemon>(
              future: api.getPokemon("f"),
              builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  pokemon = snapshot.data.pokemonEntries;

                  return GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 3,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(
                          snapshot.data.pokemonEntries.length, (index) {
                        return Container(
                            height: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              color: Color(0xFF1a6a9f),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF1a6a9f), spreadRadius: 3),
                              ],
                            ),
                            child: Column(
                              children: [
                                Image.network(
                                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/" +
                                      (index + 1).toString() +
                                      ".png",
                                  width: 75,
                                ),
                                Text(
                                  pokemon[index].pokemonSpecies.name,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: "Pokemon",
                                      fontSize: 18),
                                )
                              ],
                            ));
                      }));
                } else {
                  return Center(
                      child: SpinKitRotatingCircle(
                    color: Colors.white,
                    size: 50.0,
                  ));
                }
              }),
        ),
      ),
    );
  }
}
