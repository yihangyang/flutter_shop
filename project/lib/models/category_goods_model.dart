// To parse this JSON data, do
//
//     final categoryGoodsModel = categoryGoodsModelFromJson(jsonString);

import 'dart:convert';

CategoryGoodsModel categoryGoodsModelFromJson(String str) => CategoryGoodsModel.fromJson(json.decode(str));

String categoryGoodsModelToJson(CategoryGoodsModel data) => json.encode(data.toJson());

class CategoryGoodsModel {
    CategoryGoodsModel({
        this.code,
        this.message,
        this.data,
    });

    String code;
    String message;
    Data data;

    factory CategoryGoodsModel.fromJson(Map<String, dynamic> json) => CategoryGoodsModel(
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.sale,
        this.neu,
        this.kleider,
        this.schuhe,
        this.tasche,
    });

    List<Kleider> sale;
    List<Kleider> neu;
    List<Kleider> kleider;
    List<Kleider> schuhe;
    List<Kleider> tasche;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        sale: List<Kleider>.from(json["sale"].map((x) => Kleider.fromJson(x))),
        neu: List<Kleider>.from(json["neu"].map((x) => Kleider.fromJson(x))),
        kleider: List<Kleider>.from(json["kleider"].map((x) => Kleider.fromJson(x))),
        schuhe: List<Kleider>.from(json["schuhe"].map((x) => Kleider.fromJson(x))),
        tasche: List<Kleider>.from(json["tasche"].map((x) => Kleider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sale": List<dynamic>.from(sale.map((x) => x.toJson())),
        "neu": List<dynamic>.from(neu.map((x) => x.toJson())),
        "kleider": List<dynamic>.from(kleider.map((x) => x.toJson())),
        "schuhe": List<dynamic>.from(schuhe.map((x) => x.toJson())),
        "tasche": List<dynamic>.from(tasche.map((x) => x.toJson())),
    };
}

class Kleider {
    Kleider({
        this.image,
        this.oriPrice,
        this.presentPrice,
        this.goodsName,
        this.goodsId,
    });

    String image;
    double oriPrice;
    double presentPrice;
    String goodsName;
    String goodsId;

    factory Kleider.fromJson(Map<String, dynamic> json) => Kleider(
        image: json["image"],
        oriPrice: json["oriPrice"].toDouble(),
        presentPrice: json["presentPrice"].toDouble(),
        goodsName: json["goodsName"],
        goodsId: json["goodsId"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "oriPrice": oriPrice,
        "presentPrice": presentPrice,
        "goodsName": goodsName,
        "goodsId": goodsId,
    };
}


// import 'dart:convert';

// CategoryGoodsModel categoryGoodsModelFromJson(String str) => CategoryGoodsModel.fromJson(json.decode(str));

// String categoryGoodsModelToJson(CategoryGoodsModel data) => json.encode(data.toJson());

// class CategoryGoodsModel {
//     CategoryGoodsModel({
//         this.code,
//         this.message,
//         this.data,
//     });

//     String code;
//     String message;
//     List<CategoryListData> data;

//     factory CategoryGoodsModel.fromJson(Map<String, dynamic> json) => CategoryGoodsModel(
//         code: json["code"],
//         message: json["message"],
//         data: List<CategoryListData>.from(json["data"].map((x) => CategoryListData.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class CategoryListData {
//     CategoryListData({
//         this.image,
//         this.oriPrice,
//         this.presentPrice,
//         this.goodsName,
//         this.goodsId,
//     });

//     String image;
//     double oriPrice;
//     double presentPrice;
//     String goodsName;
//     String goodsId;

//     factory CategoryListData.fromJson(Map<String, dynamic> json) => CategoryListData(
//         image: json["image"],
//         oriPrice: json["oriPrice"].toDouble(),
//         presentPrice: json["presentPrice"].toDouble(),
//         goodsName: json["goodsName"],
//         goodsId: json["goodsId"],
//     );

//     Map<String, dynamic> toJson() => {
//         "image": image,
//         "oriPrice": oriPrice,
//         "presentPrice": presentPrice,
//         "goodsName": goodsName,
//         "goodsId": goodsId,
//     };
// }
