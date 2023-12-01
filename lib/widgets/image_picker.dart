import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/image_picker_bloc.dart';

class ImagePicker extends StatefulWidget {
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        BlocProvider.of<BlocImagePicker>(context)
            .add(ImageUploaderEvent.upload);
        Navigator.pushNamed(context, '/image-lists');
      },
      child: Icon(Icons.image),
    );
  }
}
