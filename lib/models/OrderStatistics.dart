class OrderStatistics {
    OrderStatistics({this.obligationNum, this.waitReceiptNum, this.waitShipmentNum});

    num obligationNum;
    num waitShipmentNum;
    num waitReceiptNum;
    
    factory OrderStatistics.fromJson(Map<String,dynamic> json) => OrderStatistics(
      obligationNum: json["obligationNum"],
      waitShipmentNum: json["waitShipmentNum"],
      waitReceiptNum: json["waitReceiptNum"]
    );
    Map<String, dynamic> toJson() => <String, dynamic>{
      'obligationNum': obligationNum,
      'waitShipmentNum': waitShipmentNum,
      'waitReceiptNum': waitReceiptNum
    };
}
