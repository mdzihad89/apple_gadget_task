import 'dart:convert';

LoginResponseDto loginResponseDtoFromJson(String str) => LoginResponseDto.fromJson(json.decode(str));

String loginResponseDtoToJson(LoginResponseDto data) => json.encode(data.toJson());

class LoginResponseDto {
  bool result;
  String token;

  LoginResponseDto({
    required this.result,
    required this.token,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) => LoginResponseDto(
    result: json["result"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "token": token,
  };
}
