import 'dart:convert';

MallGoodsModel mallGoodsModelFromJson(String str) => MallGoodsModel.fromJson(json.decode(str));

String mallGoodsModelToJson(MallGoodsModel data) => json.encode(data.toJson());

class MallGoodsModel {
    MallGoodsModel({
        this.code,
        this.message,
        this.data,
    });

    String code;
    String message;
    List<CategroyListData> data;

    factory MallGoodsModel.fromJson(Map<String, dynamic> json) => MallGoodsModel(
        code: json["code"],
        message: json["message"],
        data: List<CategroyListData>.from(json["data"].map((x) => CategroyListData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CategroyListData {
    CategroyListData({
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

    factory CategroyListData.fromJson(Map<String, dynamic> json) => CategroyListData(
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
