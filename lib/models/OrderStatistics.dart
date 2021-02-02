import 'package:json_annotation/json_annotation.dart';

part 'OrderStatistics.g.dart';

@JsonSerializable()
class OrderStatistics {
    OrderStatistics();

    num obligationNum;
    num waitShipmentNum;
    num waitReceiptNum;
    
    factory OrderStatistics.fromJson(Map<String,dynamic> json) => _$OrderStatisticsFromJson(json);
    Map<String, dynamic> toJson() => _$OrderStatisticsToJson(this);
}
