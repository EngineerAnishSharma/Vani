import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraUtils {
  static late List<CameraDescription> cameras;
  static late CameraController cameraController;
  static bool mounted = false;

  static Future initCamera() async {
    try {
      final status = await Permission.camera.request();
      if (status != PermissionStatus.granted) {
        throw 'Camera Permission not granted';
      }
      cameras = await availableCameras();
      cameraController = CameraController(cameras[1], ResolutionPreset.high,
          enableAudio: false);
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> startCamera() async {
    try {
      await initCamera();
      await cameraController.initialize();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static CameraPreview viewCamera() {
    return CameraPreview(cameraController);
  }

  static Future stopCamera() async {
    cameraController.dispose();
  }
}
