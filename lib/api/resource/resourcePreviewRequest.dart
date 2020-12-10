import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:ciying/grpc/proto/search.pb.dart';

class Resource {
  static Future<ResourcePreviewResponse> resourcePreviewAPIRequest(
      ResourcePreviewRequest data) async {
    ResourcePreviewResponse resourcePreviewResponse;
    var channelClient = await Manager().clientChannel();
    final stub = GateWayClient(channelClient);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        resourcePreviewResponse =
            await stub.resourcePreview(data, options: callConfig);
      } catch (e) {
        logger.e("resourcePreviewAPIRequest Caught error", '$e');
        await channelClient.shutdown();
        return null;
      }
      await channelClient.shutdown();
      return resourcePreviewResponse;
    }
    await channelClient.shutdown();
    return null;
  }
}
