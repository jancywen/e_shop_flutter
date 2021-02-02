// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OrderStatistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatistics _$OrderStatisticsFromJson(Map<String, dynamic> json) {
  return OrderStatistics()
    ..obligationNum = json['obligationNum'] as num
    ..waitShipmentNum = json['waitShipmentNum'] as num
    ..waitReceiptNum = json['waitReceiptNum'] as num;
}

Map<String, dynamic> _$OrderStatisticsToJson(OrderStatistics instance) =>
    <String, dynamic>{
      'obligationNum': instance.obligationNum,
      'waitShipmentNum': instance.waitShipmentNum,
      'waitReceiptNum': instance.waitReceiptNum
    };
