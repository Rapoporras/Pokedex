import 'package:http/http.dart';
import 'package:pokedex/model/pokedexmodel.dart';
import 'package:pokedex/model/pokemonModel.dart';

class API {
  final Client _client = Client();

  Future<ListPokemon> getPokedex(String id) async {
    ListPokemon pokedex;
    String stringUrl = "https://pokeapi.co/api/v2/pokedex/" + id + "/";

    final response = await _client.get(stringUrl);

    pokedex = listPokemonFromJson(response.body);

    return pokedex;
  }

  Future<Pokemon> getPokemon(String id) async {
    Pokemon pokekon;
    String stringUrl = "https://pokeapi.co/api/v2/pokemon/" + id + "/";

    final response = await _client.get(stringUrl);

    pokekon = pokemonFromJson(response.body);

    return pokekon;
  }
}
