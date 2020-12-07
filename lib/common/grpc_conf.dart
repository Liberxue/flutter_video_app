class GrpcConfig {
  // grpc GrpcServerAddress
  // static const ConfGrpcServerAddress = "192.168.31.151";
  static const ConfGrpcServerAddress = "106.14.242.66";

  static const ConfGrpcPort = 5003;
  //grpc connection Timeout
  static const ConfconnectionTimeout = Duration(seconds: 70);
  // grpc idleTimeout
  static const ConfIdleTimeout = Duration(seconds: 70);
  static const String ApiVersion = "0.0.1";
}
