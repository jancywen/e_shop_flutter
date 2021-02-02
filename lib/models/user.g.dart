// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..nickname = json['nickname'] as String
    ..mobile = json['mobile'] as String
    ..avatar = json['avatar'] as String
    ..login = json['login'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'nickname': instance.nickname,
      'mobile': instance.mobile,
      'avatar': instance.avatar,
      'login': instance.login
    };
