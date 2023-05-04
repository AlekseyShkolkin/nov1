import 'dart:async';
import 'dart:io';

import 'package:color_picker_camera/color_picker_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:image_picker/image_picker.dart';

import './camera_page.dart';

DbHelper helper = DbHelper();

class ObjectListIp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ObjectListIpState();
}

class ObjectListIpState extends State {
  DbHelper helper = DbHelper();
  List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = <Todo>[];
      getData();
    }
    int cntIP = todos.length;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Проверка качества ИП')),
      ),
      body: objectListItems(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Добавить объект',
        onPressed: () {
          navigateToDetail(Todo('', ''));
        },
        tooltip: 'Добавить объект',
        child: const Icon(
          Icons.add,
          size: 35.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }

  ListView objectListItems() {
    return ListView.builder(
        padding: const EdgeInsets.only(top: 8.0),
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int position) {
          return Container(
            padding: const EdgeInsets.only(bottom: 2.0),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 235, 235, 243),
                    blurRadius: 10.0,
                    spreadRadius: -9.0,
                    offset: Offset(0.0, 7.0)),
              ],
            ),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.delete_sweep, color: Colors.white),
                      Text(
                        'Удалить',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
              key: Key(todos[position].id.toString()),
              onDismissed: (DismissDirection direction) {
                final int id = todos[position].id;
                final String title = todos[position].title.toString();
                setState(() {
                  todos.removeAt(position);
                  helper.deleteTodo(id);
                  getData();
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$title - удалено'),
                  ),
                );
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  // color: getColor(todos[position].id),
                  /*priority*/
                  elevation: 0.0,
                  child: ListTile(
                    leading: Column(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 7.0,
                          backgroundColor: Colors.white,
                          // getColor(todos[position].id), /*priority*/
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                      ],
                    ),

                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        todos[position].title +
                                ' ' +
                                todos[position].piketkm +
                                'км' ??
                            '',
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w800),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          descriptionParser(todos[position].osnovanie ?? ''),
                          //  todos[position].description != null ? todos[position].description : 'Empty content',
                          style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ), // it smell
                        Text(
                          'Создано ' + todos[position].todoDate,
                          style: const TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38),
                        ),
                      ],
                    ),
                    contentPadding:
                        const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10),
                    // contentPadding: EdgeInsets.zero,
                    isThreeLine: true,
                    onTap: () {
                      debugPrint('Tapped on ' + todos[position].id.toString());
                      navigateToDetail(todos[position]);
                    },
                  )),
            ),
          );
        });
  }

  String descriptionParser(String desc) {
    if (desc.isNotEmpty) {
      return desc.length > 42 ? desc.substring(0, 42) + '...' : desc;
    }
    return '...';
  }

  void getData() {
    final Future<Database> dbFuture = helper.initializeDb();
    dbFuture.then((Database result) {
      final Future<List> todosFuture = helper.getTodos();
      todosFuture?.then((List result) {
        final List<Todo> todoList = <Todo>[];
        for (int i = 0; i < (result?.length ?? 0); i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }
        setState(() {
          todos = todoList;
        });
        debugPrint('Items: ' + todos.length.toString());
        var lenlistip = todos.length.toString();
      });
    });
  }

  Future<void> navigateToDetail(Object object) async {
    final bool result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => ObjectDetail(object: object)),
    );

    if (result == true) {
      getData();
    }
  }
}

class ObjectDetail extends StatefulWidget {
  const ObjectDetail({Key key, @required this.object});
  final Object object;
  @override
  State<StatefulWidget> createState() => ObjectDetailState(object);
}

class ObjectDetailState extends State<ObjectDetail> {
  Todo object;

  Color bgColor;
  String selectedColor = "";

