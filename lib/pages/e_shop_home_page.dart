
import 'package:flutter/material.dart';
import 'index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_shop_flutter/generated/l10n.dart';

class EShopHomePage extends StatefulWidget {
  @override
  _EShopHomePageState createState() => _EShopHomePageState();
}

class _EShopHomePageState extends State<EShopHomePage> {

  BuildContext get context => _element;
  StatefulElement _element;
  // S get s => S.of(context);

  int _selectedIndex = 0;

  List<Widget> pages;
  // List<BottomNavigationBarItem> itemsList;
  PageController _pageController;

  final defaultItemColor = Color.fromARGB(255, 163, 166, 168);

  // final itemNames = [
  //   _Item("首页", 'images/tab_bar_icon/home-selected-icon@2x.png', 'images/tab_bar_icon/home-normal-icon@2x.png'),
  //   _Item('类别', 'images/tab_bar_icon/category-selected-icon@2x.png', 'images/tab_bar_icon/category-normal-icon@2x.png'),
  //   _Item('提货单', 'images/tab_bar_icon/bl-selected-icon@2x.png', 'images/tab_bar_icon/bl-normal-icon@2x.png'),
  //   _Item('购物车', 'images/tab_bar_icon/cart-selected-icon@2x.png', 'images/tab_bar_icon/cart-normal-icon@2x.png'),
  //   _Item('我的', 'images/tab_bar_icon/me-selected-icon@2x.png', 'images/tab_bar_icon/me-normal-icon@2x.png'),
  // ];

  @override
  void initState() {
    super.initState();

    if (pages == null) {
      pages = [
        HomeMainPage(),
        CategoryMainPage(),
        BlMainPage(),
        CartMainPage(),
        MeMainPage()
      ];
    }

    // if (itemsList == null) {
      // itemsList = itemNames
      //   .map((item) => BottomNavigationBarItem(
      //     icon: Image.asset(
      //       item.normalIcon, 
      //       width:23.0, 
      //       height: 23.0), 
      //     activeIcon: Image.asset(
      //       item.activeIcon, 
      //       width:23.0, 
      //       height: 23.0), 
      //     label: item.name)
      //   ).toList();
    // }
    
    _pageController = PageController();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }


  @override
  Widget build(BuildContext context) {
    
    // 屏幕适配
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: true);
    
    return Scaffold(
      bottomNavigationBar: _appBar(context),
      body: _buildBody(),
    );
  }

  Widget _appBar(BuildContext context) {
    S s = S.of(context);
    var itemNames = [
    _Item(s.tab_bar_home, 'images/tab_bar_icon/home-selected-icon@2x.png', 'images/tab_bar_icon/home-normal-icon@2x.png'),
    _Item(s.tab_bar_catetory, 'images/tab_bar_icon/category-selected-icon@2x.png', 'images/tab_bar_icon/category-normal-icon@2x.png'),
    _Item(s.tab_bar_bl, 'images/tab_bar_icon/bl-selected-icon@2x.png', 'images/tab_bar_icon/bl-normal-icon@2x.png'),
    _Item(s.tab_bar_cart, 'images/tab_bar_icon/cart-selected-icon@2x.png', 'images/tab_bar_icon/cart-normal-icon@2x.png'),
    _Item(s.tab_bar_me, 'images/tab_bar_icon/me-selected-icon@2x.png', 'images/tab_bar_icon/me-normal-icon@2x.png'),
  ];
    var itemsList = itemNames
        .map((item) => BottomNavigationBarItem(
          icon: Image.asset(
            item.normalIcon, 
            width:23.0, 
            height: 23.0), 
          activeIcon: Image.asset(
            item.activeIcon, 
            width:23.0, 
            height: 23.0), 
          label: item.name)
        ).toList();
    return BottomNavigationBar(
        items: itemsList,
        currentIndex: _selectedIndex,
        iconSize: 20,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        unselectedItemColor: Color.fromARGB(255, 163, 166, 168),
        fixedColor: Color.fromARGB(255, 46, 89, 130),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      );
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      children: pages,
      physics: NeverScrollableScrollPhysics(), // 不可滑动
    );
  }

}


class _Item {
  String name, activeIcon, normalIcon;
  _Item(this.name, this.activeIcon, this.normalIcon);
}