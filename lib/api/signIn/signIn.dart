import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/util/logger.dart';
import 'package:ciying/util/systemInfo.dart';
import 'package:grpc/grpc.dart';

Future<SignInResponse> signInRequest(SignInRequest data) async {
  SignInResponse response;
  Manager manager = Manager.instance;
  final stub = GateWayClient(manager.channel);
  data.deviceType = getDeviceInfo();
  try {
    response = await stub.signIn(data,
        options:
            CallOptions(metadata: {'authorization': 'bearer grpc.auth.token'}));
    print(response);
  } catch (e) {
    logger.e('Error! SignInRequest Caught error:', '$e');
    await manager.channel.shutdown();
    return null;
  }
  return response;
}
