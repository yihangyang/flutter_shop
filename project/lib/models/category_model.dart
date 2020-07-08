class CategoryModel {
  String mallCategoryId;
  String mallCategoryName;
  List<dynamic> bxMallSubDto;
  Null comments;
  String image;

  CategoryModel({
    this.mallCategoryId,
    this.mallCategoryName,
    this.bxMallSubDto,
    this.comments,
    this.image
  });

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      mallCategoryId: json['mallCategoryId'],
      mallCategoryName: json['mallCategoryName'],
      bxMallSubDto: json['bxMallSubDto'],
      comments: json['comments'],
      image: json['image']
    );
  }
}

class CategoryListModel{
  List<CategoryModel> data;
  CategoryListModel(this.data);

  factory CategoryListModel.fromJson(List json) {
    return CategoryListModel(
      json.map((e) => CategoryModel.fromJson(e)).toList()
    );
  }
}