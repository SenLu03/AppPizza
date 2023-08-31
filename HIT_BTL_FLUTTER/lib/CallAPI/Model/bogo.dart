class BOGO {
  int? id;
  String? name;
  String? image;
  String? description;
  int? price;
  int? categoryId;
  String? disPlayName;
  String? appertizer,drink;
  int? appertizerId,drinkId;

  BOGO(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.categoryId});

  BOGO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['categoryId'] = this.categoryId;
    return data;
  }
}
