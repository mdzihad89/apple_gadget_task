
import 'dart:convert';

List<Trade> tradeFromJson(String str) => List<Trade>.from(json.decode(str).map((x) => Trade.fromJson(x)));

String tradeToJson(List<Trade> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Trade {
  dynamic currentPrice;
  dynamic comment;
  dynamic digits;
  dynamic login;
  dynamic openPrice;
  DateTime? openTime;
  dynamic profit;
  dynamic sl;
  dynamic swaps;
  dynamic symbol;
  dynamic tp;
  dynamic ticket;
  dynamic type;
  dynamic volume;

  Trade({
    this.currentPrice,
    this.comment,
    this.digits,
    this.login,
    this.openPrice,
    this.openTime,
    this.profit,
    this.sl,
    this.swaps,
    this.symbol,
    this.tp,
    this.ticket,
    this.type,
    this.volume,
  });

  factory Trade.fromJson(Map<String, dynamic> json) => Trade(
    currentPrice: json["currentPrice"]?.toDouble(),
    comment: json["comment"],
    digits: json["digits"],
    login: json["login"],
    openPrice: json["openPrice"]?.toDouble(),
    openTime: json["openTime"] == null ? null : DateTime.parse(json["openTime"]),
    profit: json["profit"]?.toDouble(),
    sl: json["sl"]?.toDouble(),
    swaps: json["swaps"]?.toDouble(),
    symbol: json["symbol"],
    tp: json["tp"],
    ticket: json["ticket"],
    type: json["type"],
    volume: json["volume"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "currentPrice": currentPrice,
    "comment": comment,
    "digits": digits,
    "login": login,
    "openPrice": openPrice,
    "openTime": openTime?.toIso8601String(),
    "profit": profit,
    "sl": sl,
    "swaps": swaps,
    "symbol": symbol,
    "tp": tp,
    "ticket": ticket,
    "type": type,
    "volume": volume,
  };
}
