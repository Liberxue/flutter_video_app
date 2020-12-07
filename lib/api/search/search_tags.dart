import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:grpc/grpc_connection_interface.dart';

class SearchTagsApi {
  static Future<SearchTagResponse> searchTagsAPIRequest(
      SearchTagRequest data) async {
    SearchTagResponse searchTagResponse;
    ClientChannel manager = await Manager().clientChannel();
    final stub = GateWayClient(manager);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        searchTagResponse = await stub.searchTag(data, options: callConfig);
      } catch (e) {
        logger.e("searchTagsAPIRequest Caught error", '$e');
        return null;
      }
      return searchTagResponse;
    }
    return searchTagResponse;
  }
}
