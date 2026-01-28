class BankilyUser {
  const BankilyUser({
    required this.phoneNumber,
    required this.name,
    required this.password,
    this.token = "",
  });
  final String phoneNumber;
  final String name;
  final String password;
  final String token;

  factory BankilyUser.fromJson(Map<String, dynamic> json) {
    return BankilyUser(
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      password: json['password'],
    );
  }
}
