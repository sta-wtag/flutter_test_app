import '../repos/movie_api_provider.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MovieBloc {
  final _movieApiProvider = MovieApiProvider();
  final _movieFetcher = PublishSubject<ItemModel>();

  Stream<ItemModel> get allMovies => _movieFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _movieApiProvider.fetchMovieList();
    _movieFetcher.sink.add(itemModel);
  }

  dispose() {
    _movieFetcher.close();
  }
}

final bloc = MovieBloc();
