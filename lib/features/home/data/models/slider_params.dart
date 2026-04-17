class SliderParams {
  final String id;
  final String photoUrl;
  final String description;
  final dynamic product;
  final String brand;
  final dynamic category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  SliderParams({
    required this.id,
    required this.photoUrl,
    required this.description,
    this.product,
    required this.brand,
    this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  // 🔥 fromJson
  factory SliderParams.fromJson(Map<String, dynamic> json) {
    return SliderParams(
      id: json['_id'] ?? '',
      photoUrl: json['photo_url'] ?? '',
      description: json['description'] ?? '',
      product: json['product'],
      brand: json['brand'] ?? '',
      category: json['category'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? 0,
    );
  }
}
