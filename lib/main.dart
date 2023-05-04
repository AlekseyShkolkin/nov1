// import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:qualcontr/start_page.dart';

// import 'package:image_picker/image_picker.dart';

import './objects_list.dart';

void main() => runApp(QualContr());

class QualContr extends StatefulWidget {
  @override
  QualContrState createState() => QualContrState();
}

class QualContrState extends State<QualContr> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(),
    );
  }
}
