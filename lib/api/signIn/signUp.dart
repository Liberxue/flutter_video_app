import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/util/logger.dart';
import 'package:ciying/util/systemInfo.dart';

Future<SignUpResponse> signUpRequest(SignUpRequest signUpRequest) async {
  SignUpResponse signUpResponse;
  Manager manager = Manager.instance;
  final stub = GateWayClient(manager.channel);
  signUpRequest.device = getDeviceInfo();
  try {
    signUpResponse = await stub.signUp(signUpRequest);
  } catch (e) {
    logger.e("signInResponse Caught error", "$e");
    await manager.channel.shutdown();
  }
  return signUpResponse;
}
