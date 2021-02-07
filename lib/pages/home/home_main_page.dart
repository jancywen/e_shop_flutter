
import 'package:e_shop_flutter/models/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widget/search_bar_widget.dart';
import 'package:e_shop_flutter/providers/home_main_provider.dart';
import 'package:e_shop_flutter/util/image_util.dart';
import 'package:e_shop_flutter/generated/l10n.dart';
import 'widget/goods_card_widget.dart';
import 'widget/section_title_widget.dart';


class HomeMainPage extends StatefulWidget {
  @override
  _HomeMainPageState createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => HomeMainProvider(), 
      child: Consumer<HomeMainProvider>(
        builder: (_, provider, child){
          return SmartRefresher(
              controller: provider.refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: provider.onRefresh,
              onLoading: provider.onLoading,
              header: ClassicHeader(),
              footer: ClassicFooter(),
              child:  CustomScrollView(
              slivers: _createSlivers(context, provider).toList(),
            )
            );
        },),
      );
  }

  // 点击类别
  void _onTapCategory(CategoryModel model) {
    debugPrint("category Id: ${model.id}");
  }

  // 点击banner
  void _onTapBanner(BannerModel banner) {
    debugPrint("banner id: ${banner.id}");
  }

  // 点击brand
  void _onTapBrand(BrandModel brand) {
    debugPrint("brand id: ${brand.id}");
  }

  // 点击商品
  void _onTapGoods(GoodsModel goods) {
    debugPrint("goods id: ${goods.id}");
  }


  List<Widget> _createSlivers(BuildContext context, HomeMainProvider provider) {
    List<Widget> list = [];

    // 
    var search = SliverPersistentHeader(
        pinned: true, 
        floating: false, 
        delegate: _SliverHeaderDelegate(
          minHeight: ScreenUtil().statusBarHeight + 50+30, 
          maxHeight: ScreenUtil().statusBarHeight + 50+30,
          child: Column(
            children: [
              SearchBarWidget(),
              Expanded(
                child: Container(
                  color: Theme.of(context).primaryColor,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: provider.hotCateList.length,
                    itemBuilder: (context, index){
                      var category = provider.hotCateList[index];
                      return GestureDetector(
                        onTap: () => _onTapCategory( category),
                        child: Center(
                          child: Text(
                            "    ${provider.hotCateList[index].name}",
                            style: TextStyle(color: Colors.white70),
                          )
                        )
                      );
                    }
                  ),
                )
              ),
            ]
          )
        ),
      );
    
    // 轮播图
    var banner = SliverToBoxAdapter(
      child: provider.bannerList.length == 0
      ? Container()
      : 
      Container(
        height: 200,
        child: Swiper(itemBuilder: (_, index){
          return EchainImage(url: provider.bannerList[index].imgUrl);
        }, 
        itemCount: provider.bannerList.length,
        onTap: (index) => _onTapBanner(provider.bannerList[index]),
        pagination: new SwiperPagination(),
        )
      ),
    );

    // 推荐品牌
    var brand = SliverToBoxAdapter(
      child: provider.brandList.length == 0 
      ? Container()
      : Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitleWidget(title: S.of(context).home_recommend_brand_title),

          Container(
            padding: EdgeInsets.only(top: 0, bottom: 15),
            height: 150,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 15),
              scrollDirection: Axis.horizontal,
              itemCount: provider.brandList.length,
              itemBuilder: (context, index){
                var brand = provider.brandList[index];
                return GestureDetector(
                  onTap: () => _onTapBrand(brand),
                  child: 
                Container(
                  padding: EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: EchainImage(
                      url: provider.brandList[index].imgUrl, 
                      width: 132, 
                      height: 132,),
                    )
                ));
              }
            )
          ),
        ],)
      ),
    );

    var title = SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: SectionTitleWidget(title: S.of(context).home_hot_goods_title)
        )
    );

    var goods = SliverPadding(
      padding:  EdgeInsets.only(left: 15, right:15), 
      sliver: SliverGrid(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 12,
          childAspectRatio: 0.65
        ), delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index){
            var model = provider.goodsList[index];
            return new GoodsCardWidget(model: model, onTap: () => _onTapGoods(model),);
          }, childCount: provider.goodsList.length),
        ),
      );

    var hotSaleTitle = SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: SectionTitleWidget(title: S.of(context).home_hot_sale_title)
        ),
    );

    var hotSale = SliverPadding(
      padding:  EdgeInsets.only(left: 15, right:15), 
      sliver: SliverGrid(
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 12,
          childAspectRatio: 0.62
        ), delegate: new SliverChildBuilderDelegate(
          (BuildContext context, int index){
            var model = provider.hotSaleGoodsList[index];
            return new GoodsCardWidget(model: model, onTap: () => _onTapGoods(model));
          }, childCount: provider.hotSaleGoodsList.length),
        ),
      );
    
    list.add(search);
    list.add(banner);
    list.add(brand);
    list.add(title);
    list.add(goods);
    if (provider.hotSaleGoodsList.length > 0) {
      list.add(hotSaleTitle);
      list.add(hotSale);
    }

    return list;
  }

  
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight, maxHeight;
  final Widget child;

  _SliverHeaderDelegate({
    @required this.minHeight, 
    @required this.maxHeight, 
    @required this.child
  });

  @override
  // TODO: implement minExtent
  double get minExtent => minHeight;

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }

}