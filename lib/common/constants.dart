import 'package:flutter/material.dart';



class CommonConfig {
  static const  String ConfAppName = "词影";
  static const kPrimaryColor = Colors.black;
  static const kPrimaryLightColor = Color(0xFFACACAC);
  static const  red = Color(0xffF72804);
  static const  grey = Colors.grey;
  static const  IsdebugShowCheckedModeBanner = false;
}

class GrpcConfig{
  // grpc GrpcServerAddress
  static const ConfGrpcServerAddress = "192.168.31.151";
  static const ConfGrpcPort = 5003;
  //grpc connection Timeout
  static const ConfconnectionTimeout = Duration(seconds: 90);
  // grpc idleTimeout
  static const ConfIdleTimeout= Duration(minutes: 1),
}