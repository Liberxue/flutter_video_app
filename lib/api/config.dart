import 'package:ciying/common/constants.dart';
import 'package:grpc/grpc.dart';

class Manager {
  // 工厂模式
  factory Manager() => _getInstance();
  static Manager get instance => _getInstance();
  static Manager _instance;
  ClientChannel channel;
  Manager._internal() {
    channel = ClientChannel(
      GrpcConfig.ConfGrpcServerAddress,
      port: GrpcConfig.ConfGrpcPort,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectionTimeout: GrpcConfig.ConfconnectionTimeout,
        idleTimeout: GrpcConfig.ConfIdleTimeout,
        // backoffStrategy: backOffstrategy,
      ),
    );
  }
  static Manager _getInstance() {
    if (_instance == null) {
      _instance = new Manager._internal();
    }
    return _instance;
  }
}
