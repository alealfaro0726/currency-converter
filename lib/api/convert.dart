// To parse this JSON data, do
//
//     final convertC = convertCFromJson(jsonString);

import 'dart:convert';

ConvertC convertCFromJson(String str) => ConvertC.fromJson(json.decode(str));

String convertCToJson(ConvertC data) => json.encode(data.toJson());

class ConvertC {
    ConvertC({
        required this.base,
        required this.amount,
        required this.result,
        required this.ms,
    });

    String base;
    int amount;
    Result result;
    int ms;

    factory ConvertC.fromJson(Map<String, dynamic> json) => ConvertC(
        base: json["base"],
        amount: json["amount"],
        result: Result.fromJson(json["result"]),
        ms: json["ms"],
    );

    Map<String, dynamic> toJson() => {
        "base": base,
        "amount": amount,
        "result": result.toJson(),
        "ms": ms,
    };
}

class Result {
    Result({
        required this.rate,
    });

    double rate;
    
    factory Result.fromJson(Map<String, dynamic> json) => Result(
        rate: json["rate"]
    );
    Map<String, dynamic> toJson() => {
        "rate": rate,
    };
}
