import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:grpc/grpc_connection_interface.dart';

Future<SignUpResponse> signUpRequest(SignUpRequest signUpRequest) async {
  SignUpResponse signUpResponse;
  ClientChannel manager = await Manager().clientChannel();
  final stub = GateWayClient(manager);
  try {
    signUpResponse = await stub.signUp(signUpRequest);
  } catch (e) {
    logger.e("signInResponse Caught error", "$e");
    await manager.shutdown();
    return null;
  }
  await manager.shutdown();
  return signUpResponse;
}
