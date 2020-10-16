import 'package:flutter/material.dart';
import 'package:CiYing/grpc/proto/gateWay.pbgrpc.dart';
import 'package:grpc/grpc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

getRemoteData() async {
  final user = "test";
  final channel = ClientChannel(
    '192.168.31.151',
    port: 50051,
    options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
  );
  final stub =GateWayClient(channel);
  try {
    var response = await stub.login(LoginRequest()..user = user);
    print('服务端返回信息: ${response.message}');
  } catch (e) {
    print('Caught error: $e');
  }
  await channel.shutdown();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: getRemoteData,
        tooltip: '获取grpc数据',
        child: Icon(Icons.add),
      ),
    );
  }
}
