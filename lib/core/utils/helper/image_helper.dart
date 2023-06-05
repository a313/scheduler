// // ignore_for_file: constant_identifier_names

// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';
// import 'package:image/image.dart' as img;

// const MAX_IMAGE_SIZE = 1024 * 1024 * 2;

// class ImageHelper {
//   static Uint8List compressIfNeed(Uint8List source, int maxSize) {
//     final img.Image? image = img.decodeImage(source);
//     Uint8List output = source;
//     if (image != null && source.lengthInBytes > maxSize) {
//       var size = output.lengthInBytes;
//       var quality = 90;
//       for (int i = 8; i > 0; i--) {
//         log('Reduce $i quality: $quality');
//         final jpg = img.encodeJpg(image, quality: quality);
//         size = jpg.lengthInBytes;
//         output = jpg;
//         if (size < maxSize) break;
//         quality -= 10;
//       }
//     } else {
//       return output;
//     }
//     return output;
//   }

//   static Future<Uint8List> compressFileIfNeed(File source, int maxSize) async {
//     var buffer = source.readAsBytesSync();
//     if (buffer.length <= maxSize) return buffer;
//     log('Required Compress Image ${buffer.length} > maxSize:$maxSize');
//     var quality = 90;
//     try {
//       Uint8List? output;
//       for (int i = 10; i > 0; i--) {
//         output = await FlutterImageCompress.compressWithFile(
//           source.absolute.path,
//           minHeight: 1920,
//           minWidth: 1080,
//           quality: quality,
//         );
//         var size = output!.lengthInBytes;
//         log('Reduce $i quality: $quality size:$size', name: 'ABC');
//         quality -= 10;
//         if (size <= maxSize) {
//           break;
//         }
//       }
//       return output!;
//     } on Exception {
//       return compressIfNeed(buffer, maxSize);
//     }
//   }
// }
