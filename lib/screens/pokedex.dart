import 'package:flutter/material.dart';
import 'package:pokedex/api/api.dart';
import 'package:pokedex/component/PokedexAppBar.dart';
import 'package:pokedex/model/pokedexmodel.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/screens/pokemonStats.dart';

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
      appBar: PokedexAppBar(),
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
          child: FutureBuilder<ListPokemon>(
              future: api.getPokedex("1"),
              builder:
                  (BuildContext context, AsyncSnapshot<ListPokemon> snapshot) {
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
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PokemonStats(
                                        idPokemon: (index + 1).toString(),
                                      )),
                            );
                          },
                          child: Container(
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
                                      color: Color(0xFF1a6a9f),
                                      spreadRadius: 3),
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
                                    pokemon[index]
                                        .pokemonSpecies
                                        .name
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontFamily: "Pokemon",
                                        fontSize: 22),
                                  )
                                ],
                              )),
                        );
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
