import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';

Future<SignUpResponse> signUpRequest(SignUpRequest signUpRequest) async {
  SignUpResponse signUpResponse;
  Manager manager = Manager.instance;
  final stub = GateWayClient(manager.channel);
  try {
    print("signUpRequest signUpRequest ====================");
    signUpResponse = await stub.signUp(signUpRequest);
  } catch (e) {
    logger.e("signInResponse Caught error", "$e");
    return null;
  }
  return signUpResponse;
}
