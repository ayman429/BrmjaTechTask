class Verify {
  String phone;
  String? code;

  Verify({required this.phone, this.code});

  factory Verify.fromJson(Map<String, dynamic> json) => Verify(
        phone: json['phone'] as String,
        code: json['code'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'code': code,
      };
}
