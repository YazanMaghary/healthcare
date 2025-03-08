// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    String? message;
    List<Category>? data;

    CategoryModel({
        this.message,
        this.data,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        message: json["message"],
        data: json["data"] == null ? [] : List<Category>.from(json["data"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Category {
    String? id;
    String? name;
    String? image;
    int? v;

    Category({
        this.id,
        this.name,
        this.image,
        this.v,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "__v": v,
    };
}
