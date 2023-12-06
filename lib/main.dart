import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texas_real_state/screens/UsersList.dart';
import 'widgets/image_picker.dart';
import 'screens/ImageLists.dart';
import 'screens/PopularMovieList.dart';
import '../bloc/image_picker_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlocImagePicker>(
        create: (context) => BlocImagePicker(),
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) =>
                const MyHomePage(title: 'Texas Real State Solution'),
            '/image-lists': (context) => const ImageLists(),
            '/user-lists': (context) => const UsersList(),
            '/movie-lists': (context) => MovieList(),
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Hero(
      tag: 'dash',
      child: Image.network(
          'https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1'),
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Hero(
              //   tag: 'dash',
              //   child: Image.network(
              //       'https://i0.wp.com/www.printmag.com/wp-content/uploads/2021/02/4cbe8d_f1ed2800a49649848102c68fc5a66e53mv2.gif?fit=476%2C280&ssl=1'),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Choose Images to upload',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      ImagePicker(),
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Go to Users Page',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/user-lists');
                        },
                        child: const Hero(
                            tag: 'tag-1',
                            child: Icon(Icons.supervised_user_circle_sharp)),
                      )
                    ]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Go to Movies Page',
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await Navigator.pushNamed(context, '/movie-lists');
                        },
                        child: const Icon(Icons.movie_creation),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
