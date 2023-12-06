import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texas_real_state/models/product_model.dart';
import 'image_picker_state.dart';
import "../repos/repositories.dart";

enum ImageUploaderEvent { selectImages, upload }

class BlocImagePicker extends Bloc<ImageUploaderEvent, ImagePickerState> {
  BlocImagePicker()
      : super(ImagePickerState(images: [], uploadedProduct: null));
  @override
  Stream<ImagePickerState> mapEventToState(ImageUploaderEvent event) async* {
    switch (event) {
      case ImageUploaderEvent.selectImages:
        final picker = ImagePicker();
        final pickedFiles = await picker.pickMultiImage();
        if (pickedFiles.length > 0) {
          pickedFiles.forEach((file) {
            state.images.add(File(file.path));
          });

          yield ImagePickerState(images: state.images, uploadedProduct: null);
        }
        break;

      case ImageUploaderEvent.upload:
        UserRepository _userRepo = UserRepository();
        ProductModel product =
            await _userRepo.uploadProductImage(state.images.first);
        state.uploadedProduct = product;
        yield ImagePickerState(
            images: [], uploadedProduct: state.uploadedProduct);
        break;
    }
  }
}
