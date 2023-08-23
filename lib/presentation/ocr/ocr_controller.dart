import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
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
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final recognisedText = await textRecognizer.processImage(inputImage);
    await textRecognizer.close();
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
