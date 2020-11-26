import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:ciying/Utils/systemInfo.dart';

Future<SignInResponse> signInRequest(SignInRequest data) async {
  var _deveiceInfo = await GetDeviceInfo().getAllDeviceInfo();
  var _isPhysicalDevice = await GetDeviceInfo().isPhysicalDevice();
  var _deviceVersion = await GetDeviceInfo().deviceVersion();
  var _deviceType = await GetDeviceInfo().deviceType();
  SignInResponse response;
  Manager manager = Manager.instance;
  final stub = GateWayClient(manager.channel);
  data.deviceType = _deviceType.toString();
  data.deviceVersion = _deviceVersion.toString();
  data.isPhysicalDevice = _isPhysicalDevice;
  data.deviceInfo = _deveiceInfo.toString();
  var callConfig = await callOptionsConf();
  try {
    response = await stub.signIn(data, options: callConfig);
    logger.i("signInRequest: $response");
  } catch (e) {
    logger.e('Error! SignInRequest Caught error:', '$e');
    // await manager.channel.shutdown();
    return null;
  }
  return response;
}
