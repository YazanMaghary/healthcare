// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? message;
    User? user;
    String? token;

    UserModel({
        this.message,
        this.user,
        this.token,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    String? id;
    String? name;
    String? email;
    String? phone;
    String? role;
    bool? isVerified;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    DateTime? passwordChangedAt;
    String? image;
    String? status;

    User({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.role,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.passwordChangedAt,
        this.image,
        this.status,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        role: json["role"],
        isVerified: json["isVerified"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        passwordChangedAt: json["passwordChangedAt"] == null ? null : DateTime.parse(json["passwordChangedAt"]),
        image: json["image"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "role": role,
        "isVerified": isVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "passwordChangedAt": passwordChangedAt?.toIso8601String(),
        "image": image,
        "status": status,
    };
}
