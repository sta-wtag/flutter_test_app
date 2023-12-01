import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_state.dart';

enum ImageUploaderEvent { upload }

class BlocImagePicker extends Bloc<ImageUploaderEvent, ImagePickerState> {
  BlocImagePicker() : super(ImagePickerState(images: []));

  @override
  Stream<ImagePickerState> mapEventToState(ImageUploaderEvent event) async* {
    switch (event) {
      case ImageUploaderEvent.upload:
        final picker = ImagePicker();
        final pickedFiles = await picker.pickMultiImage();
        if (pickedFiles.length > 0) {
          pickedFiles.forEach((file) {
            state.images.add(File(file.path));
          });

          yield ImagePickerState(images: state.images);
        }
        break;
    }
  }
}
