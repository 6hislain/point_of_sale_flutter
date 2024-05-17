class Supplier {
  final int? id;
  final String tin;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String country;
  final DateTime createdAt;

  Supplier({
    this.id,
    required this.tin,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.country,
    DateTime? createdAt,
  }): createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'tin': tin,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'country': country,
      'createdAt': createdAt,
    };
  }

  factory Supplier.fromMap(Map<String, dynamic> map) {
    return Supplier(
      id: map['id'],
      tin: map['tin'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      country: map['country'],
      createdAt: map['createdAt'],
    );
  }
}

