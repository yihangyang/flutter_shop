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
    List<CategoryListData> data;

    factory CategoryGoodsModel.fromJson(Map<String, dynamic> json) => CategoryGoodsModel(
        code: json["code"],
        message: json["message"],
        data: List<CategoryListData>.from(json["data"].map((x) => CategoryListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CategoryListData {
    CategoryListData({
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

    factory CategoryListData.fromJson(Map<String, dynamic> json) => CategoryListData(
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
