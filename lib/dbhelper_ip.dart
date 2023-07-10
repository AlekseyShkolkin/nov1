import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './object_detail_ip.dart';

import 'model_ip.dart';

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  String tblTodo = 'todo';
  String colId = 'id';
  String colTitle = 'title';
  String colPiketkm = 'piketkm';
  String colCoordinate = 'coordinate';
  String colLengthpit = 'lengthpit';
  String colDepthpit = 'depthpit';
  String colOsnovanie = 'osnovanie';
  String colDate = 'date';
  String colDescription = 'description';
  String coldiameter = 'diameter';
  String colthickpipe = 'thickpipe';
  String colgradesteel = 'gradesteel';
  String colmetalldamage = 'metalldamage';
  String colcharmetdamage = 'charmetdamage';
  String collocmetdamage = 'locmetdamage';
  String colsizemetdamage = 'sizemetdamage';
  String coltypeinsul = 'typeinsul';
  String colinsuladhes = 'insuladhes';
  String colinsulcharadhes = 'insulcharadhes';
  String colinsulcondit = 'insulcondit';
  String colthickinsul = 'thickinsul';
  String colinsuldamage = 'insuldamage';
  String colcharinsuldamage = 'charinsuldamage';
  String collocinsuldamage = 'locinsuldamage';
  String colsizeinsuldamage = 'sizeinsuldamage';
  String coltypeinsulrest = 'typeinsulrest';
  String colinsuladhesrest = 'insuladhesrest';
  String colthickinsulrest = 'thickinsulrest';
  String colcontininsulrest = 'contininsulrest';
  String coltickinsulmeter = 'tickinsulmeter';
  String coltickmetallmeter = 'tickmetallmeter';
  String coladhesmeter = 'adhesmeter';
  String colcontinmeter = 'continmeter';
  String colsetvik = 'setvik';
  String colphoto = 'photo';

  String colphotometdef1 = 'photometdef1';
  String colphotometdef2 = 'photometdef2';
  String colphotometdef3 = 'photometdef3';
  String colphotometdef4 = 'photometdef4';
  String colphotometdef5 = 'photometdef5';
  String colphotometdef6 = 'photometdef6';
  String colphotometdef7 = 'photometdef7';
  String colphotometdef8 = 'photometdef8';
  String colphotometdef9 = 'photometdef9';
  String colphotometdef10 = 'photometdef10';
  String colphotoinsuldef1 = 'photoinsuldef1';
  String colphotoinsuldef2 = 'photoinsuldef2';
  String colphotoinsuldef3 = 'photoinsuldef3';
  String colphotoinsuldef4 = 'photoinsuldef4';
  String colphotoinsuldef5 = 'photoinsuldef5';
  String colphotoinsuldef6 = 'photoinsuldef6';
  String colphotoinsuldef7 = 'photoinsuldef7';
  String colphotoinsuldef8 = 'photoinsuldef8';
  String colphotoinsuldef9 = 'photoinsuldef9';
  String colphotoinsuldef10 = 'photoinsuldef10';
  String colphotorest = 'photorest';
  String colphotodesc = 'photodesc';

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  static Database _db;

  Future<Database> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.path + '/todos_ip.db';
    final Database dbTodos =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  Future<void> _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT, ' +
            '$colDescription TEXT, $colphotodesc TEXT, $colphotorest TEXT, $colphotoinsuldef10 TEXT,$colphotoinsuldef9 TEXT,$colphotoinsuldef8 TEXT,$colphotoinsuldef7 TEXT,$colphotoinsuldef6 TEXT,$colphotoinsuldef5 TEXT,$colphotoinsuldef4 TEXT,$colphotoinsuldef3 TEXT,$colphotoinsuldef2 TEXT,$colphotoinsuldef1 TEXT, $colphotometdef10 TEXT,$colphotometdef9 TEXT,$colphotometdef8 TEXT,$colphotometdef7 TEXT,$colphotometdef6 TEXT,$colphotometdef5 TEXT,$colphotometdef4 TEXT,$colphotometdef3 TEXT,$colphotometdef2 TEXT,$colphotometdef1 TEXT, $colphoto TEXT,$colOsnovanie TEXT,$colPiketkm TEXT,$colCoordinate TEXT,$colLengthpit TEXT,$colDepthpit TEXT, $colDate TEXT,$coldiameter TEXT,$colthickpipe TEXT,$colgradesteel TEXT,$colmetalldamage TEXT,$colcharmetdamage TEXT,$collocmetdamage TEXT,$colsizemetdamage TEXT,$coltypeinsul TEXT,$colinsuladhes TEXT,$colinsulcharadhes TEXT,$colinsulcondit TEXT,$colthickinsul TEXT,$colinsuldamage TEXT,$colcharinsuldamage TEXT,$collocinsuldamage TEXT,$colsizeinsuldamage TEXT,$coltypeinsulrest TEXT,$colinsuladhesrest TEXT,$colthickinsulrest TEXT,$colcontininsulrest TEXT,$coltickinsulmeter TEXT,$coltickmetallmeter TEXT,$coladhesmeter TEXT,$colcontinmeter TEXT,$colsetvik TEXT)');
  }

  Future<int> insertTodo(Todo todo) async {
    final Database db = await this.db;
    final int result = await db?.insert(tblTodo, todo.toMap()) ?? 0;
    return result;
  }

  Future<List<Map<String, Object>>> getTodos() async {
    final Database db = await this.db;
    final List<Map<String, Object>> result = await db?.rawQuery(
        'SELECT * FROM $tblTodo ORDER BY $colId DESC'); /*$colPriority ASC */
    return result;
  }

  Future<int> getCount() async {
    Database db = await (this.db as FutureOr<Database>);
    final int result = Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT (*) FROM $tblTodo'));
    return result;
  }

  Future<int> updateTodo(Todo todo) async {
    final Database db = await this.db;
    final int result = await db?.update(tblTodo, todo.toMap(),
            where: '$colId = ?', whereArgs: [todo.id]) ??
        0;
    return result;
  }

  Future<int> deleteTodo(int id) async {
    int result;
    final Database db = await this.db;
    result =
        await db?.rawDelete('DELETE FROM $tblTodo WHERE $colId = $id') ?? 0;
    return result;
  }
}
