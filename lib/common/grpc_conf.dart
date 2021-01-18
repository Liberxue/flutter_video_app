class GrpcConfig {
  // grpc GrpcServerAddress
  static const ConfGrpcServerAddress = "192.168.31.151";
  // static const ConfGrpcServerAddress = "192.168.1.104";
  // static const ConfGrpcServerAddress = "ciying.mikoo.net";

  static const ConfGrpcPort = 5003;
  // static const ConfGrpcPort = 8080;
  //grpc connection Timeout
  static const ConfconnectionTimeout = Duration(seconds: 150);
  // grpc idleTimeout
  static const ConfIdleTimeout = Duration(seconds: 150);
  static const String ApiVersion = "0.0.4";
}
