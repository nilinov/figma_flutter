import 'dart:io';
import 'package:path/path.dart' as path;
// import 'package:process_run/cmd_run.dart';

main() async {
  String filePath = 'pubspec.yaml';
  var input = await File(filePath).readAsString();
  var version = input.split('\n').where((element) => !element.contains('#')).firstWhere((element) => element.contains('version'), orElse: () => '').replaceAll('version: ', '').replaceAll('+', '__').trim();

  var directory2 = await Directory('docs\\$version').create(recursive: true);

  copyDirectory(Directory('build\\web'), directory2);

  print('copy done');

  // var result = await Process.run('firebase', ['deploy', 'deploy', '--only', '--hosting'], workingDirectory: directory2.path);


  // ProcessCmd cmd = ProcessCmd('echo', ['hello world'], runInShell: true);


  // var shell = Shell();

//   await shell.run('''
//
// cd ${directory2.path};
// firebase deploy --only hosting;
//
// ''');

}

void copyDirectory(Directory source, Directory destination) =>
    source.listSync(recursive: false)
        .forEach((var entity) {
      if (entity is Directory) {
        var newDirectory = Directory(path.join(destination.absolute.path, path.basename(entity.path)));
        newDirectory.createSync();

        copyDirectory(entity.absolute, newDirectory);
      } else if (entity is File) {
        entity.copySync(path.join(destination.path, path.basename(entity.path)));
      }
    });
