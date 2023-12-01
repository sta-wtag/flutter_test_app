import 'package:flutter/material.dart';
import 'package:texas_real_state/bloc/image_picker_state.dart';
import '../bloc/image_picker_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/ImageViewerListTile.dart';

class ImageLists extends StatelessWidget {
  const ImageLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ImageLists'),
        ),
        body: Center(
          child: BlocBuilder<BlocImagePicker, ImagePickerState>(
              builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                return ImageViewerListTile(
                    imageTitle: 'test', imagePath: state.images[index]);
              },
            );
          }),
        ));
  }
}
