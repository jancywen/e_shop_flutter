import 'package:e_shop_flutter/models/index.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class CategoryModel {
    CategoryModel({
      this.badge, 
      this.cateLevel,
      this.children,
      this.id, 
      this.minProfitRate, 
      this.name, 
      this.nameZh, 
      this.parentId, 
      this.serviceTaxRate, 
      this.tag, 
      this.tokenCode
    });

    String badge;
    num cateLevel;
    List<CategoryModel> children;
    num id;
    String minProfitRate;
    String name;
    String nameZh;
    num parentId;
    String serviceTaxRate;
    String tag;
    String tokenCode;
    
    factory CategoryModel.fromJson(Map<dynamic,dynamic> json) => CategoryModel(
      badge: json["badge"],
      cateLevel: json["cateLevel"],
      children: json["children"] == null ? null :
      List<CategoryModel>.from(json["children"].map((x) => CategoryModel.fromJson(x))),
      id: json["id"],
      minProfitRate: json["minProfitRate"],
      name: json["name"],
      nameZh: json["nameZh"],
      parentId: json["parentId"],
      serviceTaxRate: json["serviceTaxRate"],
      tag: json["tag"],
      tokenCode: json["tokenCode"]
    );
    Map<String, dynamic> toJson() => <String, dynamic>{
      'badge': badge,
      'cateLevel': cateLevel,
      'children': children,
      'id': id,
      'minProfitRate': minProfitRate,
      'name': name,
      'nameZh': nameZh,
      'parentId': parentId,
      'serviceTaxRate': serviceTaxRate,
      'tag': tag,
      'tokenCode': tokenCode
    };
}
