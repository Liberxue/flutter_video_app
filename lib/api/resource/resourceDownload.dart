import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:ciying/grpc/proto/search.pb.dart';

class ResourceDownload {
  static Future<ResourceDownloadResponse> resourceresourceDownloadAPIRequest(
      ResourceDownloadRequest data) async {
    ResourceDownloadResponse resourceDownloadResponse;
    var channelClient = await Manager().clientChannel();
    final stub = GateWayClient(channelClient);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        resourceDownloadResponse =
            await stub.resourceDownload(data, options: callConfig);
      } catch (e) {
        logger.e("resourceresourceDownloadAPIRequest Caught error", '$e');
        await channelClient.shutdown();
        return null;
      }
      await channelClient.shutdown();
      return resourceDownloadResponse;
    }
    await channelClient.shutdown();
    return null;
  }
}
