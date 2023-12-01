import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texas_real_state/screens/UsersList.dart';
import 'widgets/image_picker.dart';
import 'screens/ImageLists.dart';
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
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade900),
            useMaterial3: true,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) =>
                const MyHomePage(title: 'Texas Real State Solution'),
            '/image-lists': (context) => const ImageLists(),
            '/user-lists': (context) => const UsersList(),
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
                        child: const Icon(Icons.arrow_forward_rounded),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
