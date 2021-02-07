import 'package:e_shop_flutter/models/index.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BannerModel {
    BannerModel({
      this.createTime, 
      this.id, 
      this.imgUrl, 
      this.jumpParams, 
      this.jumpTo, 
      this.status, 
      this.sysType, 
      this.title, 
      this.type, 
      this.updateTime
    });

    num createTime;
    num id;
    String imgUrl;
    String jumpParams;
    String jumpTo;
    num status;
    num sysType;
    String title;
    num type;
    num updateTime;
    
    factory BannerModel.fromJson(Map<dynamic,dynamic> json) => BannerModel (
      createTime: json['createTime'],
    id: json['id'],
    imgUrl: json['imgUrl'],
    jumpParams: json['jumpParams'],
    jumpTo: json['jumpTo'],
    status: json['status'],
    sysType: json['sysType'],
    title: json['title'],
    type: json['type'],
    updateTime: json['updateTime']
    );
    Map<String, dynamic> toJson()  =>
    <String, dynamic>{
      'createTime': createTime,
      'id': id,
      'imgUrl': imgUrl,
      'jumpParams': jumpParams,
      'jumpTo': jumpTo,
      'status': status,
      'sysType': sysType,
      'title': title,
      'type': type,
      'updateTime': updateTime
    };
}
