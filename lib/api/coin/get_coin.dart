import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/accountManager.pbgrpc.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';

class GetAcountCoin {
  static Future<GetAccountCoinByAccountIdResponse>
      getAccountCoinByAccountIdRequest(
          GetAccountCoinByAccountIdRequest data) async {
    GetAccountCoinByAccountIdResponse getAccountCoinByAccountIdResponse;
    var channelClient = await Manager().clientChannel();
    final stub = GateWayClient(channelClient);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        getAccountCoinByAccountIdResponse =
            await stub.getAccountCoinByAccountId(data, options: callConfig);
      } catch (e) {
        logger.e("getAccountCoinByAccountIdRequest Caught error", '$e');
        return null;
      }
      return getAccountCoinByAccountIdResponse;
    }
    return null;
  }
}
