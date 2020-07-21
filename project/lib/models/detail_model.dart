// To parse this JSON data, do
//
//     final detailModel = detailModelFromJson(jsonString);

import 'dart:convert';

DetailModel detailModelFromJson(String str) => DetailModel.fromJson(json.decode(str));

String detailModelToJson(DetailModel data) => json.encode(data.toJson());

class DetailModel {
    DetailModel({
        this.code,
        this.message,
        this.data,
    });

    String code;
    String message;
    DatailGoodsData data;

    factory DetailModel.fromJson(Map<String, dynamic> json) => DetailModel(
        code: json["code"],
        message: json["message"],
        data: DatailGoodsData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class DatailGoodsData {
    DatailGoodsData({
        this.goodInfo,
        this.goodComments,
        this.advertesPicture,
    });

    GoodInfo goodInfo;
    List<GoodComment> goodComments;
    AdvertesPicture advertesPicture;

    factory DatailGoodsData.fromJson(Map<String, dynamic> json) => DatailGoodsData(
        goodInfo: GoodInfo.fromJson(json["goodInfo"]),
        goodComments: List<GoodComment>.from(json["goodComments"].map((x) => GoodComment.fromJson(x))),
        advertesPicture: AdvertesPicture.fromJson(json["advertesPicture"]),
    );

    Map<String, dynamic> toJson() => {
        "goodInfo": goodInfo.toJson(),
        "goodComments": List<dynamic>.from(goodComments.map((x) => x.toJson())),
        "advertesPicture": advertesPicture.toJson(),
    };
}

class AdvertesPicture {
    AdvertesPicture({
        this.pictureAddress,
        this.toPlace,
    });

    String pictureAddress;
    String toPlace;

    factory AdvertesPicture.fromJson(Map<String, dynamic> json) => AdvertesPicture(
        pictureAddress: json["PICTURE_ADDRESS"],
        toPlace: json["TO_PLACE"],
    );

    Map<String, dynamic> toJson() => {
        "PICTURE_ADDRESS": pictureAddress,
        "TO_PLACE": toPlace,
    };
}

class GoodComment {
    GoodComment({
        this.score,
        this.comments,
        this.userName,
        this.discussTime,
    });

    int score;
    String comments;
    String userName;
    int discussTime;

    factory GoodComment.fromJson(Map<String, dynamic> json) => GoodComment(
        score: json["SCORE"],
        comments: json["comments"],
        userName: json["userName"],
        discussTime: json["discussTime"],
    );

    Map<String, dynamic> toJson() => {
        "SCORE": score,
        "comments": comments,
        "userName": userName,
        "discussTime": discussTime,
    };
}

class GoodInfo {
    GoodInfo({
        this.image5,
        this.amount,
        this.image3,
        this.image4,
        this.goodsId,
        this.isOnline,
        this.image1,
        this.image2,
        this.goodsSerialNumber,
        this.oriPrice,
        this.presentPrice,
        this.comPic,
        this.state,
        this.shopId,
        this.goodsName,
        this.goodsDetail,
    });

    String image5;
    int amount;
    String image3;
    String image4;
    String goodsId;
    String isOnline;
    String image1;
    String image2;
    String goodsSerialNumber;
    double oriPrice;
    double presentPrice;
    String comPic;
    int state;
    String shopId;
    String goodsName;
    String goodsDetail;

    factory GoodInfo.fromJson(Map<String, dynamic> json) => GoodInfo(
        image5: json["image5"],
        amount: json["amount"],
        image3: json["image3"],
        image4: json["image4"],
        goodsId: json["goodsId"],
        isOnline: json["isOnline"],
        image1: json["image1"],
        image2: json["image2"],
        goodsSerialNumber: json["goodsSerialNumber"],
        oriPrice: json["oriPrice"],
        presentPrice: json["presentPrice"].toDouble(),
        comPic: json["comPic"],
        state: json["state"],
        shopId: json["shopId"],
        goodsName: json["goodsName"],
        goodsDetail: json["goodsDetail"],
    );

    Map<String, dynamic> toJson() => {
        "image5": image5,
        "amount": amount,
        "image3": image3,
        "image4": image4,
        "goodsId": goodsId,
        "isOnline": isOnline,
        "image1": image1,
        "image2": image2,
        "goodsSerialNumber": goodsSerialNumber,
        "oriPrice": oriPrice,
        "presentPrice": presentPrice,
        "comPic": comPic,
        "state": state,
        "shopId": shopId,
        "goodsName": goodsName,
        "goodsDetail": goodsDetail,
    };
}
