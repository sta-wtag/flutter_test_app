import 'dart:convert';
import 'package:http/http.dart';
import '../models/user_model.dart';
import '../models/product_model.dart';

class UserRepository {
  String endPoint = 'https://reqres.in/api/users?page=2';
  String endPoint2 = 'https://fakestoreapi.com/products';
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endPoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<ProductModel> uploadProductImage(image) async {
    var stream = new ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var request = MultipartRequest('POST', Uri.parse(endPoint2));

    request.fields['title'] = 'test';

    var multipart = new MultipartFile('image', stream, length);

    request.files.add(multipart);

    var response = await request.send();

    if (response.statusCode == 200) {
      var resSTR = await response.stream.bytesToString();

      return getProduct(jsonDecode(resSTR)['id']);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<ProductModel> getProduct(productID) async {
    var endPoint3 = endPoint2 + '/1';
    Response response = await get(Uri.parse(endPoint3));
    print(response.body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      print(result);

      return ProductModel.fromJson(result);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
