class Product {
  final int? id;
  final String name;
  final int categoryId;
  final int quantityTypeId;
  final DateTime createdAt;
  final int reorderQuantity;
  final int daysBeforeExpiry;

  Product({
    this.id,
    required this.name,
    required this.categoryId,
    required this.quantityTypeId,
    required this.reorderQuantity,
    required this.daysBeforeExpiry,
    DateTime? createdAt,
  }): createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'categoryId': categoryId,
      'quantityTypeId': quantityTypeId,
      'reorderQuantity': reorderQuantity,
      'daysBeforeExpiry': daysBeforeExpiry,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      createdAt: map['createdAt'],
      categoryId: map['categoryId'],
      quantityTypeId: map['quantityTypeId'],
      reorderQuantity: map['reorderQuantity'],
      daysBeforeExpiry: map['daysBeforeExpiry'],
    );
  }
}


