class AddressModel {
  String addressId;
  String addressUsersid;
  String addressName;
  String addressCity;
  String addressStreet;
  String addressLat;
  String addressLong;

  AddressModel({
    this.addressId = '',
    this.addressUsersid = '',
    this.addressName = '',
    this.addressCity = '',
    this.addressStreet = '',
    this.addressLat = '',
    this.addressLong = '',
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      addressId: json['address_id']?.toString() ?? '',
      addressUsersid: json['address_usersid']?.toString() ?? '',
      addressName: json['address_name']?.toString() ?? '',
      addressCity: json['address_city']?.toString() ?? '',
      addressStreet: json['address_street']?.toString() ?? '',
      addressLat: json['address_lat']?.toString() ?? '',
      addressLong: json['address_long']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address_id': addressId,
      'address_usersid': addressUsersid,
      'address_name': addressName,
      'address_city': addressCity,
      'address_street': addressStreet,
      'address_lat': addressLat,
      'address_long': addressLong,
    };
  }
}
