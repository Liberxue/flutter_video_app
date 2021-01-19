import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/accountManager.pbgrpc.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';

class GetAcountCoin {
  static Future<GetAccountCoinByAccountIdResponse>
      getAccountCoinByAccountIdRequest(
          GetAccountCoinByAccountIdRequest data) async {
    GetAccountCoinByAccountIdResponse getAccountCoinByAccountIdResponse;
    var channelClient = await Manager().clientChannel();
    final stub = GateWayClient(channelClient);
    var callConfig = await checkTokenCallOptionsConf();
    if (callConfig == null) {
      await channelClient.shutdown();
      return null;
    }
    try {
      getAccountCoinByAccountIdResponse =
          await stub.getAccountCoinByAccountId(data, options: callConfig);
    } catch (e) {
      await channelClient.shutdown();
      return null;
    }
    await channelClient.shutdown();
    return getAccountCoinByAccountIdResponse;
  }
}
