import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../bloc/movies_bloc.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    return Scaffold(
        appBar: AppBar(title: Text('Popular Movies')),
        body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data?.results?.length,
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          // trailing: Hero(
          //   tag: 'dash',
          //   child: Image.network(
          //       'https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1'),
          // ),
          title: Text(snapshot.data?.results?[index].originalTitle ?? 'test'),
          subtitle: Image.network(
            'https://image.tmdb.org/t/p/w185${snapshot.data?.results?[index]?.posterPath}',
            fit: BoxFit.cover,
            height: 100,
            width: 100,
          ),
        );
      },
    );
  }
}
