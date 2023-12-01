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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Choose Images to upload',
            ),
            const ImagePicker(),
            const Text('Go to Users Page'),
            FloatingActionButton(
              onPressed: () async {
                await Navigator.pushNamed(context, '/user-lists');
              },
              child: const Icon(Icons.verified_user_rounded),
            )
          ],
        ),
      ),
    );
  }
}
