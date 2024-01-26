import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const TTRPGDiceCalculatorApp());
}

class TTRPGDiceCalculatorApp extends StatelessWidget {
  const TTRPGDiceCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table-Top RPG Dice Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TTRPGDiceCalculatorHomePage(
          title: 'TT-RPG Dice Calculator Home'),
    );
  }
}

class TTRPGDiceCalculatorHomePage extends StatefulWidget {
  final String title;

  // constructor
  const TTRPGDiceCalculatorHomePage({
    super.key,
    required this.title,
  });

  @override
  State<TTRPGDiceCalculatorHomePage> createState() =>
      _TTRPGDiceCalculatorHomePageState();
}

class _TTRPGDiceCalculatorHomePageState extends State<TTRPGDiceCalculatorHomePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Press the Camera button below to take a picture of your dice.'
                    '\n\n'
                    '(Ensure your camera lens is open.)',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ),
            const IconButton(
              onPressed: null,
              iconSize: 120,
              icon: Icon(Icons.camera_alt_rounded),
            ),
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }// end build()

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}//end class _TTRPGDiceCalculatorHomePageState
