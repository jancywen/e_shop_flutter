
class User {
    User({this.nickname, this.mobile, this.avatar, this.login});

    String nickname;
    String mobile;
    String avatar;
    String login;
    
    factory User.fromJson(Map<String,dynamic> json) => User(
      nickname: json["nickname"],
      mobile: json["mobile"],
      avatar: json["avatar"],
      login: json["login"],
    );
    Map<String, dynamic> toJson() => <String, dynamic>{
      'nickname': nickname,
      'mobile': mobile,
      'avatar': avatar,
      'login': login
    };
}
