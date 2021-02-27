import 'package:audioplayer/audioplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex/api/google_tts.dart';
import 'package:pokedex/component/PokedexAppBar.dart';
import 'package:pokedex/model/pokemonModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../api/api.dart';

class PokemonStats extends StatefulWidget {
  PokemonStats({Key key, this.idPokemon}) : super(key: key);

  final String idPokemon;

  @override
  _PokemonStats createState() => _PokemonStats();
}

class _PokemonStats extends State<PokemonStats> {
  final API api = API();
  AudioPlayer audioPlayer = AudioPlayer();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Pokemon pokemon = new Pokemon();
  String descripcion = "";
  String getNumber(int id) {
    String pokemon = "";
    if (id < 10) {
      pokemon = "00" + id.toString();
    } else if (id >= 10 && id < 100) {
      pokemon = "0" + id.toString();
    } else {
      pokemon = id.toString();
    }

    return (pokemon);
  }

  FlutterTts flutterTts = FlutterTts();
  Future _speak(text) async {
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(1);
    await flutterTts.setPitch(1);

    await flutterTts.awaitSpeakCompletion(true);
    print(await flutterTts.getVoices);
    await flutterTts.setLanguage("es-ES");
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    firestore
        .collection('voces_pokemon')
        .doc("PQBrt2IBpMV80vFVwxL9")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("URL: " +
            documentSnapshot.get(getNumber(int.parse(widget.idPokemon)))[1]);
        descripcion =
            documentSnapshot.get(getNumber(int.parse(widget.idPokemon)))[0];
        audioPlayer.play(
            documentSnapshot.get(getNumber(int.parse(widget.idPokemon)))[1]);
      } else {
        print('Document dont exists on the database');
      }
    });

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
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Descripción: ",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xFFFFFFFF),
                                          fontFamily: "Pokemon",
                                          fontSize: 25),
                                    ),
                                  ),
                                  InkWell(
                                    child: Icon(
                                      Icons.volume_up,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    onTap: () => playfemalevoice(
                                      descripcion,
                                    ),
                                  )
                                ],
                              ),
                              Text(
                                descripcion,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: "Pokemon",
                                    fontSize: 20),
                              ),

                              //  Container(child:  SimpleBarChart( , true),)
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
