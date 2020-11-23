import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/favorite.pb.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/util/logger.dart';

class Favorites {
  static Future<FavoriteActionResponse> favoriteActionAPIRequest(
      FavoriteActionRequest data) async {
    FavoriteActionResponse favoriteActionResponse;
    Manager manager = Manager.instance;
    final stub = GateWayClient(manager.channel);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        favoriteActionResponse =
            await stub.favoriteAction(data, options: callConfig);
      } catch (e) {
        logger.e("favoritesAPIRequest Caught error", '$e');
        return null;
      }
      return favoriteActionResponse;
    }
  }
}
