import 'package:texas_real_state/models/product_model.dart';
import 'package:texas_real_state/widgets/image_picker.dart';

import 'image_picker_bloc.dart';

class ImagePickerState {
  List images;
  ProductModel? product = {};

  ImagePickerState({required this.images, this.product});
}
