import 'package:ciying/api/signIn/signUp.dart';
import 'package:ciying/grpc/proto/gateWay.pbgrpc.dart';

Future<SignUpResponse> signUp(SignUpRequest data) async {

  return await signUpRequest(data);
}
  