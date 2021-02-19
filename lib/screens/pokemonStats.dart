import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/component/PokedexAppBar.dart';
import 'package:pokedex/model/pokemonModel.dart';

import '../api/api.dart';

class PokemonStats extends StatefulWidget {
  PokemonStats({Key key, this.idPokemon}) : super(key: key);

  final String idPokemon;

  @override
  _PokemonStats createState() => _PokemonStats();
}

class _PokemonStats extends State<PokemonStats> {
  final API api = API();

  Pokemon pokemon = new Pokemon();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PokedexAppBar(),
      body: Container(
          width: MediaQuery.of(context).size.width,
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
                future: api.getPokemon(widget.idPokemon),
                builder:
                    (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
                  if (snapshot.hasData &&
                      snapshot.connectionState == ConnectionState.done) {
                    pokemon = snapshot.data;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          pokemon.sprites.other.officialArtwork.frontDefault,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nº: " + pokemon.id.toString(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "Pokemon",
                                    fontSize: 25),
                              ),
                              Text(
                                "Nombre: " + pokemon.name.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "Pokemon",
                                    fontSize: 25),
                              ),
                              Text(
                                "Estadisticas: ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "Pokemon",
                                    fontSize: 25),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pokemon.stats[0].stat.name
                                                .toUpperCase() +
                                            ": " +
                                            pokemon.stats[0].baseStat
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: "Pokemon",
                                            fontSize: 25),
                                      ),
                                      Text(
                                        pokemon.stats[1].stat.name
                                                .toUpperCase() +
                                            ": " +
                                            pokemon.stats[1].baseStat
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: "Pokemon",
                                            fontSize: 25),
                                      ),
                                      Text(
                                        pokemon.stats[2].stat.name
                                                .toUpperCase() +
                                            ": " +
                                            pokemon.stats[2].baseStat
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: "Pokemon",
                                            fontSize: 25),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pokemon.stats[3].stat.name
                                                .toUpperCase() +
                                            ": " +
                                            pokemon.stats[3].baseStat
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: "Pokemon",
                                            fontSize: 25),
                                      ),
                                      Text(
                                        pokemon.stats[4].stat.name
                                                .toUpperCase() +
                                            ": " +
                                            pokemon.stats[4].baseStat
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: "Pokemon",
                                            fontSize: 25),
                                      ),
                                      Text(
                                        pokemon.stats[5].stat.name
                                                .toUpperCase() +
                                            ": " +
                                            pokemon.stats[5].baseStat
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: "Pokemon",
                                            fontSize: 25),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return Center(
                        child: SpinKitRotatingCircle(
                      color: Colors.white,
                      size: 50.0,
                    ));
                  }
                }),
          )),
    );
  }
}