  Color _cardColor = Colors.white;
  final List<String> _osnovanie = [
    'ВТД',
    'Коррозионное обследование',
    'Данные электрометрии',
    'Обследование тройников',
  ];
  TextEditingController titleController = TextEditingController();
  TextEditingController piketkmController = TextEditingController();
  TextEditingController osnovanieController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    isEdit = object.title == '' ? false : true;
    titleController.text = object.title ?? '';
    piketkmController.text = object.piketkm ?? '';
    osnovanieController.text = object.osnovanie ?? '';
    descriptionController.text = object.description ?? '';
  }

  ObjectDetailState(this.object);

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.w600,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: _cardColor,
      appBar: AppBar(
          title: Text(
        isEdit ? 'Изменить запись' : 'Добавить запись',
      )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: 10),
                TextFormField(
                  maxLength: 50,
                  onSaved: (String value) {
                    object.title = value;
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Наименование не введено';
                    } else if (value.length > 50) {
                      return 'Максимальная длина 50';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  controller: titleController,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: 'Наименование объекта *',
                    hintText: 'Как называется объект контроля',
                    prefixIcon: Icon(Icons.account_balance_outlined),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        titleController.clear();
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLength: 5,
                  onSaved: (value) {
                    object.piketkm = value;
                  },
                  controller: piketkmController,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: 'Километр газопровода',
                    hintText: 'Километр проведения',
                    helperText: 'км',
                    prefixIcon: Icon(Icons.map_sharp),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        piketkmController.clear();
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(color: Colors.blue, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    // FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}'),
                        allow: true),
                  ],
                ),
                SizedBox(height: 10),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.map),
                    labelText: 'Основание для проведения шурфовки',
                  ),
                  items: _osnovanie.map((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  style: textStyle,
                  value: object.osnovanie,
                  onChanged: (String value) {
                    object.osnovanie = value;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLength: 50,
                  onSaved: (value) {
                    object.description = value;
                  },
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Доплнительные сведения',
                    hintText: 'Особенности, дефекты, условия, замечания...',
                    // helperText: 'Keep it short, this is just a demo',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(137),
                  ],
                  // onSaved: (value) => newUser.story = value,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.amber, // background
                      onPrimary: Colors.white,
                      elevation: 2,
                      padding: const EdgeInsets.all(13.0),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0)) // foreground
                      ),
                  onPressed: () => save(),
                  child: Text(
                    isEdit ? 'Редактировать' : 'Добавить',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: isEdit
          ? FloatingActionButton(
              onPressed: () {
                debugPrint('Click Floated Back.');
                confirmDelete();
              },
              elevation: 5.0,
              backgroundColor: Colors.red,
              tooltip: 'Удалить запись',
              child: const Icon(
                Icons.clear,
                size: 35.0,
              ))
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void confirmDelete() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Вы действительно хотите удалить запись?',
            style: TextStyle(fontSize: 15.0)),
        actions: <Widget>[
          TextButton(
              child: const Text('Закрыть'),
              onPressed: () => Navigator.of(context).pop()),
          TextButton(
              child: const Text(
                'Удалить',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                helper.deleteTodo(object.id);
                Navigator.of(context).pop();
                Navigator.pop(context, true);
              })
        ],
      ),
    );
  }

  void save() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      object.todoDate = DateFormat.yMMMMd().format(DateTime.now());
      if (object.id != null) {
        helper.updateTodo(object);
      } else {
        helper.insertTodo(object);
      }
      Navigator.pop(context, true);
    }
  }

  void updateTitle() {
    setState(() {
      object.title = titleController.text;
    });
  }

  void updatePiketkm() {
    setState(() {
      object.piketkm = piketkmController.text;
    });
  }

  void updateOsnovanie() {
    setState(() {
      object.osnovanie = osnovanieController.text;
    });
  }

  void updateDescription() {
    setState(() {
      object.description = descriptionController.text;
    });
  }
}

class Todo {
  int _id;
  String _title;
  String _piketkm;
  String _osnovanie;
  String _description;
  String _date;

  Todo(this._title, this._date,
      [this._piketkm, this._osnovanie, this._description]);

  Todo.withId(this._id, this._title, this._date,
      [this._piketkm, this._osnovanie, this._description]);

  int get id => _id;
  String get title => _title;
  String get piketkm => _piketkm;
  String get osnovanie => _osnovanie;
  String get todoDate => _date;
  String get description => _description;

  set title(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _title = newTitle;
    }
  }

  set piketkm(String newPiketkm) {
    if ((newPiketkm?.length ?? 0) <= 255) {
      _piketkm = newPiketkm;
    }
  }

  set osnovanie(String newOsnovanie) {
    if ((newOsnovanie?.length ?? 0) <= 255) {
      _osnovanie = newOsnovanie;
    }
  }

  set todoDate(newDate) {
    _date = newDate;
  }

  set description(String newDescription) {
    if ((newDescription?.length ?? 0) <= 255) {
      _description = newDescription;
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = _title;
    map['piketkm'] = _piketkm;
    map['osnovanie'] = _osnovanie;
    map['date'] = _date;
    map['description'] = _description;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _id = o['id'];
    _title = o['title'];
    _piketkm = o['piketkm'];
    _osnovanie = o['osnovanie'];
    _date = o['date'];
    _description = o['description'];
  }
}

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  String tblTodo = 'todo';
  String colId = 'id';
  String colTitle = 'title';
  String colPiketkm = 'piketkm';
  String colOsnovanie = 'osnovanie';
  String colDate = 'date';
  String colDescription = 'description';

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
            '$colDescription TEXT,$colOsnovanie TEXT,$colPiketkm TEXT,$colDate TEXT)');
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
