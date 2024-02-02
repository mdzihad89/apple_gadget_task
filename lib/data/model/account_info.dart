import 'dart:convert';

AccountInfo accountInfoFromJson(String str) => AccountInfo.fromJson(json.decode(str));

String accountInfoToJson(AccountInfo data) => json.encode(data.toJson());

class AccountInfo {
  String? address;
  dynamic balance;
  String? city;
  String? country;
  dynamic currency;
  dynamic currentTradesCount;
  dynamic currentTradesVolume;
  dynamic equity;
  dynamic freeMargin;
  bool? isAnyOpenTrades;
  bool? isSwapFree;
  dynamic leverage;
  String? name;
  String? phone;
  dynamic totalTradesCount;
  dynamic totalTradesVolume;
  dynamic type;
  dynamic verificationLevel;
  String? zipCode;

  AccountInfo({
    this.address,
    this.balance,
    this.city,
    this.country,
    this.currency,
    this.currentTradesCount,
    this.currentTradesVolume,
    this.equity,
    this.freeMargin,
    this.isAnyOpenTrades,
    this.isSwapFree,
    this.leverage,
    this.name,
    this.phone,
    this.totalTradesCount,
    this.totalTradesVolume,
    this.type,
    this.verificationLevel,
    this.zipCode,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) => AccountInfo(
    address: json["address"],
    balance: json["balance"]?.toDouble(),
    city: json["city"],
    country: json["country"],
    currency: json["currency"],
    currentTradesCount: json["currentTradesCount"],
    currentTradesVolume: json["currentTradesVolume"],
    equity: json["equity"]?.toDouble(),
    freeMargin: json["freeMargin"]?.toDouble(),
    isAnyOpenTrades: json["isAnyOpenTrades"],
    isSwapFree: json["isSwapFree"],
    leverage: json["leverage"],
    name: json["name"],
    phone: json["phone"],
    totalTradesCount: json["totalTradesCount"],
    totalTradesVolume: json["totalTradesVolume"],
    type: json["type"],
    verificationLevel: json["verificationLevel"],
    zipCode: json["zipCode"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "balance": balance,
    "city": city,
    "country": country,
    "currency": currency,
    "currentTradesCount": currentTradesCount,
    "currentTradesVolume": currentTradesVolume,
    "equity": equity,
    "freeMargin": freeMargin,
    "isAnyOpenTrades": isAnyOpenTrades,
    "isSwapFree": isSwapFree,
    "leverage": leverage,
    "name": name,
    "phone": phone,
    "totalTradesCount": totalTradesCount,
    "totalTradesVolume": totalTradesVolume,
    "type": type,
    "verificationLevel": verificationLevel,
    "zipCode": zipCode,
  };
}
