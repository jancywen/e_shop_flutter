import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter/material.dart';
import 'package:e_shop_flutter/models/index.dart';
import 'package:e_shop_flutter/common/global.dart';

class HomeMainProvider with ChangeNotifier {
  List<BannerModel> _bannerList = [];
  List<ActivityModel> _activityList = [];
  List<BrandModel> _brandList = [];
  List<GoodsModel> _goodsList = [];
  List<CategoryModel> _hotCateList = [];
  List<GoodsModel> _hotSaleGoodsList = [];
  RefreshController _refreshController;

  List<BannerModel> get bannerList => _bannerList;
  List<ActivityModel> get activityList => _activityList;
  List<BrandModel> get brandList => _brandList;
  List<GoodsModel> get goodsList => _goodsList;
  List<CategoryModel> get hotCateList => _hotCateList;
  List<GoodsModel> get hotSaleGoodsList => _hotSaleGoodsList;

  RefreshController get refreshController => _refreshController;
  Function get onRefresh => _onRefresh;
  Function get onLoading => _onLoading;

  int page = 1;
  int size = 20;
  var total = 0;


  HomeMainProvider(){
    _refreshController = RefreshController(initialRefresh: false);
    _onRefresh();
  }

  void _onRefresh()  async {
    try {
      platform.invokeMapMethod('homeGoodsList', {"country": 45, "currency": 39, "language": 19})
      .then((value) {
        // print(value["data"]["goodsRecommendList"]);
        var param = new Map<String, dynamic>.from(value["data"]);
        var model = HomePageModel.fromJson( param);
        _bannerList = model.bannerList ?? [];
        _activityList = model.activityList ?? [];
        _brandList = model.brandList ?? [];
        _goodsList = model.goodsRecommendList ??[];
        _hotCateList = model.hotCateList ?? [];
        _hotSaleGoodsList = [];
        notifyListeners();
        _refreshController.refreshCompleted();
      });
    }catch(e) {
      _refreshController.refreshCompleted();
    }
  }


  void _onLoading() async {
    await platform.invokeMapMethod(
      'homeHotSaleGoodsList', 
      {"page": page, 
      "size": size, 
      "country": 45, 
      "currency": 39, 
      "language": 19})
    .then((value) {
      var data = value["data"];
      if (data != null){
        this.page++;
        total = data["totalNum"] ?? 0;
        var list = List<GoodsModel>.from(data["productList"].map((e) => GoodsModel.fromJson(e)));
        _hotSaleGoodsList.addAll(list);
        
      }
      _loadCompleteData();
    }, 
    onError: _loadError);
  }


  _loadCompleteData() {
    notifyListeners();
    _refreshController.refreshCompleted();
    if (_hotSaleGoodsList.length == total) {
       _refreshController.loadNoData();
    }else {
      _refreshController.loadComplete();
    }
  }

  _loadError(e) {
    notifyListeners();
    _refreshController.loadFailed();
    _refreshController.refreshFailed();
  }


}