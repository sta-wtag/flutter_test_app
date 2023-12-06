import 'dart:convert';
// import 'dart:developer';
// import 'dart:html';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = 'c93ded4914a8a06152d221044163aafe';

  Future<ItemModel> fetchMovieList() async {
    try {
      final response = await client.get(Uri.parse(
          "http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"));
      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body);
        return ItemModel.fromJson(temp);
      } else {
        throw Exception('Failed to load post');
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
