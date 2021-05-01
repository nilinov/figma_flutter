import 'dart:io';

import 'package:process_run/shell.dart';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');
  var shell = Shell();

  await for (HttpRequest request in server) {
    try {
      switch (request.uri.toString()) {
        case '/open_view':
          request.response.write('open view mode');
          shell.run("screen -d -m -S ServerFault");
          break;
        case '/start':
          request.response.write('start dev server');
          shell.run("flutter run -d web-server --web-port 3000");
          break;
        case '/reload':
          request.response.write('start reload');
          Process.run('chmod +x reload.sh && ./reload.sh', []);
          break;
        case '/restart':
          request.response.write('start restart');
          Process.run('chmod +x restart.sh && ./restart.sh', []);
          break;
        case '/install':
          request.response.write('start install');
          Process.run('chmod +x install.sh && ./install.sh', []);
          break;
        default:
          request.response.write('no found command');
      }
    } catch(e) {
      request.response.write('error ${e.toString()}');
    }

    await request.response.close();
  }
}