import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/util/systemInfo.dart';
import 'package:grpc/grpc.dart';

Future<SignInResponse> signInRequest(SignInRequest data) async {
  SignInResponse response;
  Manager manager = Manager.instance;
  final stub = GateWayClient(manager.channel);
  data.deviceType = getDeviceInfo();
  try {
    response = await stub.signIn(data,options: CallOptions(metadata: {'authorization': 'bearer grpc.auth.token'}));
  } catch (e) {
    print('signInRequest Caught error: $e');
    return null;
  }
  // await manager.channel.shutdown();
  return response;
}
