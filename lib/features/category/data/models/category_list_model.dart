class CategoryListModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;
  final dynamic parent;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  CategoryListModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.icon,
    this.parent,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  // 🔥 fromJson
  factory CategoryListModel.fromJson(Map<String, dynamic> json) {
    return CategoryListModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      parent: json['parent'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? 0,
    );
  }
}
