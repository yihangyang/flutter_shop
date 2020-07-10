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
    List<Data> data;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        code: json["code"],
        message: json["message"],
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Data {
    Data({
        this.mallCategoryId,
        this.mallCategoryName,
        this.bxMallSubDto,
        this.comments,
        this.image,
    });

    String mallCategoryId;
    String mallCategoryName;
    List<BxMallSubDto> bxMallSubDto;
    dynamic comments;
    String image;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        mallCategoryId: json["mallCategoryId"],
        mallCategoryName: json["mallCategoryName"],
        bxMallSubDto: List<BxMallSubDto>.from(json["bxMallSubDto"].map((x) => BxMallSubDto.fromJson(x))),
        comments: json["comments"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "mallCategoryId": mallCategoryId,
        "mallCategoryName": mallCategoryName,
        "bxMallSubDto": List<dynamic>.from(bxMallSubDto.map((x) => x.toJson())),
        "comments": comments,
        "image": image,
    };
}

class BxMallSubDto {
    BxMallSubDto({
        this.mallSubId,
        this.mallCategoryId,
        this.mallSubName,
        this.comments,
    });

    String mallSubId;
    String mallCategoryId;
    String mallSubName;
    String comments;

    factory BxMallSubDto.fromJson(Map<String, dynamic> json) => BxMallSubDto(
        mallSubId: json["mallSubId"],
        mallCategoryId: json["mallCategoryId"],
        mallSubName: json["mallSubName"],
        comments: json["comments"] == null ? null : json["comments"],
    );

    Map<String, dynamic> toJson() => {
        "mallSubId": mallSubId,
        "mallCategoryId": mallCategoryId,
        "mallSubName": mallSubName,
        "comments": comments == null ? null : comments,
    };
    
}
