class Pizza {
  int? id;
  String? productName;
  int? categoryId;
  String? image;
  String? description;
  String? price;
  Null cakeBase;
  Null cakeSize;
  Null cakeBaseId;
  Null cakeSizeId;
  int? point;

  Pizza(
      {this.id,
      this.productName,
      this.categoryId,
      this.image,
      this.description,
      this.price,
      this.cakeBase,
      this.cakeSize,
      this.cakeBaseId,
      this.cakeSizeId,
      this.point});

  Pizza.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    categoryId = json['categoryId'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    cakeBase = json['cakeBase'];
    cakeSize = json['cakeSize'];
    cakeBaseId = json['cakeBaseId'];
    cakeSizeId = json['cakeSizeId'];
    point = json['point'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['categoryId'] = this.categoryId;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['cakeBase'] = this.cakeBase;
    data['cakeSize'] = this.cakeSize;
    data['cakeBaseId'] = this.cakeBaseId;
    data['cakeSizeId'] = this.cakeSizeId;
    data['point'] = this.point;
    return data;
  }
}
