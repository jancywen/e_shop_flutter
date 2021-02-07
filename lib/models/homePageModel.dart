import 'package:json_annotation/json_annotation.dart';
import "activityModel.dart";
import "bannerModel.dart";
import "brandModel.dart";
import "goodsModel.dart";
import "categoryModel.dart";

@JsonSerializable()
class HomePageModel {
    HomePageModel({
      this.activityList, 
      this.bannerList, 
      this.brandList, 
      this.goodsRecommendList, 
      this.hotCateList
    });

    List<ActivityModel> activityList;
    List<BannerModel> bannerList;
    List<BrandModel> brandList;
    List<GoodsModel> goodsRecommendList;
    List<CategoryModel> hotCateList;
    
    factory HomePageModel.fromJson(Map<dynamic,dynamic> json) => HomePageModel(
      activityList: List<ActivityModel>.from(json["activityList"].map((x) => ActivityModel.fromJson(x))),
      bannerList: List<BannerModel>.from(json["bannerList"].map((x) => BannerModel.fromJson(x))),
      brandList: List<BrandModel>.from(json["brandList"].map((x) => BrandModel.fromJson(x))),
      goodsRecommendList: List<GoodsModel>.from(json["goodsRecommendList"].map((x) => GoodsModel.fromJson(x))),
      hotCateList: List<CategoryModel>.from(json["hotCateList"].map((x) => CategoryModel.fromJson(x)))
    );
    Map<String, dynamic> toJson() => {
      "activityList": List<dynamic>.from(activityList.map((e) => e.toJson()))
    };
}
