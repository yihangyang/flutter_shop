// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    CategoryModel({
        this.code,
        this.message,
        this.data,
    });

    String code;
    String message;
    List<Category> data;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        code: json["code"],
        message: json["message"],
        data: List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        this.mallCategoryId,
        this.mallCategoryName,
        this.subCategory,
        this.comments,
        this.image,
    });

    String mallCategoryId;
    String mallCategoryName;
    List<SubCategory> subCategory;
    dynamic comments;
    String image;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        mallCategoryId: json["mallCategoryId"],
        mallCategoryName: json["mallCategoryName"],
        subCategory: List<SubCategory>.from(json["subCategory"].map((x) => SubCategory.fromJson(x))),
        comments: json["comments"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "mallCategoryId": mallCategoryId,
        "mallCategoryName": mallCategoryName,
        "subCategory": List<dynamic>.from(subCategory.map((x) => x.toJson())),
        "comments": comments,
        "image": image,
    };
}

class SubCategory {
    SubCategory({
        this.mallSubId,
        this.mallCategoryId,
        this.mallSubName,
        this.comments,
    });

    String mallSubId;
    String mallCategoryId;
    String mallSubName;
    String comments;

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        mallSubId: json["mallSubId"],
        mallCategoryId: json["mallCategoryId"],
        mallSubName: json["mallSubName"],
        comments: json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "mallSubId": mallSubId,
        "mallCategoryId": mallCategoryId,
        "mallSubName": mallSubName,
        "comments": comments,
    };
}
