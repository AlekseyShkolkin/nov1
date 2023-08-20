import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Todo {
  int _id;
  String _title;
  String _date;

  Todo(
    this._title,
    this._date,
  );

  Todo.withId(
    this._id,
    this._title,
    this._date,
  );

  int get id => _id;

  String get title => _title;

  String get todoDate => _date;

  set title(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _title = newTitle;
    }
  }

  set todoDate(newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = _title;
    map['date'] = _date;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _id = o['id'];
    _title = o['title'];
    _date = o['date'];
  }
}
