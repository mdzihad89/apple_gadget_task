import 'dart:convert';

LoginRequestDto loginRequestDtoFromJson(String str) => LoginRequestDto.fromJson(json.decode(str));

String loginRequestDtoToJson(LoginRequestDto data) => json.encode(data.toJson());

class LoginRequestDto {
  int? login;
  String? password;

  LoginRequestDto({
    this.login,
    this.password,
  });

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) => LoginRequestDto(
    login: json["login"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "password": password,
  };
}
