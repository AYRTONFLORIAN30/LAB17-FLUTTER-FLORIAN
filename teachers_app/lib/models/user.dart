// models/user.dart

class User {
  final int id;
  final String name;
  final String lastName;
  final String phone;
  final String email;
  final String imageUrl;

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.imageUrl,
  });

  // Convertir de JSON a la clase User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      lastName: json['last_name'],
      phone: json['phone'],
      email: json['email'],
      imageUrl: json['imageUrl'],
    );
  }
}
