class GrpcConfig {
  // grpc GrpcServerAddress
  static const ConfGrpcServerAddress = "192.168.2.189";
  static const ConfGrpcPort = 5003;
  //grpc connection Timeout
  static const ConfconnectionTimeout = Duration(seconds: 90);
  // grpc idleTimeout
  static const ConfIdleTimeout = Duration(minutes: 1);
}
