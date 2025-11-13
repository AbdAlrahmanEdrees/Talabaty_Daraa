class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesDatetime;

  CategoriesModel({
    this.categoriesId,
    this.categoriesName,
    this.categoriesDatetime,
  });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'].toString();
    categoriesName = json['categories_name'].toString();
    categoriesDatetime = json['categories_datetime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
