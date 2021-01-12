import 'package:ciying/api/call_config.dart';
import 'package:ciying/api/config.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';
import 'package:ciying/Utils/logger.dart';
import 'package:ciying/Utils/systemInfo.dart';
import 'package:grpc/grpc_connection_interface.dart';

Future<SignInResponse> signInRequest(SignInRequest data) async {
  var _deveiceInfo = await GetDeviceInfo().getAllDeviceInfo();
  var _isPhysicalDevice = await GetDeviceInfo().isPhysicalDevice();
  var _deviceVersion = await GetDeviceInfo().deviceVersion();
  var _deviceType = await GetDeviceInfo().deviceType();
  SignInResponse response;
  ClientChannel manager = await Manager().clientChannel();
  final stub = GateWayClient(manager);
  data.deviceType = _deviceType.toString();
  data.deviceVersion = _deviceVersion.toString();
  data.isPhysicalDevice = _isPhysicalDevice;
  data.deviceInfo = _deveiceInfo.toString();
  var callConfig = await callOptionsConf();
  try {
    response = await stub.signIn(data, options: callConfig);
  } catch (e) {
    logger.e('Error! SignInRequest Caught error:', '$e');
    await manager.shutdown();
    return null;
  }
  await manager.shutdown();
  return response;
}
