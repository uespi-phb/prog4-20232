import 'dart:convert';

typedef ContactMap = Map<String, dynamic>;

class Contact {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String? imageUrl;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.imageUrl,
  });

  @override
  String toString() {
    return name;
  }

  Contact copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? imageUrl,
  }) =>
      Contact(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  ContactMap toMap([bool excludeId = true]) {
    return {
      if (!excludeId) 'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'imageUrl': imageUrl,
    };
  }

  String toJson([bool excludeId = true]) => jsonEncode(toMap(excludeId));
}
