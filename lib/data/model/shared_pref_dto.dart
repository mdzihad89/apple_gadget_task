class SharedPrefDto {
  int? login;
  String? token;

  SharedPrefDto({
    this.login,
    this.token,
  });

  factory SharedPrefDto.fromJson(Map<String, dynamic> json) => SharedPrefDto(
    login: json["login"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "token": token,
  };
}
