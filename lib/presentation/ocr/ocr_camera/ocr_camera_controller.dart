import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_cropper/image_cropper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:scheduler/core/state_management/base_controller.dart';
import 'package:scheduler/core/utils/image_helper.dart';
import 'package:scheduler/domain/entities/ekyc.dart';
import 'package:scheduler/routes/routes.dart';

import '../../../core/utils/transform_image.dart';
import '../../../core/utils/util.dart';

class OcrCameraController extends BaseController
    with WidgetsBindingObserver, StateMixin<CameraController> {
  Rx<Uint8List> recentPhoto = Uint8List(0).obs;

  CameraController? cameraController;
  late List<CameraDescription> cameras;
  final CameraType type;

  GlobalKey cameraKey = GlobalKey();
  GlobalKey frameKey = GlobalKey();
  bool isPickingPic = false;

  bool canPickImage = true;
  bool isRequestingPermissionStorage = false;
  bool isChooseImageFromLibrary = false;
  final Ekyc ekyc;
  OcrCameraController(this.type, this.ekyc);

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    super.onInit();
  }

  @override
  void onReady() {
    requestPermission();
    super.onReady();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    cameraController?.dispose();
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? controller = cameraController;
    log("CameraController $state", name: 'AppLifecycle');
    if (controller == null ||
        !controller.value.isInitialized ||
        isRequestingPermissionStorage ||
        isChooseImageFromLibrary) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      log("Dispose Camera");
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      if (isRequestingPermissionStorage) {
        isRequestingPermissionStorage = false;
        return;
      }
      onNewCameraSelected(controller.description);
    }
  }

  Future<void> requestPermission() async {
    await requestCameraPermission();
    await requestPhotoPermission();
  }

  Future<void> requestCameraPermission() async {
    if (await Permission.camera.request().isGranted) {
      requestCameraAndInit();
    } else {
      showSnackBar('Ko có quyền camera');
      // if (Platform.isAndroid) {
      // final result = await Get.toNamed(Routes.cameraPermission) as bool?;
      // if (result != null && result) {
      //   requestCameraAndInit();
      // }
    }
  }

  Future<void> requestPhotoPermission() async {
    isRequestingPermissionStorage = true;
    if (Platform.isIOS && await Permission.photos.request().isGranted) {
      getRecentImage();
    }
    if (Platform.isAndroid && await Permission.storage.request().isGranted) {
      getRecentImage();
    }
    isRequestingPermissionStorage = false;
  }

  Future<void> requestCameraAndInit() async {
    try {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        initCamera();
      } else {
        showSnackBar("Camera không khả dụng");
      }
    } on CameraException catch (e) {
      log('Error: ${e.description}');
    }
  }

  void initCamera() {
    if (type == CameraType.portrait) {
      onInitFrontCamera();
    } else {
      onInitBackCamera();
    }
  }

  void onInitFrontCamera() {
    final description = getCameraDescriptionFromLens(CameraLensDirection.front);
    if (description != null) {
      onNewCameraSelected(description);
    }
  }

  void onInitBackCamera() {
    final description = getCameraDescriptionFromLens(CameraLensDirection.back);
    if (description != null) {
      onNewCameraSelected(description);
    }
  }

  CameraDescription? getCameraDescriptionFromLens(CameraLensDirection lens) {
    for (int i = 0; i < cameras.length; i++) {
      if (cameras[i].lensDirection == lens) {
        return cameras[i];
      }
    }
    return null;
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    log("onNewCameraSelected Camera");
    if (cameraController != null) {
      await cameraController!.dispose();
    }
    final CameraController newController = CameraController(
      cameraDescription,
      ResolutionPreset.ultraHigh,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    cameraController = newController;

    try {
      await cameraController!.initialize();
    } on CameraException catch (e) {
      if (kDebugMode) showSnackBar("CameraException: ${e.toString()}");
      Get.back();
      return;
    } catch (e) {
      if (kDebugMode) showSnackBar("onException: ${e.toString()}");
      Get.back();
      return;
    }

    change(newController, status: RxStatus.success());
    try {
      cameraController!.setFlashMode(FlashMode.off);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> onTakePicture() async {
    if (cameraController != null) {
      if (cameraController!.value.isTakingPicture) {
        showSnackBar("Đang chụp ảnh");
        return;
      }

      final file = await cameraController!.takePicture();
      if (type == CameraType.portrait) {
        ekyc.faceImage = file.path;
        Get.offNamed(Routes.ocrConfirm, arguments: ekyc);
      } else {
        final imageBytes = await file.readAsBytes();
        final cropped = getImageCropped(imageBytes);
        final directory = await getApplicationDocumentsDirectory();
        final tmpFile = File('${directory.path}/${file.name}');
        tmpFile.writeAsBytesSync(cropped);
        Get.offNamed(Routes.ocrDetail, arguments: [tmpFile, type, ekyc]);
      }
    }
  }

  void onCloseCameraView() {}

  Future<void> onPickImage() async {
    bool isGranted = false;
    if (Platform.isAndroid) {
      isGranted = await Permission.storage.isGranted;
    } else if (Platform.isIOS) {
      isGranted = await Permission.photos.isGranted;
    }
    if (isGranted) {
      if (isPickingPic) return;
      onChooseImageFromLibrary();
    } else {
      handleRequestLibraryPermission();
    }
  }

  Future<void> handleRequestLibraryPermission() async {
    // isRequestingPermissionStorage = true;
    // final result =
    //     await Get.toNamed(Routes.cameraPermission, arguments: true) as bool?;
    // isRequestingPermissionStorage = false;
    // if (result != null && result) {
    //   onChooseImageFromLibrary();
    //   getRecentImage();
    // }
  }

  Future<void> onChooseImageFromLibrary() async {
    isPickingPic = true;
    CropAspectRatio? aspectRatio;
    if (type != CameraType.portrait) {
      aspectRatio = const CropAspectRatio(ratioX: 340.0, ratioY: 220.0);
    }
    isChooseImageFromLibrary = true;
    final image = await ImageHelper().pickImage(aspectRatio: aspectRatio);
    isPickingPic = false;
    isChooseImageFromLibrary = false;
    if (image != null) {
      openConfirmScene(image);
    } else {
      showSnackBar(UNKNOWN_ERROR);
    }
  }

  Uint8List getImageCropped(Uint8List imageBytes) {
    final img.Image? image = img.decodeImage(imageBytes);
    final cropInfo = TransformImage.getCropInfo(cameraKey, frameKey);
    if (image != null) {
      final Uint8List bytes = type == CameraType.portrait
          ? TransformImage.cropPortrait(image, cropInfo)
          : TransformImage.cropCMND(image, cropInfo);

      return bytes;
    }
    return Uint8List(0);
  }

  Uint8List getScreenShotCropped(Uint8List imageBytes) {
    final img.Image? image = img.decodeImage(imageBytes);
    final cropInfo = TransformImage.getCropInfo(cameraKey, frameKey);
    if (image != null) {
      final Uint8List bytes = TransformImage.cropScreenShot(image, cropInfo);
      return bytes;
    }
    return Uint8List(0);
  }

  Future<void> getRecentImage() async {
    try {
      final List<Album> albums =
          await PhotoGallery.listAlbums(mediumType: MediumType.image);
      if (albums.isNotEmpty) {
        recentPhoto.value = Uint8List.fromList(
            await PhotoGallery.getAlbumThumbnail(albumId: albums.first.id));
      }
    } on Exception catch (e) {
      log.printError(info: "getRecentImage $e");
    }
  }

  Future<void> openConfirmScene(File file) async {
    if (type == CameraType.portrait) {
      ekyc.faceImage = file.path;
      Get.offNamed(Routes.ocrConfirm, arguments: ekyc);
    } else {
      Get.offNamed(Routes.ocrDetail, arguments: [file, type, ekyc]);
    }
  }
}
