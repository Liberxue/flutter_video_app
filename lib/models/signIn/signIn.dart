import 'package:CiYing/api/signIn/signIn.dart';
import 'package:CiYing/grpc/proto/gateWay.pb.dart';


Future<SignInResponse> signIn(SignInRequest data) async {
    // SignInResponse signInResponse = await signInRequest(data);
    //   if(signInResponse.code!=ResponseCode.SUCCESSFUL){
    //       return signInResponse;// 多语言支持？#issue https://github.com/PomCloud/CiYing/issues/3
    //   }
    //   if (signInResponse.token.length<1){
    //     return  signInResponse;
    //   }
      return await signInRequest(data);
  }
  
  