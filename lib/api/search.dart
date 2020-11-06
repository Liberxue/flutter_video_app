import 'package:CiYing/api/config.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:CiYing/grpc/proto/search.pb.dart';
import 'package:CiYing/util/store.dart';
import 'package:grpc/grpc.dart';
class Search{
static Future<SearchResponse> searchAPIRequest(SearchRequest data) async {
    SearchResponse searchResponse;
    Manager manager = Manager.instance;
    final stub = GateWayClient(manager.channel);
    var  _token = await Cache.getToken();
    try {
      searchResponse = await stub.search(data,options: CallOptions(metadata: {"authorization": "bearer "+_token.toString()}));
    } catch (e) {
      print('searchAPIRequest Caught error: $e');
    }
    return searchResponse;
  }
}