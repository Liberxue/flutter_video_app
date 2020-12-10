import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/accountManager.pbgrpc.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';

class GetMsgChannel {
  static Future<GetMsgChannelResponse> getAccountCoinByAccountIdRequest(
      GetMsgChannelRequest data) async {
    GetMsgChannelResponse getMsgChannelResponse;
    var channelClient = await Manager().clientChannel();
    final stub = GateWayClient(channelClient);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        getMsgChannelResponse =
            await stub.getMsgChannel(data, options: callConfig);
      } catch (e) {
        logger.e("getMsgChannelResponse Caught error", '$e');
        await channelClient.shutdown();
        return null;
      }
      await channelClient.shutdown();
      return getMsgChannelResponse;
    }
    await channelClient.shutdown();
    return null;
  }
}
