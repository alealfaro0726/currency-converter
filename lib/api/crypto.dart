// To parse this JSON data, do
//
//     final btc = btcFromJson(jsonString);

import 'dart:convert';

Btc btcFromJson(String str) => Btc.fromJson(json.decode(str));

String btcToJson(Btc data) => json.encode(data.toJson());

class Btc {
    Btc({
        required this.queryCount,
        required this.resultsCount,
        required this.adjusted,
        required this.results,
        required this.status,
        required this.requestId,
        required this.count,
    });

    int queryCount;
    int resultsCount;
    bool adjusted;
    List<Result> results;
    String status;
    String requestId;
    int count;

    factory Btc.fromJson(Map<String, dynamic> json) => Btc(
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "status": status,
        "request_id": requestId,
        "count": count,
    };
}

class Result {
    Result({
        required this.t,
        required this.v, 
        required this.o,
        required this.c,
        required this.h,
        required this.l,
        required this.resultT,
        required this.n,
    });

    String t;
    double v;
  
    double o;
    double c;
    double h;
    double l;
    int resultT;
    int n;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        t: json["T"],
        v: json["v"].toDouble(),
        o: json["o"].toDouble(),
        c: json["c"].toDouble(),
        h: json["h"].toDouble(),
        l: json["l"].toDouble(),
        resultT: json["t"],
        n: json["n"],
    );

    Map<String, dynamic> toJson() => {
        "T": t,
        "v": v,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": resultT,
        "n": n,
    };
}
