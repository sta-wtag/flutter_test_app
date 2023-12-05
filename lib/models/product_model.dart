class ProductModel {
  final int id;
  final String title;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        id: json['id'], title: json['title'], image: json['image']);
  }
}
