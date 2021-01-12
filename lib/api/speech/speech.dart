import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:grpc/grpc_connection_interface.dart';

class SpeechApi {
  static Future<getGetSpeechFileResponse> getSpeechFileApiRequest(
      GetSpeechFileRequest data) async {
    getGetSpeechFileResponse getSpeechFileResponse;
    ClientChannel manager = await Manager().clientChannel();
    final stub = GateWayClient(manager);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        getSpeechFileResponse =
            await stub.getSpeechFile(data, options: callConfig);
      } catch (e) {
        logger.e("getSpeechFileApiRequest Caught error",
            '$e' '$getSpeechFileResponse');
        await manager.shutdown();
        return null;
      }
      await manager.shutdown();
      return getSpeechFileResponse;
    }
    await manager.shutdown();
    return getSpeechFileResponse;
  }

  static Future<GetSpeeckListResponse> getSpeeckListApiRequest(
      GetSpeeckListRequest data) async {
    GetSpeeckListResponse getSpeeckListResponse;
    ClientChannel manager = await Manager().clientChannel();
    final stub = GateWayClient(manager);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        getSpeeckListResponse =
            await stub.getSpeeckList(data, options: callConfig);
      } catch (e) {
        logger.e("getSpeechFileApiRequest Caught error",
            '$e' '$getSpeeckListResponse');
        await manager.shutdown();
        return null;
      }
      await manager.shutdown();
      return getSpeeckListResponse;
    }
    await manager.shutdown();
    return getSpeeckListResponse;
  }
}
