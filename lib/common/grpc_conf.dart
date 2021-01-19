class GrpcConfig {
  // grpc GrpcServerAddress
  // static const ConfGrpcServerAddress = "192.168.31.151";
  // static const ConfGrpcServerAddress = "47.100.40.14";
  static const ConfGrpcServerAddress = "grpc.ciyingai.com";

  // static const ConfGrpcPort = 5003;
  static const ConfGrpcPort = 8080;
  //grpc connection Timeout
  static const ConfconnectionTimeout = Duration(seconds: 150);
  // grpc idleTimeout
  static const ConfIdleTimeout = Duration(seconds: 150);
  static const String ApiVersion = "0.0.4";
}
