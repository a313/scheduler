import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  final _picker = ImagePicker();

  Uint8List? resizeImage(File input, int w, int h) {
    final img.Image? image = img.decodeImage(input.readAsBytesSync());
    if (image == null) return null;
    final img.Image thumbnail = img.copyResize(image, width: w, height: h);
    return Uint8List.fromList(img.encodeJpg(thumbnail));
  }

  Uint8List? resizeImageFromBytes(Uint8List input, int w, int h) {
    final img.Image? image = img.decodeImage(input);
    if (image == null) return null;
    final img.Image thumbnail = img.copyResize(image, width: w, height: h);
    return Uint8List.fromList(img.encodeJpg(thumbnail));
  }

  Future<Uint8List?> takeAvatar(ImageSource source) async {
    return null;

    // if (source == ImageSource.camera) {
    //   final bool isGranded = await Permission.camera.request().isGranted;

    //   if (!isGranded) {
    //     Get.dialog(CustomAlertDialog(
    //       title: "Tikop muốn truy cập Máy ảnh",
    //       desc: "Cho phép Tikop truy cập máy ảnh, để có thể chụp hình",
    //       actions: [
    //         AlertAction(
    //             text: "Từ chối",
    //             onPressed: () {
    //               if (Get.isDialogOpen ?? false) Get.back();
    //             }),
    //         AlertAction(
    //             isDefaultAction: true,
    //             text: "Đồng ý",
    //             onPressed: () {
    //               if (Get.isDialogOpen ?? false) Get.back();
    //               openAppSettings();
    //             })
    //       ],
    //     ));
    //     return null;
    //   }
    // }

    // if (source == ImageSource.gallery) {
    //   final bool isGranted = Platform.isIOS
    //       ? await Permission.photos.request().isGranted
    //       : await Permission.storage.request().isGranted;
    //   if (!isGranted) {
    //     Get.dialog(CustomAlertDialog(
    //       title: "Tikop muốn truy cập thư viện ảnh",
    //       desc:
    //           "Cho phép Tikop truy cập thư viện ảnh, để có thể chọn ảnh đại diện",
    //       actions: [
    //         AlertAction(
    //             text: "Từ chối",
    //             onPressed: () {
    //               if (Get.isDialogOpen ?? false) Get.back();
    //             }),
    //         AlertAction(
    //             isDefaultAction: true,
    //             text: "Đồng ý",
    //             onPressed: () {
    //               if (Get.isDialogOpen ?? false) Get.back();
    //               openAppSettings();
    //             })
    //       ],
    //     ));
    //     return null;
    //   }
    // }

    // final image = await _picker.pickImage(source: source);
    // if (image != null) {
    //   await Future.delayed(DUR_250);
    //   final cropped = await ImageCropper().cropImage(
    //       sourcePath: image.path,
    //       aspectRatioPresets: [
    //         CropAspectRatioPreset.square,
    //       ],
    //       cropStyle: CropStyle.circle,
    //       uiSettings: [
    //         AndroidUiSettings(
    //             toolbarTitle: 'Cropper',
    //             toolbarColor: Colors.deepOrange,
    //             toolbarWidgetColor: Colors.white,
    //             initAspectRatio: CropAspectRatioPreset.original,
    //             lockAspectRatio: false),
    //         IOSUiSettings(
    //           title: 'Cropper',
    //           minimumAspectRatio: 1,
    //         ),
    //       ]);
    //   if (cropped == null) {
    //     await Future.delayed(DUR_500);
    //     return takeAvatar(source);
    //   }
    //   return resizeImage(File(cropped.path), 256, 256);
    // }
    // return null;
  }

  Future<img.Image> rotatePortraitImage(img.Image originalImage) async {
    if (originalImage.width > originalImage.height) {
      return img.copyRotate(originalImage, angle: 90);
    }
    return originalImage;
  }

  Future<Uint8List> rotateLandscapeImage(Uint8List imageBytes) async {
    try {
      final originalImage = img.decodeImage(imageBytes)!;

      if (originalImage.width < originalImage.height) {
        img.Image fixedImage;
        fixedImage = img.copyRotate(originalImage, angle: -90);

        return Uint8List.fromList(img.encodeJpg(fixedImage));
      }
      return imageBytes;
    } catch (e) {
      return Uint8List(0);
    }
  }

  Uint8List compressIfNeed(Uint8List source, int maxSize) {
    final img.Image? image = img.decodeImage(source);
    Uint8List output = source;
    if (image != null && source.lengthInBytes > maxSize) {
      var quality = 90;
      var size = output.lengthInBytes;

      for (int i = 8; i > 0; i--) {
        final jpg = img.encodeJpg(image, quality: quality);
        size = jpg.lengthInBytes;
        log("Reduce Img Size $quality - sized: $size");
        output = jpg;
        if (size < maxSize) break;
        quality -= 10;
      }
    } else {
      return output;
    }
    return output;
  }

  Future<Uint8List?> pickImage({CropAspectRatio? aspectRatio}) async {
    XFile? pickedFile;
    Uint8List? result;
    try {
      pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
    } catch (e) {
      log(e.toString());
    }

    if (Platform.isAndroid && pickedFile == null) {
      pickedFile = await retrieveLostData();
    }
    if (pickedFile != null && pickedFile.path.isNotEmpty) {
      final croppedImage = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        compressQuality: 100,
        aspectRatio: aspectRatio,
      );

      if (croppedImage != null) {
        result = await croppedImage.readAsBytes();
      }
    }
    // return pickedFile?.readAsBytes();
    return result;
  }

  Future<XFile?> retrieveLostData() async {
    final LostDataResponse response = await _picker.retrieveLostData();
    if (response.file != null) {
      return response.file;
    }
    return null;
  }
}
