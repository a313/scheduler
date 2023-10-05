import 'dart:io';

extension FileExt on File {
  String get fileName =>
      path.split('/').last.replaceAll('.${path.split('.').last}', '');
}
