import 'package:CiYing/api/config.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:CiYing/grpc/proto/search.pb.dart';
import 'package:CiYing/util/store.dart';
import 'package:grpc/grpc.dart';

Future<SearchResponse> searchAPIRequest(SearchRequest data) async {
  SearchResponse searchResponse;
  Manager manager = Manager.instance;
  final stub = GateWayClient(manager.channel);
  String _token="";
  Cache.getToken().then((token)=> {
      _token=token
  });
  try {
    searchResponse = await stub.search(data,options: CallOptions(metadata: {'authorization': 'bearer '+_token}));
  } catch (e) {
    print('searchAPIRequest Caught error: $e');
  }
  return searchResponse;
}
