import 'dart:async';
import 'dart:io';

import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:color_picker_camera/color_picker_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:image_picker/image_picker.dart';

import './camera_page.dart';

DbHelper helper = DbHelper();

class ObjectList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ObjectListState();
}

class _ObjectListState extends State {
  DbHelper helper = DbHelper();
  List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = <Todo>[];
      getData();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Проверка качества ЛКП')),
      ),
      body: objectListItems(),
      floatingActionButton: FloatingActionButton(
        heroTag: 'Добавить объект',
        onPressed: () {
          navigateToDetail(Todo('', 2, ''));
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
                        todos[position].title ?? '',
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.w800),
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          descriptionParser(todos[position].description ?? ''),
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
        int cnt = todos.length;
        debugPrint('Items: ' + todos.length.toString());
      });
    });
  }

  /*выбор цвета*/
  // Color getColor(int priority) {
  //   switch (priority) {
  //     case 1:
  //       return Colors.white;
  //     case 2:
  //       return Colors.white;
  //     case 3:
  //       return Colors.white;

  //     default:
  //       return Colors.white;
  //   }
  // }

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
  final File imageFile;
  ObjectDetail({Key key, this.object, this.imageFile}) : super(key: key);
  final Object object;
  @override
  State<StatefulWidget> createState() => ObjectDetailState(object);
}

class ObjectDetailState extends State<ObjectDetail> {
  Todo object;

  final List<String> _priorities = ['Высокий', 'Средний', 'Низкий'];
  final List<String> _inSt = ['A', 'B', 'C', 'D'];
  final List<String> _prepMethod = ['Sa', 'St', 'Fl'];
  final List<String> _roughness = ['Coarse', 'Medium', 'Fine'];
  final List<String> _iso8501 = ['A Sa2,5', 'A Sa3'];

  Color bgColor;
  String selectedColor = "";
  ImageProvider imageProvider;
  File imageFile;
  Color _cardColor = Colors.white;

  TextEditingController titleController = TextEditingController();
  TextEditingController squareController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController instController = TextEditingController();
  TextEditingController prepmethodController = TextEditingController();
  TextEditingController roughnessController = TextEditingController();
  TextEditingController iso8501Controller = TextEditingController();

  bool isEdit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    if (widget.imageFile != null) {
      imageProvider = FileImage(widget.imageFile);
    }

    isEdit = object.title == '' ? false : true;
    titleController.text = object.title ?? '';
    descriptionController.text = object.description ?? '';
    squareController.text = object.square ?? '';
    instController.text == object.inst ?? '';
    prepmethodController.text == object.prepmethod ?? '';
    roughnessController.text == object.roughness ?? '';
    iso8501Controller.text == object.iso8501 ?? '';
  }

  ObjectDetailState(this.object);
  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
        fontSize: 16.0, color: Colors.black54, fontWeight: FontWeight.w600);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: _cardColor,
        appBar:
            AppBar(title: Text(isEdit ? 'Изменить запись' : 'Добавить запись')),
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
                            child:
                                Icon(Icons.delete_outline, color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2)))),
                  SizedBox(height: 10),
                  TextFormField(
                      maxLength: 5,
                      onSaved: (value) {
                        object.square = value;
                      },
                      controller: squareController,
                      style: textStyle,
                      decoration: InputDecoration(
                          labelText: 'Площадь окрашиваемой поверхности *',
                          hintText: 'Сколько окрашено, м2',
                          helperText: 'м.кв',
                          prefixIcon: Icon(Icons.map_sharp),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              squareController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2))),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}'),
                            allow: true)
                      ]),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.map),
                        labelText: 'Исходное состояние поверхности',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CameraPage()));
                          },
                          child:
                              Icon(Icons.camera_alt_sharp, color: Colors.green),
                        )),
                    items: _inSt.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    style: textStyle,
                    value: object.inst,
                    onChanged: (String value) {
                      object.inst = value;
                    },
                  ),
                  SizedBox(height: 10),
                  Row(children: [
                    Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey)),
                        child: object.imageProvider == null
                            ? Text('No Image Taken',
                                textAlign: TextAlign.center)

                            // ? Image.file(_imageProvider,
                            //     fit: BoxFit.cover, width: double.infinity)
                            : Image(
                                image: FileImage(object.imageProvider),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                        alignment: Alignment.center)
                  ]),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.map),
                        labelText: 'Способ подготовки поверхности',
                        suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.camera_alt_sharp,
                                color: Colors.green))),
                    items: _prepMethod.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    style: textStyle,
                    value: object.prepmethod,
                    onChanged: (String value) {
                      object.prepmethod = value;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.map),
                        labelText: 'Шероховатость',
                        suffixIcon: GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.camera_alt_sharp,
                                color: Colors.green))),
                    items: _roughness.map((String value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    style: textStyle,
                    value: object.roughness,
                    onChanged: (String value) {
                      object.roughness = value;
                    },
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          icon: Icon(Icons.map),
                          labelText: 'Степень подготовки по ISO 8501-1',
                          suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Icon(Icons.camera_alt_sharp,
                                  color: Colors.green))),
                      items: _iso8501.map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      style: textStyle,
                      value: object.iso8501,
                      onChanged: (String value) {
                        object.iso8501 = value;
                      }),
                  SizedBox(height: 10),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: object.bgcolor == null
                              ? Colors.white
                              : Color(int.parse(object.bgcolor))),
                      onPressed: () async {
                        String colorCode =
                            await ColorPickerCamera.captureColorFromCamera;
                        setState(() {
                          selectedColor = colorCode;
                          bgColor = Color(int.parse(colorCode));
                          object.bgcolor = selectedColor;
                        });
                      },
                      child: Text(
                          object.bgcolor == null
                              ? "Определить цвет покрытия "
                              : 'Цвет покрытия ${object.bgcolor}',
                          style: TextStyle(color: Colors.black))),
                  SizedBox(height: 10),
                  TextFormField(
                      maxLength: 50,
                      onSaved: (value) {
                        object.description = value;
                      },
                      controller: descriptionController,
                      decoration: InputDecoration(
                          labelText: 'Доплнительные сведения',
                          hintText:
                              'Особенности, дефекты, условия, замечания...',
                          border: OutlineInputBorder()),
                      maxLines: 3,
                      inputFormatters: [LengthLimitingTextInputFormatter(137)]),
                  SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        onPrimary: Colors.white,
                        elevation: 2,
                        padding: const EdgeInsets.all(13.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
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
                child: const Icon(Icons.clear, size: 35.0))
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
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
                      child: const Text('Удалить',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        helper.deleteTodo(object.id);
                        Navigator.of(context).pop();
                        Navigator.pop(context, true);
                      })
                ]));
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

  void updateSquare() {
    setState(() {
      object.square = squareController.text;
    });
  }

  void updateDescription() {
    setState(() {
      object.description = descriptionController.text;
    });
  }

  void updateInst() {
    setState(() {
      object.inst = instController.text;
    });
  }

  void updatePrepmeth() {
    setState(() {
      object.prepmethod = prepmethodController.text;
    });
  }

  void updateRoughness() {
    setState(() {
      object.roughness = roughnessController.text;
    });
  }

  void updateISO() {
    setState(() {
      object.iso8501 = iso8501Controller.text;
    });
  }
}

