import 'package:flutter/material.dart';
import 'package:e_shop_flutter/widget/search_bar_widget.dart';
import 'package:e_shop_flutter/models/index.dart';
import 'package:e_shop_flutter/util/image_util.dart';
import 'package:provider/provider.dart';
import 'package:e_shop_flutter/providers/index.dart';

class CategoryMainPage extends StatefulWidget {
  @override
  _CategoryMainPageState createState() => _CategoryMainPageState();
}

class _CategoryMainPageState extends State<CategoryMainPage> with AutomaticKeepAliveClientMixin {

  /// 保持状态
  @override
  bool get wantKeepAlive => true;

  void _onTapSearch() {

  }

  void _onTapCategory(CategoryModel catetory) {
    print("onTapCategory: ${catetory.id}");

  List<List<num>> sourcedata = [[1,2], [34, 56]];
    var some = sourcedata.reduce((value, element) { 
      List<num> temp = List.from(value);
      temp.addAll(element);
      return temp;
      });

      print(some);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => CategoryMainProvider(),
        child: Consumer<CategoryMainProvider>(builder: (_, provider, child){
          return 
      Column(
        children: [
          SearchBarWidget(onTap: _onTapSearch,),

          Expanded(child: 
            Row(children: [
              Expanded(
                flex: 2,
                child: ListView.builder(
                  itemBuilder: (context, index){
                    CategoryModel category = provider.topList[index];
                    return GestureDetector(
                      child: Container(
                        color: category.id == provider.selectedCategoryId ? Colors.white : Color(0xfff7f7f8),
                      height: 46,
                      child: Center(
                        child: Text(
                          category.name,
                          style: Theme.of(context).textTheme.headline2,
                          )
                      ),
                    ), 
                    onTap: () => provider.querySubList(category.id),
                  );
                }, itemCount: provider.topList.length,
              )),
            
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 15,right: 10),
                  child: CustomScrollView(slivers: 
                    provider.subList
                    .map((category) {
                      return category.children == null 
                      ? [SliverToBoxAdapter(child:Container())]
                      : [SliverToBoxAdapter(
                        child: Padding(padding: EdgeInsets.only(top: 15, bottom: 10), 
                        child: Text(category.name, style: Theme.of(context).textTheme.headline1,),),),
                        SliverGrid(
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.68, 
                          ),
                        delegate: 
                          new SliverChildBuilderDelegate(
                              (context, index){
                                CategoryModel model = category.children[index];
                                return GestureDetector(
                                  onTap: () => _onTapCategory(model),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children:[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: EchainImage(url: model.badge, height: 75,),
                                      ),
                                      Text(model.name, style: Theme.of(context).textTheme.headline2, maxLines: 1,)
                                  ])
                                );
                            }, childCount: category.children.length),
                        ),
                        SliverToBoxAdapter(child: Container(color: Color(0xff6d747b), height: 0.2,))
                        ];
                    },).reduce((value, element) {
                      List<RenderObjectWidget> temp = List.from(value);
                      temp.addAll(element);
                      return temp;
                    }).toList())
                )
              )
            ],)
          )
        ]
      );},)
    ));
  }
}