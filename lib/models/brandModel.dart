import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class BrandModel {
    BrandModel({this.id, this.imgUrl, this.jumpUrl, this.name, this.sysType});

    num id;
    String imgUrl;
    String jumpUrl;
    String name;
    num sysType;
    
    factory BrandModel.fromJson(Map<dynamic,dynamic> json) => BrandModel(
      id: json["id"], 
      imgUrl: json["imgUrl"], 
      jumpUrl: json["jumpUrl"], 
      name: json["name"], 
      sysType: json["sysType"]);
    Map<String, dynamic> toJson() => <String, dynamic>{
      'id': id,
      'imgUrl': imgUrl,
      'jumpUrl': jumpUrl,
      'name': name,
      'sysType': sysType
    };
}
