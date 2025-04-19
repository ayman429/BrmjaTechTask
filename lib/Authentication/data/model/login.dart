class Login {
  String phone;
  String password;
  Login({
    required this.phone,
    required this.password,
  });
  factory Login.fromJson(Map<String, dynamic> json) => Login(
        phone: json['phone'] as String,
        password: json['password'] as String,
      );
  Map<String, dynamic> toJson() => {
        'phone': phone,
        'password': password,
      };
}
