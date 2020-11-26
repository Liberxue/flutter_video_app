import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/grpc/proto/search.pb.dart';
import 'package:ciying/Utils/logger.dart';

class SearchTagsApi {
  static Future<SearchTagResponse> searchTagsAPIRequest(
      SearchTagRequest data) async {
    SearchTagResponse searchTagResponse;
    Manager manager = Manager.instance;
    final stub = GateWayClient(manager.channel);
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
