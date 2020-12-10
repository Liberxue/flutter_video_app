import 'package:ciying/Utils/store.dart';

class UserInfo {
  String token;
  String avatarImage;
  String phoneNumber;
  String coin;
  String accountLevel;
  UserInfo(
      {this.token,
      this.avatarImage,
      this.phoneNumber,
      this.coin,
      this.accountLevel});
}

Future<UserInfo> loadUserCache() async {
  var token = await Cache.getCache("Token");
  var phoneNumber = await Cache.getCache("PhoneNumber");
  var coin = await Cache.getCache("Coin");
  if (token == null || coin == null || phoneNumber == null) {
    return null;
  }
  UserInfo _user = new UserInfo();
  _user.token = await Cache.getCache("Token");
  _user.avatarImage = await Cache.getCache("AvatarImage");
  _user.phoneNumber = await Cache.getCache("PhoneNumber");
  _user.coin = await Cache.getCache("Coin");
  _user.accountLevel = await Cache.getCache("AccountLevel");
  return _user;
}
