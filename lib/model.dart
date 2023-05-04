import 'dart:io';

import 'package:flutter/foundation.dart';

class Object {
  final String id;
  final String nameObject;
  final String date;
  final String initState;
  final String prepMethod;
  final String roughness;
  final String additionally;
  final String color;
  final String iso;
  final File imageProvider;

  Object({
    @required this.id,
    @required this.nameObject,
    @required this.date,
    @required this.initState,
    @required this.prepMethod,
    @required this.roughness,
    @required this.additionally,
    @required this.color,
    @required this.iso,
    @required this.imageProvider,
  });
}
