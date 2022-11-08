class MobileModel {
  String? id;
  String? mobileName;
  String? mobilePrice;
  String? mobileImageUrl;

  MobileModel(this.id, this.mobileName, this.mobilePrice, this.mobileImageUrl);

  MobileModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mobileName = json['mobile_name'],
        mobilePrice = json['mobile_price'],
        mobileImageUrl = json['mobile_image_url'];
}
