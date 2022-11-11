import 'package:dart_msg_server/dart_msg_server.dart' as dart_msg_server;
import 'dart:io';

const String serverName = 'dartServer';
const int port = 8080;

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.anyIPv4, port);
  print('server up:${server.address} :port ${server.port}');

  var countUsers = 0;
  await for (HttpRequest request in server) {
    request.response.headers.set('dartServer', serverName);

    request.response.write('hello ${++countUsers} + ${request.uri.path}');

    await request.response.close();
  }
}
