class Category {
  final int? id;
  final String name;
  final DateTime createdAt;
  final String categoryType;

  Category({
    this.id,
    required this.name,
    DateTime? createdAt,
    required this.categoryType,
  }): createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'categoryType': categoryType
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
      createdAt: map['createdAt'],
      categoryType: map['categoryType'],
    );
  }
}

// TODO: type: raw material, finished products, service
