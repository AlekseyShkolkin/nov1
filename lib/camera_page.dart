import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  final String imageName;

  CameraPage(this.imageName);

  @override
  State<CameraPage> createState() => _CameraPageIpState();
}

class _CameraPageIpState extends State<CameraPage> {
  double opacity = 0.5;

  List<CameraDescription> cameras;
  CameraController controller;
  Future<void> _initializeControllerFuture;
  bool _isReady = false;

  File gradeA = File('assets/images/grade_A.jpg');
  File gradeB = File('assets/images/grade_B.jpg');
  File gradeC = File('assets/images/grade_C.jpg');
  File gradeD = File('assets/images/grade_D.jpg');

  File bSt2 = File('assets/images/B_St_2.jpg');
  File cSt2 = File('assets/images/C_St_2.jpg');
  File dSt2 = File('assets/images/D_St_2.jpg');

  File bSt3 = File('assets/images/B_St_3.jpg');
  File cSt3 = File('assets/images/C_St_3.jpg');
  File dSt3 = File('assets/images/D_St_3.jpg');

  File bSa1 = File('assets/images/B_Sa_1.jpg');
  File cSa1 = File('assets/images/C_Sa_1.jpg');
  File dSa1 = File('assets/images/D_Sa_1.jpg');

  File bSa2 = File('assets/images/B_Sa_2.jpg');
  File cSa2 = File('assets/images/C_Sa_2.jpg');
  File dSa2 = File('assets/images/D_Sa_2.jpg');

  File aSa25 = File('assets/images/A_Sa_25.jpg');
  File bSa25 = File('assets/images/B_Sa_25.jpg');
  File cSa25 = File('assets/images/C_Sa_25.jpg');
  File dSa25 = File('assets/images/D_Sa_25.jpg');

  File aSa3 = File('assets/images/A_Sa_3.jpg');
  File bSa3 = File('assets/images/B_Sa_3.jpg');
  File cSa3 = File('assets/images/C_Sa_3.jpg');
  File dSa3 = File('ssets/images/D_Sa_3.jpg');

  File aFl = File('assets/images/A_Fl.jpg');
  File bFl = File('assets/images/B_Fl.jpg');
  File cFl = File('assets/images/C_Fl.jpg');
  File dFl = File('assets/images/D_Fl.jpg');

  File dust1 = File('assets/images/dust1.jpg');
  File dust2 = File('assets/images/dust2.jpg');
  File dust3 = File('assets/images/dust3.jpg');
  File dust4 = File('assets/images/dust4.jpg');
  File dust5 = File('assets/images/dust5.jpg');

  File imagenull = File('assets/images/imagenull.jpg');
  File roughness = File('assets/images/roughness.jpg');

  List<File> images = [];

  @override
  void initState() {
    super.initState();
    getCameras().then((_) {
      initializeCamera();
    });
  }

  Future<void> getCameras() async {
    cameras = await availableCameras();
  }

  Future<void> initializeCamera() async {
    controller = CameraController(cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = controller.initialize();
    await _initializeControllerFuture;
    setState(() {
      _isReady = true;
    });
  }

  void _takePicture() async {
    if (!_isReady) {
      return;
    }
    try {
      final image = await controller.takePicture();
      setState(() {
        _storedImage = File(image.path);
      });
      Navigator.pop(context, _storedImage);
    } catch (e) {
      print(e);
    }
  }

  File _storedImage;

  @override
  Widget build(BuildContext context) {
    File image;
    switch (widget.imageName) {
      case 'grade_A':
        image = gradeA;
        break;
      case 'grade_B':
        image = gradeB;
        break;
      case 'grade_C':
        image = gradeC;
        break;
      case 'grade_D':
        image = gradeD;
        break;

      case 'B_St_2':
        image = bSt2;
        break;
      case 'C_St_2':
        image = cSt2;
        break;
      case 'D_St_2':
        image = dSt2;
        break;

      case 'B_St_3':
        image = bSt3;
        break;
      case 'C_St_3':
        image = cSt3;
        break;
      case 'D_St_3':
        image = dSt3;
        break;

      case 'B_Sa_1':
        image = bSa1;
        break;
      case 'C_Sa_1':
        image = cSa1;
        break;
      case 'D_Sa_1':
        image = dSa1;
        break;

      case 'B_Sa_2':
        image = bSa2;
        break;
      case 'C_Sa_2':
        image = cSa2;
        break;
      case 'D_Sa_2':
        image = dSa2;
        break;

      case 'A_Sa_25':
        image = aSa25;
        break;
      case 'B_Sa_25':
        image = bSa25;
        break;
      case 'C_Sa_25':
        image = cSa25;
        break;
      case 'D_Sa_25':
        image = dSa25;
        break;

      case 'A_Sa_3':
        image = aSa3;
        break;
      case 'B_Sa_3':
        image = bSa3;
        break;
      case 'C_Sa_3':
        image = cSa3;
        break;
      case 'D_Sa_3':
        image = dSa3;
        break;

      case 'A_Fl':
        image = aFl;
        break;
      case 'B_Fl':
        image = bFl;
        break;
      case 'C_Fl':
        image = cFl;
        break;
      case 'D_Fl':
        image = dFl;
        break;

      case 'dust1':
        image = dust1;
        break;
      case 'dust2':
        image = dust2;
        break;
      case 'dust3':
        image = dust3;
        break;
      case 'dust4':
        image = dust4;
        break;
      case 'dust5':
        image = dust5;
        break;

      case 'imagenull':
        image = imagenull;
        break;

      case 'roughness':
        image = roughness;
        break;

      default:
        image = imagenull;
      // Действие при неизвестном значении imageName
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Сравнение образца'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: _isReady
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: CameraPreview(controller),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 500),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/${widget.imageName}.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.bottomCenter,
                      child: FloatingActionButton(
                        onPressed: _takePicture,
                        child: Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Slider(
                          value: opacity,
                          min: 0.2,
                          max: 1.0,
                          onChanged: (double value) {
                            if (value >= 0 && value <= 100) {
                              setState(() {
                                opacity = value;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
