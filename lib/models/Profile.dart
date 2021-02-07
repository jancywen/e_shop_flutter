import "user.dart";

class Profile {
    Profile({this.user, this.token, this.locale});

    User user;
    String token;
    String locale;
    
    factory Profile.fromJson(Map<String,dynamic> json) => Profile(
      user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'],
      locale: json['locale'],
    );
    Map<String, dynamic> toJson() => <String, dynamic>{
      'user': user,
      'token': token,
      'locale': locale
    };
}
