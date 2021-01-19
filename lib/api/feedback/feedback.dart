import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:grpc/grpc_connection_interface.dart';

class Feedback {
  static Future<FeedbackResponse> feedbackAPIRequest(
      FeedbackRequest data) async {
    FeedbackResponse feedbackResponse;
    ClientChannel manager = await Manager().clientChannel();
    final stub = GateWayClient(manager);
    var callConfig = await callOptionsConf();
    if (callConfig.metadata.map != null) {
      try {
        feedbackResponse = await stub.feedback(data, options: callConfig);
      } catch (e) {
        logger.e("feedbackAPIRequest Caught error", '$e');
        await manager.shutdown();
        return null;
      }
      await manager.shutdown();
      return feedbackResponse;
    }
    await manager.shutdown();
    return null;
  }
}
