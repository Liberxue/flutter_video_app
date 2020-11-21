import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/util/logger.dart';
import 'package:ciying/util/store.dart';
import 'package:grpc/grpc.dart';

class Resource {
  static Future<ResourcePreviewResponse> resourcePreviewAPIRequest(
      ResourcePreviewRequest data) async {
    ResourcePreviewResponse resourcePreviewResponse;
    Manager manager = Manager.instance;
    final stub = GateWayClient(manager.channel);
    var _token = await Cache.getToken();
    try {
      resourcePreviewResponse = await stub.resourcePreview(data,
          options: CallOptions(
              metadata: {"authorization": "bearer " + _token.toString()}));
    } catch (e) {
      logger.e("resourcePreviewAPIRequest Caught error", '$e');
    }
    return resourcePreviewResponse;
  }
}
