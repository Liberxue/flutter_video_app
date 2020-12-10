import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/favorite.pb.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:grpc/grpc_connection_interface.dart';

class Favorites {
  static Future<FavoriteActionResponse> favoriteActionAPIRequest(
      FavoriteActionRequest data) async {
    FavoriteActionResponse favoriteActionResponse;
    ClientChannel manager = await Manager().clientChannel();
    final stub = GateWayClient(manager);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        favoriteActionResponse =
            await stub.favoriteAction(data, options: callConfig);
      } catch (e) {
        logger.e("favoritesAPIRequest Caught error", '$e');
        await manager.shutdown();
        return null;
      }
      await manager.shutdown();
      return favoriteActionResponse;
    }
    await manager.shutdown();
    return null;
  }
}
