import 'dart:convert';

class MobileModel {
  String? id;
  String? mobileName;
  String? mobilePrice;
  String? mobileImageUrl;
  String? mobileDescription;

  MobileModel(this.id, this.mobileName, this.mobilePrice, this.mobileImageUrl, this.mobileDescription);

  MobileModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        mobileName = json['mobile_name'],
        mobilePrice = json['mobile_price'],
        mobileImageUrl = json['mobile_image_url'],
        mobileDescription = json['mobile_details'];
}
