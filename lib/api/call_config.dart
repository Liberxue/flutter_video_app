import 'package:ciying/Utils/logger.dart';
import 'package:ciying/common/grpc_conf.dart';
import 'package:ciying/Utils/store.dart';
import 'package:ciying/Utils/systemInfo.dart';
import 'package:grpc/service_api.dart';

Future<CallOptions> callOptionsConf() async {
  var _token = await Cache.getToken();
  // if (_token == null) {
  //   logger.e("callOptionsConf token is null");
  //   return null;
  // }
  var _deveiceInfo = await GetDeviceInfo().deviceType();
  var _isPhysicalDevice = await GetDeviceInfo().isPhysicalDevice();
  var _deviceVersion = await GetDeviceInfo().deviceVersion();
  return CallOptions(metadata: {
    "authorization": "bearer " + _token.toString(),
    "apiversion": GrpcConfig.ApiVersion,
    "time": DateTime.now().millisecondsSinceEpoch.toString(),
    "device": _deveiceInfo.toString(),
    "isPhysicalDevice": _isPhysicalDevice.toString(),
    "deviceVersion": _deviceVersion.toString(),
    "networkInfo": "miss",
  });
}

Future<CallOptions> checkTokenCallOptionsConf() async {
  var _token = await Cache.getToken();
  if (_token == null) {
    return null;
  }
  var _deveiceInfo = await GetDeviceInfo().deviceType();
  var _isPhysicalDevice = await GetDeviceInfo().isPhysicalDevice();
  var _deviceVersion = await GetDeviceInfo().deviceVersion();
  return CallOptions(metadata: {
    "authorization": "bearer " + _token.toString(),
    "apiversion": GrpcConfig.ApiVersion,
    "time": DateTime.now().millisecondsSinceEpoch.toString(),
    "device": _deveiceInfo.toString(),
    "isPhysicalDevice": _isPhysicalDevice.toString(),
    "deviceVersion": _deviceVersion.toString(),
    "networkInfo": "miss",
  });
}
