class BankilyUser {
  const BankilyUser({
    required this.phoneNumber,
    required this.name,
    required this.password,
  });
  final String phoneNumber;
  final String name;
  final String password;

  factory BankilyUser.fromJson(Map<String, dynamic> json) {
    return BankilyUser(
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      password: json['password'],
    );
  }
}
