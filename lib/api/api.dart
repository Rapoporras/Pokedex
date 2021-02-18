import 'package:http/http.dart';
import 'package:pokedex/model/pokedexmodel.dart';

class API {
  final Client _client = Client();

  Future<Pokemon> getPokemon(String tournamet) async {
    Pokemon matchesList;
    String stringUrl = "https://pokeapi.co/api/v2/pokedex/1/";

    final response = await _client.get(stringUrl);

    matchesList = pokemonFromJson(response.body);

    return matchesList;
  }
}
