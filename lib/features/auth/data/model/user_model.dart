class UserModel {
  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String? address;
  final double? latitude;
  final double? longitude;
  final String role;
  final DateTime? dateJoined;
  final String? telegramUsername;

  UserModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.address,
    this.latitude,
    this.longitude,
    required this.role,
    this.dateJoined,
    this.telegramUsername,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      email: json['email'] ?? '',
      address: json['address'],
      latitude: json['latitude'] != null
          ? (json['latitude'] as num).toDouble()
          : null,
      longitude: json['longitude'] != null
          ? (json['longitude'] as num).toDouble()
          : null,
      role: json['role'] ?? '',
      dateJoined: json['date_joined'] != null
          ? DateTime.parse(json['date_joined'])
          : null,
      telegramUsername: json['telegram_username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'email': email,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'role': role,
      'date_joined': dateJoined?.toIso8601String(),
      'telegram_username': telegramUsername,
    };
  }
}
