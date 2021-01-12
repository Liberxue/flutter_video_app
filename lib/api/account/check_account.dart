import 'package:ciying/Utils/store.dart';
import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/accountManager.pbgrpc.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';

class CheckAcountStatus {
  static Future<CheckAccountIdStatusResponse> getAccountCoinByAccountIdRequest(
      CheckAccountIdStatusRequest data) async {
    CheckAccountIdStatusRequest checkAccountIdStatusRequest =
        new CheckAccountIdStatusRequest();
    var _userId = await Cache.getUserId();
    checkAccountIdStatusRequest.accountId = _userId.toString();
    CheckAccountIdStatusResponse checkAccountIdStatusResponse;
    var channelClient = await Manager().clientChannel();
    final stub = GateWayClient(channelClient);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        checkAccountIdStatusResponse = await stub.checkAccountIdStatus(
            checkAccountIdStatusRequest,
            options: callConfig);
      } catch (e) {
        logger.e("getAccountCoinByAccountIdRequest Caught error", '$e');
        await channelClient.shutdown();
        return null;
      }
      await channelClient.shutdown();
      return checkAccountIdStatusResponse;
    }
    await channelClient.shutdown();
    return null;
  }
}
