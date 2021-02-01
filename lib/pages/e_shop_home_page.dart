import 'package:flutter/material.dart';
import 'index.dart';

class EShopHomePage extends StatefulWidget {
  @override
  _EShopHomePageState createState() => _EShopHomePageState();
}

class _EShopHomePageState extends State<EShopHomePage> {

  int _selectedIndex = 0;

  List<Widget> pages;
  List<BottomNavigationBarItem> itemsList;
  PageController _pageController;

  final defaultItemColor = Color.fromARGB(255, 125, 125, 125);

  final itemNames = [
    _Item('首页', 'images/tab_bar_icon/home-selected-icon@2x.png', 'images/tab_bar_icon/home-normal-icon@2x.png'),
    _Item('类别', 'images/tab_bar_icon/category-selected-icon@2x.png', 'images/tab_bar_icon/category-normal-icon@2x.png'),
    _Item('提货单', 'images/tab_bar_icon/bl-selected-icon@2x.png', 'images/tab_bar_icon/bl-normal-icon@2x.png'),
    _Item('购物车', 'images/tab_bar_icon/cart-selected-icon@2x.png', 'images/tab_bar_icon/cart-normal-icon@2x.png'),
    _Item('我的', 'images/tab_bar_icon/me-selected-icon@2x.png', 'images/tab_bar_icon/me-normal-icon@2x.png'),
  ];

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

    if (itemsList == null) {
      itemsList = itemNames
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
    }
    
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
    return Scaffold(
      bottomNavigationBar: _appBar(),
      body: _buildBody(),
    );
  }

  Widget _appBar() {
    return BottomNavigationBar(
        items: itemsList,
        currentIndex: _selectedIndex,
        iconSize: 20,
        unselectedFontSize: 10,
        selectedFontSize: 10,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        unselectedItemColor: Color.fromARGB(255, 114, 114, 114),
        fixedColor: Color.fromARGB(255, 249, 244, 247),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 27, 29, 36),
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