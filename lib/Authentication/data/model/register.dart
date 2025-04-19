// ignore_for_file: public_member_api_docs, sort_constructors_first
class Register {
  String name;
  String type;
  String phone;
  String password;

  Register({
    required this.name,
    required this.type,
    required this.phone,
    required this.password,
  });

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        name: json['name'] as String,
        type: json['type'] as String,
        phone: json['phone'] as String,
        password: json['password'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'phone': phone,
        'password': password,
      };
}
