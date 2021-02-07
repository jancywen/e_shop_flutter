

class GoodsModel {
    GoodsModel({
      this.brandId, 
      this.brandLogo, 
      this.brandName,
      this.fullStock, 
      this.id, 
      this.mainImg, 
      this.name, 
      this.otherImgs, 
      this.publicOffering, 
      this.sanCode, 
      this.sanSufficient, 
      this.skuImgs, 
      this.saleCountrys,
    });

    num brandId;
    String brandLogo;
    String brandName;
    num fullStock;
    num id;
    String mainImg;
    String name;
    String otherImgs;
    num publicOffering;
    String sanCode;
    bool sanSufficient;
    String skuImgs;
    Map<dynamic, dynamic> saleCountrys;

    factory GoodsModel.fromJson(Map<dynamic,dynamic> json) => GoodsModel(
      brandId: json["brandId"],
      brandLogo: json["brandLogo"],
      brandName: json["brandName"],
      fullStock: json["fullStock"],
      id: json["id"],
      mainImg: json["mainImg"],
      name: json["name"],
      otherImgs: json["otherImgs"],
      publicOffering: json["publicOffering"],
      sanCode: json["sanCode"],
      sanSufficient: json["sanSufficient"],
      skuImgs: json["skuImgs"],
      saleCountrys: json["saleCountrys"]
    );
    Map<String, dynamic> toJson() => 
    <String, dynamic>{
      'brandId': brandId,
      'brandLogo': brandLogo,
      'brandName': brandName,
      'fullStock': fullStock,
      'id': id,
      'mainImg': mainImg,
      'name': name,
      'otherImgs': otherImgs,
      'publicOffering': publicOffering,
      'sanCode': sanCode,
      'sanSufficient': sanSufficient,
      'skuImgs': skuImgs
    };
}


class SaleCountrys {

}