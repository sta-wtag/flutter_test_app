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
        body: Card(
          child: BlocBuilder<BlocImagePicker, ImagePickerState>(
              builder: (context, state) {
            if (state.images.length > 0) {
              return Column(
                children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.images.length,
                    itemBuilder: (context, index) {
                      return ImageViewerListTile(
                          imageTitle: 'test', imagePath: state.images[index]);
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<BlocImagePicker>(context)
                            .add(ImageUploaderEvent.upload);
                      },
                      child: Icon(Icons.upload))
                ],
              );
            } else if (state.uploadedProduct != null) {
              return ListTile(
                title: Text(state.uploadedProduct?.title ?? 'test'),
                subtitle: Image.network(
                  state.uploadedProduct?.image ?? '',
                  width: 100,
                  height: 100,
                ),
              );
            }
            return Text('No Data');
          }),
        ));
  }
}
