class Storemodel {
  String? storeId;
  String? storeName;
  String? storeType;
  String? storePhone;
  String? storeImage;

  Storemodel({
    this.storeId,
    this.storeName,
    this.storeType,
    this.storePhone,
    this.storeImage,
  });

  Storemodel.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'].toString();
    storeName = json['categories_name'].toString();
    storeType = json['store_type'].toString();
    storePhone = json['store_phone'].toString();
    storeImage = json['store_image'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['store_name'] = this.storeName;
    data['store_type'] = this.storeType;
    data['store_phone'] = this.storePhone;
    data['store_image'] = this.storeImage;
    return data;
  }
}
