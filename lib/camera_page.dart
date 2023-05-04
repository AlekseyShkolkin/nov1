import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:qualcontr/objects_list.dart';

class CameraPage extends StatefulWidget {
  final CameraDescription camera;

  const CameraPage({Key key, this.camera}) : super(key: key);
  @override
  _CameraPageState createState() => _CameraPageState();
  CameraDescription get getCamera => camera;
}

class _CameraPageState extends State<CameraPage> {
  File imageFile;
  CameraController _controller;
  List<CameraDescription> _cameras;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();
    _setupCameras();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _setupCameras() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.first, ResolutionPreset.medium);
    await _controller.initialize();
    setState(() {
      _isReady = true;
    });
  }

  Future<void> _takePicture() async {
    try {
      var imagePath = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      await _controller.takePicture().then((XFile file) {
        imagePath = file.path;
      });
      final imageFile = File(imagePath);
      Navigator.pop(context, imageFile);
    } catch (e) {
      print('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isReady) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(_controller),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.grey.withOpacity(0.5),
              height: 300,
              child: Center(
                child: FloatingActionButton(
                  onPressed: _takePicture,
                  child: Icon(Icons.camera_alt),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
