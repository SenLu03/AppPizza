class ProductDetail {
  int id;
  String productName, sizeName, cakeBaseName;
  String name;
  int price;
  int quatity;

  ProductDetail(
      this.id, this.name, this.productName, this.sizeName, this.cakeBaseName, this.price, this.quatity);

  // Chuyển đổi từ đối tượng ProductDetail sang dạng Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name':name,
      'productName': productName,
      'sizeName': sizeName,
      'cakeBaseName': cakeBaseName,
      'price': price,
      'quatity': quatity,
    };
  }

  // Tạo đối tượng ProductDetail từ dữ liệu Map
  factory ProductDetail.fromJson(Map<String, dynamic> map) {
    return ProductDetail(
      map['id'],
      map['name']??'',
      map['productName']??'',
      map['sizeName']??'',
      map['cakeBaseName']??'',
      map['price'] ?? 0,
      map['quatity']?? 1,
    );
  }

}
