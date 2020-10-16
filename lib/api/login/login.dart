import 'package:CiYing/api/config.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:CiYing/util/systemInfo.dart';
import 'package:grpc/grpc.dart';

Future<LoginResponse> loginRequest(String user, passWord) async {
  LoginResponse response;
  Manager manager = Manager.instance;
  print("this's loginRequest test");
  final stub = GateWayClient(manager.channel);
  LoginRequest loginRequest = LoginRequest();
  loginRequest.user = user;
  loginRequest.passWord = passWord;
  loginRequest.deviceType = getDeviceInfo();
  try {
    response = await stub.login(loginRequest,options: CallOptions(metadata: {'bearer': 'grpc.auth.token'}));
    print(response.code);
    print(response.message);
    print(response.data);
    print(response.token);
  } catch (e) {
    print('loginRequest Caught error: $e');
  }
  // await manager.channel.shutdown();
  return response;
}
