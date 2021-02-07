import 'package:e_shop_flutter/models/index.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ActivityModel {
    ActivityModel({
      this.createTime, 
      this.id,
      this.imgUrl,
      this.jumpUrl,
      this.title,
      this.updateTime
      });

    num createTime;
    num id;
    String imgUrl;
    String jumpUrl;
    String title;
    num updateTime;
    
    factory ActivityModel.fromJson(Map<dynamic,dynamic> json) => ActivityModel(
      createTime: json["createTime"],
      id: json["id"],
      imgUrl: json["imgUrl"],
      jumpUrl: json["jumpUrl"],
      title: json["title"],
      updateTime: json["updateTime"]
    );
    Map<String, dynamic> toJson()  =>
    <String, dynamic>{
      'createTime': createTime,
      'id': id,
      'imgUrl': imgUrl,
      'jumpUrl': jumpUrl,
      'title': title,
      'updateTime': updateTime
    };
}
