import 'package:ciying/api/signIn/signIn.dart';
import 'package:ciying/grpc/proto/gateWay.pb.dart';

Future<SignInResponse> signIn(SignInRequest data) async {
  // SignInResponse signInResponse = await signInRequest(data);
  //   if(signInResponse.code!=ResponseCode.SUCCESSFUL){
  //       return signInResponse;// 多语言支持？#issue https://github.com/PomCloud/ciying/issues/3
  //   }
  //   if (signInResponse.token.length<1){
  //     return  signInResponse;
  //   }
  return await signInRequest(data);
}
