class ProductTax {
  final int? id;
  final String name;
  final double percentage;
  final DateTime createdAt;

  ProductTax({
    this.id,
    required this.name,
    DateTime? createdAt,
    required this.percentage,
  }): createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt,
      'percentage': percentage,
    };
  }

  factory ProductTax.fromMap(Map<String, dynamic> map) {
    return ProductTax(
      id: map['id'],
      name: map['name'],
      createdAt: map['createdAt'],
      percentage: map['percentage'],
    );
  }
}
