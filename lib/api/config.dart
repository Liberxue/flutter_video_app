import 'package:grpc/grpc.dart';

class APIConfig {
  static const Address = "192.168.0.111";
  // static const Address = "123.58.211.129";

    // static const Address = "192.168.1.106";
  static const Port = 5003;
}

class Manager {
  // 工厂模式
  factory Manager() => _getInstance();
  static Manager get instance => _getInstance();
  static Manager _instance;
  ClientChannel channel;
  Manager._internal() { 
      channel = ClientChannel(
      APIConfig.Address,
      port: APIConfig.Port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }
  static Manager _getInstance() {
    if (_instance == null) {
      _instance = new Manager._internal();
    }
    return _instance;
  }
}
