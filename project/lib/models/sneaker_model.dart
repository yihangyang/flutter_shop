// To parse this JSON data, do
//
//     final sneakerModel = sneakerModelFromJson(jsonString);

import 'dart:convert';

List<SneakerModel> sneakerModelFromJson(String str) => List<SneakerModel>.from(json.decode(str).map((x) => SneakerModel.fromJson(x)));

String sneakerModelToJson(List<SneakerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SneakerModel {
    SneakerModel({
        this.name,
        this.brand,
        this.price,
        this.color,
        this.shoeUrl,
    });

    String name;
    String brand;
    double price;
    String color;
    String shoeUrl;

    factory SneakerModel.fromJson(Map<String, dynamic> json) => SneakerModel(
        name: json["name"],
        brand: json["brand"],
        price: json["price"].toDouble(),
        color: json["color"],
        shoeUrl: json["shoeUrl"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "brand": brand,
        "price": price,
        "color": color,
        "shoeUrl": shoeUrl,
    };
}
