class CategoryDetail {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;
  final int categoryId;

  CategoryDetail({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.categoryId,
  });

  factory CategoryDetail.fromJson(Map<String, dynamic> json) {
    return CategoryDetail(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'].toDouble(),
      categoryId: json['categoryId'],
    );
  }
}

class CategoryDetailResponse {
  final String status;
  final List<CategoryDetail> data;

  CategoryDetailResponse({
    required this.status,
    required this.data,
  });

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) {
    return CategoryDetailResponse(
      status: json['status'],
      data: List<CategoryDetail>.from(
          json['data'].map((dataJson) => CategoryDetail.fromJson(dataJson))),
    );
  }
}