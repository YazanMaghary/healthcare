// To parse this JSON data, do
//
//     final userModel2 = userModel2FromJson(jsonString);

import 'dart:convert';

ErrorModel2 userModel2FromJson(String str) => ErrorModel2.fromJson(json.decode(str));

String userModel2ToJson(ErrorModel2 data) => json.encode(data.toJson());

class ErrorModel2 {
    String? error;
    List<Detail>? details;

    ErrorModel2({
        this.error,
        this.details,
    });

    factory ErrorModel2.fromJson(Map<String, dynamic> json) => ErrorModel2(
        error: json["error"],
        details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
    };
}

class Detail {
    String? path;
    String? message;

    Detail({
        this.path,
        this.message,
    });

    factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        path: json["path"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "path": path,
        "message": message,
    };
}
