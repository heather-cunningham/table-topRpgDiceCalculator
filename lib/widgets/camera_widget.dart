import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key});

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController _cameraController;
  //late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    //initializeCamera();

    /*final List cameras = availableCameras() as List;
    _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _cameraController.initialize();*/
  }

  // Future<void> initializeCamera() async {
  //   final cameras = await availableCameras();
  //   _cameraController = CameraController(cameras[0], ResolutionPreset.medium);
  //   _initializeControllerFuture = _cameraController.initialize();
  // }

  Future<void> takePic() async {
    try {
      //await _initializeControllerFuture;

      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      //await _cameraController.takePicture(/*path*/);
      await _cameraController.takePicture();

      // ignore: avoid_print
      print('Picture taken at $path');
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      //future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_cameraController);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }//end build()


  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

}//end class _CameraState
