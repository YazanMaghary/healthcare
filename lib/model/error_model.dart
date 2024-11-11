// To parse this JSON data, do
//
//     final errorModel2 = errorModel2FromJson(jsonString);

import 'dart:convert';

ErrorModel errorModel2FromJson(String str) => ErrorModel.fromJson(json.decode(str));

String errorModel2ToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel<T> {
    T? message;
    String? error;

    ErrorModel({
        required this.message,
        required this.error,
    });

    factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json["message"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
    };
}