class Todo {
  int _id;
  String _title;
  String _square;
  String _description;
  String _date;
  int _priority;
  String _inst;
  String _prepmethod;
  String _roughness;
  String _iso8501;
  String _bgcolor;
  File _imageProvider;

  Todo(
    this._title,
    this._priority,
    this._date, [
    this._description,
    this._square,
    this._inst,
    this._prepmethod,
    this._roughness,
    this._iso8501,
    this._bgcolor,
  ]);

  Todo.withId(
    this._id,
    this._title,
    this._priority,
    this._date, [
    this._description,
    this._square,
    this._inst,
    this._prepmethod,
    this._roughness,
    this._iso8501,
    this._bgcolor,
    this._imageProvider,
  ]);

  int get id => _id;

  String get title => _title;

  String get square => _square;

  String get description => _description;

  int get priority => _priority;

  String get todoDate => _date;

  String get inst => _inst;

  String get prepmethod => _prepmethod;

  String get roughness => _roughness;

  String get iso8501 => _iso8501;

  String get bgcolor => _bgcolor;

  File get imageProvider => _imageProvider;

  set square(String newSquare) {
    if ((newSquare?.length ?? 0) <= 255) {
      _square = newSquare;
    }
  }

  set bgcolor(String newBgcolor) {
    if ((newBgcolor?.length ?? 0) <= 255) {
      _bgcolor = newBgcolor;
    }
  }

  set imageProvider(File newimageProvider) {
    if (newimageProvider != null && newimageProvider.path.length <= 255) {
      _imageProvider = newimageProvider;
    }
  }

  set iso8501(String newISO8501) {
    if ((newISO8501?.length ?? 0) <= 255) {
      _iso8501 = newISO8501;
    }
  }

  set roughness(String newRoughness) {
    if ((newRoughness?.length ?? 0) <= 255) {
      _roughness = newRoughness;
    }
  }

  set prepmethod(String newPrepMethod) {
    if ((newPrepMethod?.length ?? 0) <= 255) {
      _prepmethod = newPrepMethod;
    }
  }

  set inst(String newInst) {
    if ((newInst?.length ?? 0) <= 255) {
      _inst = newInst;
    }
  }

  set title(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if ((newDescription?.length ?? 0) <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set todoDate(newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;
    map['inst'] = _inst;
    map['prepmethod'] = _prepmethod;
    map['roughness'] = _roughness;
    map['iso8501'] = _iso8501;
    map['bgcolor'] = _bgcolor;
    map['imageProvider'] = _imageProvider;
    map['square'] = _square;
    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _id = o['id'];
    _title = o['title'];
    _description = o['description'];
    _priority = o['priority'];
    _date = o['date'];
    _inst = o['inst'];
    _prepmethod = o['prepmethod'];
    _roughness = o['roughness'];
    _iso8501 = o['iso8501'];
    _bgcolor = o['bgcolor'];
    _imageProvider = o['imageProvider'];
    _square = o['square'];
  }
}

class DbHelper {
  static final DbHelper _dbHelper = DbHelper._internal();
  String tblTodo = 'todo';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';
  String colInst = 'inst';
  String colPrepmethod = 'prepmethod';
  String colRoughness = 'roughness';
  String colISO8501 = 'iso8501';
  String colBgcolor = 'bgcolor';
  File colimageProvider = 'imageProvider' as File;
  String colSquare = 'square';

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
    final String path = dir.path + '/todos_1.db';
    final Database dbTodos =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;
  }

  Future<void> _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tblTodo($colId INTEGER PRIMARY KEY, $colTitle TEXT, ' +
            '$colDescription TEXT, $colSquare TEXT, $colPriority INTEGER, $colInst TEXT, $colPrepmethod TEXT, $colRoughness TEXT,$colISO8501 TEXT,$colimageProvider BLOB,$colBgcolor TEXT, $colDate TEXT)');
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
