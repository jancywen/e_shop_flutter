

import 'package:flutter/material.dart';
import 'package:e_shop_flutter/models/index.dart';
import 'package:e_shop_flutter/common/global.dart';



class CategoryMainProvider with ChangeNotifier {
  List<CategoryModel> _topList = [];
  List<CategoryModel> _subLit =[];

  List<CategoryModel> get topList => _topList;
  List<CategoryModel> get subList => _subLit;

  Function get querySubList => _querySubList;

  var selectedCategoryId;

  CategoryMainProvider() {
    _queryTopList();
  }

  void _queryTopList() async {
    try {
      platform.invokeMapMethod(
        'categoryTopList', 
        {"country": 45, "currency": 39, "language": 19})
      .then((value) {
        // print(value);
        if (value["code"] == 0) {
          List<CategoryModel> list = List<CategoryModel>.from(value["data"].map((e) => CategoryModel.fromJson(e)));
          _topList.addAll(list);

          _querySubList(list.first?.id ?? 0);
        }
        notifyListeners();
      });
    }catch (e) {
      print(e.toString());
    }
  }

  void _querySubList(num id) {
    selectedCategoryId = id;
    try {
      platform.invokeMapMethod(
        'categorySublist', 
        {"cateID": id})
      .then((value) {
        // print(value);
        List<CategoryModel> list = List<CategoryModel>.from(value["data"]["currentList"].map((s)=>CategoryModel.fromJson(s)));
        _subLit = list;
        notifyListeners();
      });
    }catch (e) {

    }
  }

}