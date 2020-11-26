import 'package:ciying/grpc/proto/common.pbenum.dart';

String responseCodeEnum(ResponseCode e) {
  // var responseCodeMap = ResponseCode.values;
  // for (var e in responseCodeMap) {
// }
  switch (e) {
    case ResponseCode.SUCCESSFUL:
      return "成功";
    // case ResponseCode.PhoneNumberExisting:
    //   return "手机号码已存在，已被使用";
    case ResponseCode.AccessDenied:
      return "拒绝访问";
    case ResponseCode.AccountDoesNotExist:
      return "账号不存在";
    case ResponseCode.AccountOrPasswordIsNotCorrect:
      return "账号或密码不正确";
    case ResponseCode.FAILED:
      return "操作失败";
    case ResponseCode.FrequentOperation:
      return "操作频繁";
    case ResponseCode.InternalFault:
      return "内部错误";
    case ResponseCode.ParameterIsNotValid:
      return "参数不合法";
    case ResponseCode.PhoneNumberExisting:
      return "手机号码已注册,请登录";
    default:
      return '未知 $e';
  }
}
