import 'package:CiYing/api/signIn/signUp.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';

Future<SignUpResponse> signUp(SignUpRequest data) async {

  return await signUpRequest(data);
}
  