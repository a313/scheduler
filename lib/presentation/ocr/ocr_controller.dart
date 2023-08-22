import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:scheduler/core/state_management/base_controller.dart';

import '../../routes/routes.dart';

class OcrController extends BaseController with StateMixin<CameraController> {
  List<CameraDescription> cameras = [];
  int cameraIndex = 0;
  late CameraController cameraController;
  bool lockUI = false;

  @override
  void onInit() {
    initCamera();
    super.onInit();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController =
        CameraController(cameras.first, ResolutionPreset.veryHigh);
    await cameraController.initialize();
    change(cameraController, status: RxStatus.success());
  }

  Future<RecognizedText> getRecognisedText(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    final recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    return recognisedText;
  }

  Future<void> onTakePicture() async {
    if (lockUI) return;
    lockUI = true;
    final image = await cameraController.takePicture();
    final result = await getRecognisedText(image);
    lockUI = false;
    if (result.text.isEmpty) {
      showSnackBar("No text was recognized");
      return;
    } else {
      Get.toNamed(Routes.ocrDetail, arguments: [image, result]);
    }
  }

  void uploadPicture() {}

  Future<void> swapCamera() async {
    cameraIndex++;
    if (cameraIndex == cameras.length) cameraIndex = 0;
    cameraController =
        CameraController(cameras[cameraIndex], ResolutionPreset.veryHigh);
    await cameraController.initialize();
    change(cameraController, status: RxStatus.success());
  }
}
