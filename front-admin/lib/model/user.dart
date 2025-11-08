class User {
  final int? id;
  final String? name; // maps to backend "username"
  final String? email;
  final String password;
  final String? phone;
  final DateTime? createdAt;
  bool? approve; // added approve field

  User({
    this.id,
    this.name,
    this.email,
    required this.password,
    this.phone,
    this.createdAt,
    this.approve,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['username'], // <- backend sends "username"
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      approve: json['approve'] != null ? json['approve'] as bool : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": name, // <- backend expects "username" when creating user
      "email": email,
      "password": password,
      "phone": phone,
      "approve": approve,
    };
  }
}
