class Product {
  int id;
  String name;
  int categoryId;
  String image;
  String description;
  String price;
  String? cakeBase, caseSize, cakeSizeId;
  int point;



  Product({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.image,
    required this.description,
    required this.price,
    required this.cakeBase,
    required this.caseSize,
    required this.cakeSizeId,
    required this.point,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'productName': name,
      'categoryId': categoryId,
      'image': image,
      'description': description,
      'price': price,
      'cakeBase': cakeBase,
      'caseSize': caseSize,
      'cakeSizeId': cakeSizeId,
      'point': point,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['productName'],
      categoryId: json['categoryId'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      cakeBase: json['cakeBase'],
      caseSize: json['caseSize'],
      cakeSizeId: json['cakeSizeId'],
      point: json['point'],
    );
  }
}
