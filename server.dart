import 'dart:io';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    switch (request.uri.toString()) {
      case '/open_view':
        request.response.write('open view mode');
        Process.run('chmod +x open_screen.sh && ./open_screen.sh', []);
        break;
      case '/start':
        request.response.write('start dev server');
        Process.run('chmod +x start.sh && ./start.sh', []);
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

    await request.response.close();
  }
}