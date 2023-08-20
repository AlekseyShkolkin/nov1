import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import './object_detail_lkp.dart';

import 'model_lkp.dart';

class DbHelperLkp {
  static final DbHelperLkp _dbHelperLkp = DbHelperLkp._internal();
  String tblTodo = 'todo';
  String colId = 'id';
  String coldate = 'date';
  String colTitle = 'title';
  String colsquareclear = 'squareclear';
  String colconstroldcoat = 'constroldcoat';
  String colinst = 'inst';
  String coliso8501 = 'iso8501';
  String colprepmethod = 'prepmethod';
  String coldegrofdegr = 'degrofdegr';
  String coldegrofoxid = 'degrofoxid';
  String coldegrofdedust1 = 'degrofdedust1';
  String coldegrofdedust2 = 'degrofdedust2';
  String colroughness = 'roughness';
  String colsurfsalts = 'surfsalts';

  String coltempair = 'tempair';
  String coltempsurf = 'tempsurf';
  String colrelathumid = 'relathumid';
  String coldewpoint = 'dewpoint';
  String coldifftemp = 'difftemp';

  String coltechcondmat = 'techcondmat';
  String colnumdoflay = 'numdoflay';
  String colsquarenew = 'squarenew';
  String colthickofwellay = 'thickofwellay';
  String colthickofdrylay = 'thickofdrylay';
  String colcontin = 'contin';
  String coltimedry = 'timedry';
  String coldegrdry = 'degrdry';
  String coldefdur = 'defdur';

  String colapperance = 'apperance';
  String colbgcolor = 'bgcolor';
  String coladhesion = 'adhesion';
  String coldielcont = 'dielcont';

  String colthickinsulmeter = 'thickinsulmeter';
  String coladhesmeter = 'adhesmeter';
  String colcontinmeter = 'continmeter';
  String colsetvik = 'setvik';

  String colchangecolor = 'changecolor';
  String colchangegloss = 'changegloss';
  String colmudretant = 'mudretant';
  String colchalking = 'chalking';
  String coldescription = 'description';

  String colphoto = 'photo';
  String colphotoISO = 'photoISO';
  String colphotoDust = 'photoDust';
  String colphotoRoughness = 'photoRoughness';

  String colfilial = 'filial';
  String coldolzhnpredskom = 'dolzhnpredskom';
  String colfiopredskom = 'fiopredskom';
  String coldolzhnproizvrab = 'dolzhnproizvrab';
  String colfioproizvrab = 'fioproizvrab';
  String coldolzhnnachuchastka = 'dolzhnnachuchastka';
  String colfionachuchastka = 'fionachuchastka';
  String coldolzhnpredstzakazch = 'dolzhnpredstzakazch';
  String colfiopredstzakazch = 'fiopredstzakazch';
  String coldolzhnpredstzakazchSK = 'dolzhnpredstzakazchSK';
  String colfiopredstzakazchSK = 'fiopredstzakazchSK';
  String coldolzhnpredststroitSK = 'dolzhnpredststroitSK';
  String colfiopredststroitSK = 'fiopredststroitSK';
  String coldolzhnpredststroit = 'dolzhnpredststroit';
  String colfiopredststroit = 'fiopredststroit';
  String coldolzhndruglic = 'dolzhndruglic';
  String colfiodruglic = 'fiodruglic';

  DbHelperLkp._internal();

  factory DbHelperLkp() {
    return _dbHelperLkp;
  }

  static Database _db;

  Future<Database> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.path + '/todos_1.db';
    final Database dbTodos =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  Future<void> _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT, ' +
            '$coldate TEXT,$colfiodruglic TEXT,$coldolzhndruglic TEXT,$colfiopredststroit TEXT,$coldolzhnpredststroit TEXT,$colfiopredststroitSK TEXT,$coldolzhnpredststroitSK TEXT,$colfiopredstzakazch TEXT,$colfiopredstzakazchSK TEXT,$coldolzhnpredstzakazchSK TEXT,$coldolzhnpredstzakazch TEXT,$colfionachuchastka TEXT,$coldolzhnnachuchastka TEXT,$colfioproizvrab TEXT,$coldolzhnproizvrab TEXT,$colfiopredskom TEXT,$coldolzhnpredskom TEXT,$colfilial TEXT,$colphotoRoughness TEXT,$colphotoDust TEXT,$colphotoISO TEXT, $colphoto TEXT,$colsquareclear TEXT,$colconstroldcoat TEXT,$colinst TEXT,$coliso8501 TEXT,$colprepmethod TEXT,$coldegrofdegr TEXT,$coldegrofoxid TEXT,$coldegrofdedust1 TEXT,$coldegrofdedust2 TEXT,$colroughness TEXT,$colsurfsalts TEXT,$coltempair TEXT,$coltempsurf TEXT,$colrelathumid TEXT,$coldewpoint TEXT,$coldifftemp TEXT,$coltechcondmat TEXT,$colnumdoflay TEXT,$colsquarenew TEXT,$colthickofwellay TEXT,$colthickofdrylay TEXT,$colcontin TEXT,$coltimedry TEXT,$coldegrdry TEXT,$coldefdur TEXT,$colapperance TEXT,$colbgcolor TEXT,$coladhesion  TEXT,$coldielcont  TEXT,$colthickinsulmeter TEXT,$coladhesmeter TEXT,$colcontinmeter TEXT,$colsetvik TEXT,$colchangecolor TEXT,$colchangegloss TEXT,$colmudretant TEXT,$colchalking TEXT,$coldescription TEXT)');
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

  Future<int> getTodoCountLkp() async {
    final Database db = await this.db;
    final List<Map<String, dynamic>> result =
        await db.rawQuery('SELECT COUNT(*) FROM $tblTodo');
    final int countLkp = Sqflite.firstIntValue(result);
    return countLkp;
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
