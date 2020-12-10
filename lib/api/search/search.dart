import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:grpc/grpc_connection_interface.dart';

class Search {
  static Future<SearchResponse> searchAPIRequest(SearchRequest data) async {
    SearchResponse searchResponse;
    ClientChannel manager = await Manager().clientChannel();
    final stub = GateWayClient(manager);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        searchResponse = await stub.search(data, options: callConfig);
      } catch (e) {
        logger.e("searchAPIRequest Caught error", '$e');
        return null;
      }
      return searchResponse;
    }
    await manager.shutdown();
    return searchResponse;
  }
}
