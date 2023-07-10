import 'dart:math';
import 'dart:io';
import 'package:color_picker_camera/color_picker_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import './camera_page.dart';
import './img_screen_ip.dart';
import './objects_list_lkp.dart';
import './model_lkp.dart';

class ObjectDetail extends StatefulWidget {
  final Object object;
  ObjectDetail({Key key, this.object}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ObjectDetailState(object);
}

class ObjectDetailState extends State<ObjectDetail> {
  File _imageGrade;
  File _imageISO8501;
  File _imageDust;
  File _imageRoughness;
  Todo object;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  FocusNode focusNode7 = FocusNode();
  FocusNode focusNode8 = FocusNode();
  FocusNode focusNode9 = FocusNode();
  FocusNode focusNode10 = FocusNode();
  FocusNode focusNode11 = FocusNode();
  FocusNode focusNode12 = FocusNode();
  FocusNode focusNode13 = FocusNode();
  FocusNode focusNode14 = FocusNode();
  FocusNode focusNode15 = FocusNode();
  FocusNode focusNode16 = FocusNode();
  FocusNode focusNode17 = FocusNode();
  FocusNode focusNode18 = FocusNode();
  FocusNode focusNode19 = FocusNode();
  FocusNode focusNode20 = FocusNode();
  FocusNode focusNode21 = FocusNode();
  FocusNode focusNode22 = FocusNode();
  FocusNode focusNode23 = FocusNode();
  FocusNode focusNode24 = FocusNode();
  FocusNode focusNode25 = FocusNode();
  FocusNode focusNode26 = FocusNode();
  FocusNode focusNode27 = FocusNode();
  FocusNode focusNode28 = FocusNode();
  FocusNode focusNode29 = FocusNode();
  FocusNode focusNode30 = FocusNode();
  FocusNode focusNode31 = FocusNode();
  FocusNode focusNode32 = FocusNode();
  FocusNode focusNode33 = FocusNode();
  FocusNode focusNode34 = FocusNode();
  FocusNode focusNode35 = FocusNode();
  FocusNode focusNode36 = FocusNode();
  FocusNode focusNode37 = FocusNode();
  FocusNode focusNode38 = FocusNode();
  FocusNode focusNode39 = FocusNode();
  FocusNode focusNode40 = FocusNode();

  List<File> images = [];
  final List<String> _inSt = ['A', 'B', 'C', 'D', 'нет данных'];

  final List<String> _prepMethod = ['Sa', 'St', 'Fl', 'нет данных'];

  final List<String> _degrofdegr = ['1', '2', 'нет данных'];
  final List<String> _degrofoxid = ['1', '2', '3', '4', 'нет данных'];
  final List<String> _degrofdedust1 = ['1', '2', '3', '4', '5', 'нет данных'];
  final List<String> _degrofdedust2 = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    'нет данных'
  ];
  final List<String> _roughness = ['Coarse', 'Medium', 'Fine', 'нет данных'];
  final List<String> _iso8501A = [
    'A Sa2,5',
    'A Sa3',
    'A Fl',
    'B St2',
    'B St3',
    'B Sa1',
    'B Sa2',
    'B Sa2,5',
    'B Sa3',
    'B Fl',
    'C St2',
    'C St3',
    'C Sa1',
    'C Sa2',
    'C Sa2,5',
    'C Sa3',
    'C Fl',
    'D St2',
    'D St3',
    'D Sa1',
    'D Sa2',
    'D Sa2,5',
    'D Sa3',
    'D Fl',
    'нет данных'
  ];
  final List<String> _iso8501B = [
    'B St2',
    'B St3',
    'B Sa1',
    'B Sa2',
    'B Sa2,5',
    'B Sa3',
    'B Fl',
  ];
  final List<String> _iso8501C = [
    'C St2',
    'C St3',
    'C Sa1',
    'C Sa2',
    'C Sa2,5',
    'C Sa3',
    'C Fl',
  ];
  final List<String> _iso8501D = [
    'D St2',
    'D St3',
    'D Sa1',
    'D Sa2',
    'D Sa2,5',
    'D Sa3',
    'D Fl',
  ];

  final List<String> _contin = [
    'Сплошное покрытие',
    'Несплошное покрытие',
    'нет данных'
  ];
  final List<String> _degrdry = ['1', '2', '3'];
  final List<String> _defdur = [
    'Пропуски',
    'Влага',
    'Включения',
    'Другое',
    'нет данных'
  ];
  final List<String> _apperance = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    'нет данных'
  ];
  final List<String> _dielcont = ['Пробой', 'Отсутствие пробоя', 'нет данных'];

  final List<String> _methadhes = [
    'X-образный метод',
    'Метод полосовых надрезов',
    'Метод решётчатых надрезов',
    'На отрыв'
  ];
  final List<String> _balladhes = ['0', '1', '2', '3', '4', '5'];
  final List<String> _amountadh = ['< 40 МПа', '> 40 МПа'];

  final List<String> _changecolor = ['0', '1', '2', '3', '4', '5'];
  final List<String> _changegloss = ['0', '1', '2', '3', '4', '5'];
  final List<String> _mudretant = ['0', '1', '2', '3', '4', '5'];
  final List<String> _chalking = ['0', '1', '2', '3', '4', '5'];

  Color bgColor;
  String selectedColor = "";
  Color _cardColor = Colors.white;
  TextEditingController titleController = TextEditingController();
  TextEditingController squareclearController = TextEditingController();
  TextEditingController constroldcoatController = TextEditingController();
  TextEditingController instController = TextEditingController();
  TextEditingController iso8501Controller = TextEditingController();
  TextEditingController prepmethodController = TextEditingController();
  TextEditingController degrofdegrController = TextEditingController();
  TextEditingController degrofoxidController = TextEditingController();
  TextEditingController degrofdedust1Controller = TextEditingController();
  TextEditingController degrofdedust2Controller = TextEditingController();
  TextEditingController roughnessController = TextEditingController();
  TextEditingController surfsaltsController = TextEditingController();

  TextEditingController tempairController = TextEditingController();
  TextEditingController tempsurfController = TextEditingController();
  TextEditingController relathumidController = TextEditingController();
  TextEditingController dewpointController = TextEditingController();
  TextEditingController difftempController = TextEditingController();

  TextEditingController techcondmatController = TextEditingController();
  TextEditingController numdoflayController = TextEditingController();
  TextEditingController squarenewController = TextEditingController();
  TextEditingController thickofwellayController = TextEditingController();
  TextEditingController thickofdrylayController = TextEditingController();
  TextEditingController continController = TextEditingController();
  TextEditingController timedryController = TextEditingController();
  TextEditingController degrdryController = TextEditingController();
  TextEditingController defdurController = TextEditingController();

  TextEditingController apperanceController = TextEditingController();
  TextEditingController bgcolorController = TextEditingController();
  TextEditingController adhesionController = TextEditingController();
  TextEditingController dielcontController = TextEditingController();

  TextEditingController thickinsulmeterController = TextEditingController();
  TextEditingController adhesmeterController = TextEditingController();
  TextEditingController continmeterController = TextEditingController();
  TextEditingController setvikController = TextEditingController();

  TextEditingController changecolorController = TextEditingController();
  TextEditingController changeglossController = TextEditingController();
  TextEditingController mudretantController = TextEditingController();
  TextEditingController chalkingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isEdit;
  final GlobalKey<FormState> _1formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _2formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _3formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _4formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _5formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _6formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    isEdit = object.title == '' ? false : true;
    titleController.text == object.title ?? '';
    images.add(File('assets/images/grade_A.jpg'));
    images.add(File('assets/images/grade_B.jpg'));
    images.add(File('assets/images/grade_C.jpg'));
    images.add(File('assets/images/grade_D.jpg'));
    print('открыли: ${object.photo.toString()}');
    print('открыли Шероховатость: ${object.photoRoughness.toString()}');
    object.photo == '' ? false : true;
    object.photoDust == '' ? false : true;

    squareclearController.text = object.squareclear ?? '';
    constroldcoatController.text = object.constroldcoat ?? '';
    instController.text = object.inst ?? '';
    iso8501Controller.text = object.iso8501 ?? '';
    prepmethodController.text = object.prepmethod ?? '';
    degrofdegrController.text = object.degrofdegr ?? '';
    degrofoxidController.text = object.degrofoxid ?? '';
    degrofdedust1Controller.text = object.degrofdedust1 ?? '';
    degrofdedust2Controller.text = object.degrofdedust2 ?? '';
    roughnessController.text = object.roughness ?? '';
    surfsaltsController.text = object.surfsalts ?? '';

    tempairController.text = object.tempair ?? '';
    tempsurfController.text = object.tempsurf ?? '';
    relathumidController.text = object.relathumid ?? '';
    dewpointController.text = object.dewpoint ?? '';
    difftempController.text = object.difftemp ?? '';

    techcondmatController.text = object.techcondmat ?? '';
    numdoflayController.text = object.numdoflay ?? '';
    squarenewController.text = object.squarenew ?? '';
    thickofwellayController.text = object.thickofwellay ?? '';
    thickofdrylayController.text = object.thickofdrylay ?? '';
    continController.text = object.contin ?? '';
    timedryController.text = object.timedry ?? '';
    degrdryController.text = object.degrdry ?? '';
    defdurController.text = object.defdur ?? '';

    apperanceController.text = object.apperance ?? '';
    bgcolorController.text = object.bgcolor ?? '';
    adhesionController.text = object.adhesion ?? '';
    dielcontController.text = object.dielcont ?? '';

    thickinsulmeterController.text = object.thickinsulmeter ?? '';
    adhesmeterController.text = object.adhesmeter ?? '';
    continmeterController.text = object.continmeter ?? '';
    setvikController.text = object.setvik ?? '';

    changecolorController.text = object.changecolor ?? '';
    changeglossController.text = object.changegloss ?? '';
    mudretantController.text = object.mudretant ?? '';
    chalkingController.text = object.chalking ?? '';
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

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: _cardColor,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Center(
              child: Text(
                isEdit ? 'ИЗМЕНИТЬ ЗАПИСЬ' : 'ДОБАВИТЬ ЗАПИСЬ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4,
                  color: Theme.of(context).accentColor,
                ),
              ),
              labelStyle: TextStyle(
                fontSize: 44,
                color: Theme.of(context).accentColor, // цвет выбранной иконки
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.white, // цвет невыбранных иконок
              ),
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.notes_rounded,
                  size: 32,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_unchecked_sharp,
                  size: 32,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_on_sharp,
                  size: 32,
                )),
                Tab(
                    icon: Icon(
                  Icons.build_circle_sharp,
                  size: 32,
                )),
                Tab(
                    icon: Icon(
                  Icons.design_services_sharp,
                  size: 32,
                )),
                Tab(
                    icon: Icon(
                  Icons.playlist_add_circle_sharp,
                  size: 32,
                )),
              ],
            )),
        body: TabBarView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _1formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ОБЩИЕ ДАННЫЕ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 50,
                        onFieldSubmitted: (String value) {
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
                        focusNode: focusNode1,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelText: 'Наименование объекта *',
                          hintText: 'Как называется объект контроля',
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode1.hasFocus ||
                                    titleController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              titleController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Color.fromRGBO(187, 30, 16, 1.0),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                        ),
                        onChanged: (String value) {
                          focusNode1.requestFocus();
                          setState(() {});
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          focusNode: focusNode2,
                          maxLength: 5,
                          onChanged: (String value) {
                            focusNode2.requestFocus();
                            setState(() {});
                          },
                          onSaved: (value) {
                            object.squareclear = value;
                          },
                          controller: squareclearController,
                          style: textStyle,
                          decoration: InputDecoration(
                              labelText: 'Площадь очищаемой поверхности',
                              hintText: 'Сколько очищено, м^2',
                              labelStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).primaryColor,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).primaryColor,
                              ),
                              helperText: 'м.кв',
                              prefixIcon: Icon(
                                Icons.map_sharp,
                                color: focusNode2.hasFocus ||
                                        squareclearController.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  squareclearController.clear();
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Color.fromRGBO(187, 30, 16, 1.0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                              )),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r'^[()\d -]{1,15}'),
                                allow: true)
                          ]),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode3,
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).primaryColor,
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                            prefixIcon: Icon(
                              Icons.wysiwyg_rounded,
                              color: focusNode3.hasFocus ||
                                      instController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            labelText: 'Исходное состояние поверхности',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  String imageName;
                                  if (object.inst == 'A') {
                                    imageName = 'grade_A';
                                  } else if (object.inst == 'B') {
                                    imageName = 'grade_B';
                                  } else if (object.inst == 'C') {
                                    imageName = 'grade_C';
                                  } else if (object.inst == 'D') {
                                    imageName = 'grade_D';
                                  } else if (object.inst == 'нет данных' ||
                                      object.inst == null) {
                                    imageName = 'imagenull';
                                  }
                                  print('imageName: ${imageName}');
                                  final value = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CameraPage(imageName)),
                                  ).then((value) {
                                    setState(() async {
                                      if (value != null) {
                                        _imageGrade = value;

                                        print(
                                            'сделали: ${object.photo.toString()}');

                                        if (_1formKey.currentState.validate()) {
                                          _1formKey.currentState.save();
                                          if (_imageGrade != null) {
                                            final Directory extDir =
                                                await getApplicationDocumentsDirectory();
                                            final String dirPath =
                                                '${extDir.path}/Pictures/flutter_test';
                                            await Directory(dirPath)
                                                .create(recursive: true);
                                            final String filePath =
                                                '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
                                            await _imageGrade.copy(filePath);
                                            object.photo = filePath;
                                          }
                                        }
                                      }
                                    });
                                  });
                                },
                                child: Icon(Icons.camera_alt_sharp,
                                    color: Colors.green))),
                        items: _inSt.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.inst,
                        onChanged: (String value) {
                          focusNode3.requestFocus();
                          setState(() {});
                          object.inst = value;
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImageScreen(
                                            imagePath: object.photo)),
                                  );
                                },
                                child: Center(
                                  child: object.photo != null
                                      ? Image.file(
                                          File(object.photo),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                          width: 100,
                                          height: 100,
                                        )
                                      : Text('Изображение отсутствует'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode4,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode4.hasFocus ||
                                    prepmethodController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText:
                              'Способ подготовки поверхности по ISO 8501-1',
                        ),
                        items: _prepMethod.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.prepmethod,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode4.requestFocus();
                          object.prepmethod = value;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode5.hasFocus ||
                                    degrofdegrController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Степень обезжиривания по ГОСТ 9.402',
                        ),
                        items: _degrofdegr.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.degrofdegr,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode5.requestFocus();
                          object.degrofdegr = value;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode6,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode6.hasFocus ||
                                    degrofoxidController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Степень очистки по ГОСТ 9.402',
                        ),
                        items: _degrofoxid.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.degrofoxid,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode6.requestFocus();
                          object.degrofoxid = value;
                        },
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: SizedBox(
                                  width: 40,
                                ),
                              ),
                              Text(
                                'Степень обеспыливания по ISO 8502-3',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: DropdownButtonFormField(
                                  focusNode: focusNode7,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor,
                                          width: 2),
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    prefixIcon: Icon(
                                      Icons.wysiwyg_rounded,
                                      color: focusNode7.hasFocus ||
                                              degrofdedust1Controller
                                                      .text.isNotEmpty &&
                                                  degrofdedust2Controller
                                                      .text.isNotEmpty
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      size: 32,
                                    ),
                                    labelText: 'Количество пыли',
                                  ),
                                  items: _degrofdedust1.map((String value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  style: textStyle,
                                  value: object.degrofdedust1,
                                  onChanged: (String value) {
                                    setState(() {});
                                    focusNode7.requestFocus();
                                    object.degrofdedust1 = value;
                                  },
                                ),
                              ),
                              SizedBox(width: 1),
                              Expanded(
                                child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        borderSide: BorderSide(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 2),
                                      ),
                                      labelStyle: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      labelText: 'Размер частиц',
                                      suffixIcon: GestureDetector(
                                          onTap: () async {
                                            String imageName;
                                            if (object.degrofdedust1 == '1') {
                                              imageName = 'dust1';
                                            } else if (object.degrofdedust1 ==
                                                '2') {
                                              imageName = 'dust2';
                                            } else if (object.degrofdedust1 ==
                                                '3') {
                                              imageName = 'dust3';
                                            } else if (object.degrofdedust1 ==
                                                '4') {
                                              imageName = 'dust4';
                                            } else if (object.degrofdedust1 ==
                                                '5') {
                                              imageName = 'dust5';
                                            } else if (object.degrofdedust1 ==
                                                    'нет данных' ||
                                                object.degrofdedust1 == null) {
                                              imageName = 'imagenull';
                                            }
                                            print('imageName: ${imageName}');
                                            final value = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CameraPage(imageName)),
                                            ).then((value) {
                                              setState(() async {
                                                if (value != null) {
                                                  _imageDust = value;

                                                  print(
                                                      'сделали: ${object.photoDust.toString()}');

                                                  if (_1formKey.currentState
                                                      .validate()) {
                                                    _1formKey.currentState
                                                        .save();
                                                    if (_imageDust != null) {
                                                      final Directory extDir =
                                                          await getApplicationDocumentsDirectory();
                                                      final String dirPath =
                                                          '${extDir.path}/Pictures/flutter_test';
                                                      await Directory(dirPath)
                                                          .create(
                                                              recursive: true);
                                                      final String filePath =
                                                          '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
                                                      await _imageDust
                                                          .copy(filePath);
                                                      object.photoDust =
                                                          filePath;
                                                    }
                                                  }
                                                }
                                              });
                                            });
                                          },
                                          child: Icon(Icons.camera_alt_sharp,
                                              color: Colors.green))),
                                  items: _degrofdedust2.map((String value) {
                                    return DropdownMenuItem(
                                        value: value, child: Text(value));
                                  }).toList(),
                                  style: textStyle,
                                  value: object.degrofdedust2,
                                  onChanged: (String value) {
                                    object.degrofdedust2 = value;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImageScreen(
                                            imagePath: object.photoDust)),
                                  );
                                },
                                child: Center(
                                  child: object.photoDust != null
                                      ? Image.file(
                                          File(object.photoDust),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                          width: 100,
                                          height: 100,
                                        )
                                      : Text('Изображение отсутствует'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                            prefixIcon: Icon(
                              Icons.wysiwyg_rounded,
                              color: focusNode8.hasFocus ||
                                      roughnessController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            labelText: 'Шероховатость',
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  String imageName;
                                  if (object.roughness == 'Coarse' ||
                                      object.roughness == 'Medium' ||
                                      object.roughness == 'Fine') {
                                    imageName = 'roughness';
                                  } else if (object.roughness == 'нет данных' ||
                                      object.roughness == null) {
                                    imageName = 'imagenull';
                                  }
                                  print('imageName: ${imageName}');
                                  final value = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CameraPage(imageName)),
                                  ).then((value) {
                                    setState(() async {
                                      if (value != null) {
                                        _imageRoughness = value;

                                        print(
                                            'сделали: ${object.photoRoughness.toString()}');

                                        if (_1formKey.currentState.validate()) {
                                          _1formKey.currentState.save();
                                          if (_imageRoughness != null) {
                                            final Directory extDir =
                                                await getApplicationDocumentsDirectory();
                                            final String dirPath =
                                                '${extDir.path}/Pictures/flutter_test';
                                            await Directory(dirPath)
                                                .create(recursive: true);
                                            final String filePath =
                                                '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
                                            await _imageRoughness
                                                .copy(filePath);
                                            object.photoRoughness = filePath;
                                          }
                                        }
                                      }
                                    });
                                  });
                                },
                                child: Icon(Icons.camera_alt_sharp,
                                    color: Colors.green))),
                        items: _roughness.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.roughness,
                        onChanged: (String value) {
                          object.roughness = value;
                        },
                      ),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImageScreen(
                                            imagePath: object.photoRoughness)),
                                  );
                                },
                                child: Center(
                                  child: object.photoRoughness != null
                                      ? Image.file(
                                          File(object.photoRoughness),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                          width: 100,
                                          height: 100,
                                        )
                                      : Text('Изображение отсутствует'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2),
                              ),
                              labelStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).primaryColor,
                              ),
                              prefixIcon: Icon(
                                Icons.wysiwyg_rounded,
                                color: focusNode9.hasFocus ||
                                        iso8501Controller.text.isNotEmpty
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                size: 32,
                              ),
                              labelText: 'Степень подготовки по ISO 8501-1',
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    String imageName;

                                    if (object.iso8501 == 'A Sa2,5') {
                                      imageName = 'A_Sa_25';
                                    } else if (object.iso8501 == 'A Sa3') {
                                      imageName = 'A_Sa_3';
                                    } else if (object.iso8501 == 'A Fl') {
                                      imageName = 'A_Fl';
                                    } else if (object.iso8501 == 'B St2') {
                                      imageName = 'B_St_2';
                                    } else if (object.iso8501 == 'C St2') {
                                      imageName = 'C_St_2';
                                    } else if (object.iso8501 == 'D St2') {
                                      imageName = 'D_St_2';
                                    } else if (object.iso8501 == 'B St3') {
                                      imageName = 'B_St_3';
                                    } else if (object.iso8501 == 'C St3') {
                                      imageName = 'C_St_3';
                                    } else if (object.iso8501 == 'D St3') {
                                      imageName = 'D_St_3';
                                    } else if (object.iso8501 == 'B Sa1') {
                                      imageName = 'B_Sa_1';
                                    } else if (object.iso8501 == 'C Sa1') {
                                      imageName = 'C_Sa_1';
                                    } else if (object.iso8501 == 'D Sa1') {
                                      imageName = 'D_Sa_1';
                                    } else if (object.iso8501 == 'B Sa2') {
                                      imageName = 'B_Sa_2';
                                    } else if (object.iso8501 == 'C Sa2') {
                                      imageName = 'C_Sa_2';
                                    } else if (object.iso8501 == 'D Sa2') {
                                      imageName = 'D_Sa_2';
                                    } else if (object.iso8501 == 'B Sa2,5') {
                                      imageName = 'B_Sa_25';
                                    } else if (object.iso8501 == 'C Sa2,5') {
                                      imageName = 'C_Sa_25';
                                    } else if (object.iso8501 == 'D Sa2,5') {
                                      imageName = 'D_Sa_25';
                                    } else if (object.iso8501 == 'B Sa3') {
                                      imageName = 'B_Sa_3';
                                    } else if (object.iso8501 == 'C Sa3') {
                                      imageName = 'C_Sa_3';
                                    } else if (object.iso8501 == 'D Sa3') {
                                      imageName = 'D_Sa_3';
                                    } else if (object.iso8501 == 'B Fl') {
                                      imageName = 'B_Fl';
                                    } else if (object.iso8501 == 'C Fl') {
                                      imageName = 'C_Fl';
                                    } else if (object.iso8501 == 'D Fl') {
                                      imageName = 'D_Fl';
                                    } else if (object.iso8501 == 'нет данных' ||
                                        object.iso8501 == null) {
                                      imageName = 'imagenull';
                                    }

                                    print('imageName: ${imageName}');
                                    final value = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CameraPage(imageName)),
                                    ).then((value) {
                                      setState(() async {
                                        if (value != null) {
                                          _imageISO8501 = value;

                                          print(
                                              'сделали: ${object.photoISO.toString()}');

                                          if (_1formKey.currentState
                                              .validate()) {
                                            _1formKey.currentState.save();
                                            if (_imageISO8501 != null) {
                                              final Directory extDir =
                                                  await getApplicationDocumentsDirectory();
                                              final String dirPath =
                                                  '${extDir.path}/Pictures/flutter_test';
                                              await Directory(dirPath)
                                                  .create(recursive: true);
                                              final String filePath =
                                                  '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
                                              await _imageISO8501
                                                  .copy(filePath);
                                              object.photoISO = filePath;
                                            }
                                          }
                                        }
                                      });
                                    });
                                  },
                                  child: Icon(Icons.camera_alt_sharp,
                                      color: Colors.green))),
                          items: _iso8501A.map((String value) {
                            return DropdownMenuItem(
                                value: value, child: Text(value));
                          }).toList(),
                          style: textStyle,
                          value: object.iso8501,
                          onChanged: (String value) {
                            object.iso8501 = value;
                          }),
                      SizedBox(height: 10),
                      Container(
                        height: 100,
                        child: Column(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ImageScreen(
                                            imagePath: object.photoISO)),
                                  );
                                },
                                child: Center(
                                  child: object.photoISO != null
                                      ? Image.file(
                                          File(object.photoISO),
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                          width: 100,
                                          height: 100,
                                        )
                                      : Text('Изображение отсутствует'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () => saveForm1(),
                        child: Text(
                          isEdit ? 'Редактировать' : 'Добавить',
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _2formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ПАРАМЕТРЫ ОКРАШИВАЕМОЙ СРЕДЫ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        focusNode: focusNode10,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode10.requestFocus();
                        },
                        maxLength: 3,
                        onSaved: (value) {
                          object.tempair = value;
                        },
                        controller: tempairController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Температура воздуха',
                          hintText: 'Введите температуру окружающего воздуха',
                          helperText: 'С°',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode10.hasFocus ||
                                    tempairController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              tempairController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode11,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode11.requestFocus();
                        },
                        maxLength: 3,
                        onSaved: (value) {
                          object.tempsurf = value;
                        },
                        controller: tempsurfController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Температура поверхности',
                          hintText:
                              'Введите температуру окрашиваемой поверхности',
                          helperText: 'С°',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode11.hasFocus ||
                                    tempsurfController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              tempsurfController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode12,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode12.requestFocus();
                        },
                        maxLength: 2,
                        onSaved: (value) {
                          object.relathumid = value;
                        },
                        controller: relathumidController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Относительная влажность',
                          hintText: 'Введите относительную влажность воздуха',
                          helperText: '%',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode12.hasFocus ||
                                    relathumidController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              relathumidController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode13,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode13.requestFocus();
                        },
                        maxLength: 6,
                        onSaved: (value) {
                          object.dewpoint = value;
                        },
                        controller: dewpointController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Точка росы',
                          hintText: 'Введите или расчитайте температуру->',
                          helperText: 'С°',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode13.hasFocus ||
                                    dewpointController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              calcdewpoint();
                            },
                            child: Icon(
                              Icons.calculate_sharp,
                              color: Colors.green,
                              size: 44,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode14,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode14.requestFocus();
                        },
                        maxLength: 6,
                        onSaved: (value) {
                          object.difftemp = value;
                        },
                        controller: difftempController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Разница температур',
                          hintText: 'Введите или расчитайте->',
                          helperText: 'С°',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode14.hasFocus ||
                                    difftempController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              double dewpoint =
                                  double.parse(dewpointController.text);
                              double temperature2 =
                                  double.parse(tempsurfController.text);
                              double difftemp = temperature2 - dewpoint;
                              object.difftemp = difftemp.toStringAsFixed(2);
                              difftempController.text = object.difftemp;
                            },
                            child: Icon(
                              Icons.calculate_sharp,
                              color: Colors.green,
                              size: 44,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () => saveForm2(),
                        child: Text(
                          isEdit ? 'Редактировать' : 'Добавить',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _3formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'НАНЕСЕНИЕ ПОКРЫТИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                          focusNode: focusNode15,
                          onChanged: (String value) {
                            setState(() {});
                            focusNode15.requestFocus();
                          },
                          maxLength: 50,
                          onSaved: (value) {
                            object.techcondmat = value;
                          },
                          controller: techcondmatController,
                          style: textStyle,
                          decoration: InputDecoration(
                            labelText: 'Данные о наносимом материале',
                            hintText: 'Наименование и тех.условия',
                            helperText: '...',
                            prefixIcon: Icon(
                              Icons.account_balance_outlined,
                              color: focusNode15.hasFocus ||
                                      techcondmatController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                techcondmatController.clear();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r'^[()\d -]{1,15}'),
                                allow: true)
                          ]),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode16,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode16.requestFocus();
                        },
                        maxLength: 2,
                        onSaved: (value) {
                          object.numdoflay = value;
                        },
                        controller: numdoflayController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Количество наносимых слоёв',
                          hintText: 'Сколько соёв материала наносится',
                          helperText: 'шт',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode16.hasFocus ||
                                    numdoflayController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              numdoflayController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          focusNode: focusNode17,
                          onChanged: (String value) {
                            setState(() {});
                            focusNode17.requestFocus();
                          },
                          maxLength: 5,
                          onSaved: (value) {
                            object.squarenew = value;
                          },
                          controller: squarenewController,
                          style: textStyle,
                          decoration: InputDecoration(
                            labelText: 'Площадь окрашиваемой поверхности',
                            hintText: 'Сколько окрашено, м^2',
                            helperText: 'м.кв',
                            prefixIcon: Icon(
                              Icons.account_balance_outlined,
                              color: focusNode17.hasFocus ||
                                      squarenewController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                squarenewController.clear();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r'^[()\d -]{1,15}'),
                                allow: true)
                          ]),
                      SizedBox(height: 10),
                      TextFormField(
                          focusNode: focusNode18,
                          onChanged: (String value) {
                            setState(() {});
                            focusNode18.requestFocus();
                          },
                          maxLength: 5,
                          onSaved: (value) {
                            object.thickofwellay = value;
                          },
                          controller: thickofwellayController,
                          style: textStyle,
                          decoration: InputDecoration(
                            labelText: 'Толщина мокрого слоя',
                            hintText: 'Введите измеренную толщину мокрого слоя',
                            helperText: 'мкм',
                            prefixIcon: Icon(
                              Icons.account_balance_outlined,
                              color: focusNode18.hasFocus ||
                                      thickofwellayController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                thickofwellayController.clear();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r'^[()\d -]{1,15}'),
                                allow: true)
                          ]),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode19,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode19.hasFocus ||
                                    continController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Сплошность',
                        ),
                        items: _contin.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.contin,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode19.requestFocus();
                          object.contin = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          focusNode: focusNode20,
                          onChanged: (String value) {
                            setState(() {});
                            focusNode20.requestFocus();
                          },
                          maxLength: 3,
                          onSaved: (value) {
                            object.timedry = value;
                          },
                          controller: timedryController,
                          style: textStyle,
                          decoration: InputDecoration(
                            labelText: 'Время сушки',
                            hintText: 'Введите время сушки',
                            helperText: 'ч',
                            prefixIcon: Icon(
                              Icons.account_balance_outlined,
                              color: focusNode20.hasFocus ||
                                      timedryController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                timedryController.clear();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r'^[()\d -]{1,15}'),
                                allow: true)
                          ]),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode21,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode21.hasFocus ||
                                    degrdryController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Степень сушки',
                        ),
                        items: _degrdry.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.degrdry,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode21.requestFocus();

                          object.degrdry = value;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode22,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode22.hasFocus ||
                                    defdurController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Вывленные дефекты при нанесении',
                        ),
                        items: _defdur.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.defdur,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode22.requestFocus();

                          object.defdur = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          focusNode: focusNode23,
                          onChanged: (String value) {
                            setState(() {});
                            focusNode23.requestFocus();
                          },
                          maxLength: 5,
                          onSaved: (value) {
                            object.thickofdrylay = value;
                          },
                          controller: thickofdrylayController,
                          style: textStyle,
                          decoration: InputDecoration(
                            labelText: 'Толщина отверждённого покрытия',
                            hintText:
                                'Введите измеренную толщину отверждённого покрытия',
                            helperText: 'мкм',
                            prefixIcon: Icon(
                              Icons.account_balance_outlined,
                              color: focusNode23.hasFocus ||
                                      thickofdrylayController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                thickofdrylayController.clear();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r'^[()\d -]{1,15}'),
                                allow: true)
                          ]),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () => saveForm3(),
                        child: Text(
                          isEdit ? 'Редактировать' : 'Добавить',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _4formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ПРИЁМКА НАНЕСЕННОГО ПОКРЫТИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode24,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode24.hasFocus ||
                                    apperanceController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Внешний вид по ГОСТ 9.032',
                        ),
                        items: _apperance.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.apperance,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode24.requestFocus();
                          object.apperance = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                          focusNode: focusNode25,
                          onChanged: (String value) {
                            setState(() {});
                            focusNode25.requestFocus();
                          },
                          maxLength: 3,
                          onSaved: (value) {
                            object.adhesion = value;
                          },
                          controller: adhesionController,
                          style: textStyle,
                          decoration: InputDecoration(
                            labelText: 'Адгезия покрытия к поверхности',
                            hintText: 'Введите балл',
                            helperText: 'Балл',
                            prefixIcon: Icon(
                              Icons.account_balance_outlined,
                              color: focusNode25.hasFocus ||
                                      adhesionController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                adhesionController.clear();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(
                                RegExp(r'^[()\d -]{1,15}'),
                                allow: true)
                          ]),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode26,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode26.hasFocus ||
                                    dielcontController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Диэлектрическая сплошность',
                        ),
                        items: _dielcont.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.dielcont,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode26.requestFocus();
                          object.dielcont = value;
                        },
                      ),
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () => saveForm4(),
                        child: Text(
                          isEdit ? 'Редактировать' : 'Добавить',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _5formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ДАННЫЕ О ПРИБОРАХ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        focusNode: focusNode27,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode27.requestFocus();
                        },
                        maxLength: 20,
                        onSaved: (value) {
                          object.thickinsulmeter = value;
                        },
                        controller: thickinsulmeterController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Толщиномер покрытий',
                          hintText: 'Введите название и номер',
                          helperText: '... № ...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode27.hasFocus ||
                                    thickinsulmeterController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              thickinsulmeterController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode28,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode28.requestFocus();
                        },
                        maxLength: 20,
                        onSaved: (value) {
                          object.adhesmeter = value;
                        },
                        controller: adhesmeterController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Адгезиметр',
                          hintText: 'Введите название и номер',
                          helperText: '... № ...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode28.hasFocus ||
                                    adhesmeterController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              adhesmeterController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode29,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode29.requestFocus();
                        },
                        maxLength: 20,
                        onSaved: (value) {
                          object.continmeter = value;
                        },
                        controller: continmeterController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Искровой дефектоскоп',
                          hintText: 'Введите название и номер',
                          helperText: '... № ...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode29.hasFocus ||
                                    continmeterController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              continmeterController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode30,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode30.requestFocus();
                        },
                        maxLength: 20,
                        onSaved: (value) {
                          object.setvik = value;
                        },
                        controller: setvikController,
                        style: textStyle,
                        decoration: InputDecoration(
                          labelText: 'Комплект ВИК',
                          hintText: 'Введите номер комплекта',
                          helperText: '№ ...',
                          prefixIcon: Icon(
                            Icons.account_balance_outlined,
                            color: focusNode30.hasFocus ||
                                    setvikController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setvikController.clear();
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () => saveForm5(),
                        child: Text(
                          isEdit ? 'Редактировать' : 'Добавить',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _6formKey,
                  child: ListView(
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                            'ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode31,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode31.hasFocus ||
                                    changecolorController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Степень изменения цвета',
                        ),
                        items: _changecolor.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.changecolor,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode31.requestFocus();
                          object.changecolor = value;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode32,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode32.hasFocus ||
                                    changeglossController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Степень изменения блеска',
                        ),
                        items: _changegloss.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.changegloss,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode32.requestFocus();

                          object.changegloss = value;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode33,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode33.hasFocus ||
                                    mudretantController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Степень грязеудержания',
                        ),
                        items: _mudretant.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.mudretant,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode33.requestFocus();
                          object.mudretant = value;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode34,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                          prefixIcon: Icon(
                            Icons.wysiwyg_rounded,
                            color: focusNode34.hasFocus ||
                                    chalkingController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Степень меления',
                        ),
                        items: _chalking.map((String value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        style: textStyle,
                        value: object.chalking,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode34.requestFocus();
                          object.chalking = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode35,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode35.requestFocus();
                        },
                        maxLength: 1000,
                        onSaved: (value) {
                          object.description = value;
                        },
                        controller: descriptionController,
                        decoration: InputDecoration(
                          labelText: 'Доплнительные сведения',
                          hintText:
                              'Особенности, дефекты, условия, замечания...',
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          labelStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        maxLines: 10,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(137),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.amber,
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        onPressed: () => saveForm6(),
                        child: Text(
                          isEdit ? 'Редактировать' : 'Добавить',
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  void calcdewpoint() {
    double a = 17.27;
    double b = 237.7;
    double temperature = double.parse(tempairController.text);
    double relativeHumidity = double.parse(relathumidController.text);
    double dewpoint = (b *
            (((a * temperature) / (b + temperature)) +
                log(relativeHumidity / 100))) /
        (a -
            (((a * temperature) / (b + temperature)) +
                log(relativeHumidity / 100)));
    object.dewpoint = dewpoint.toStringAsFixed(2);
    dewpointController.text = object.dewpoint;
    print('Темп: $temperature');
    print('влажность: $relativeHumidity');
    print('ТОЧКА РОСЫ: $dewpoint');
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

  void saveForm1() {
    final form = _1formKey.currentState;
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

  void saveForm2() {
    final form = _2formKey.currentState;
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

  void saveForm3() {
    final form = _3formKey.currentState;
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

  void saveForm4() {
    final form = _4formKey.currentState;
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

  void saveForm5() {
    final form = _5formKey.currentState;
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

  void saveForm6() {
    final form = _6formKey.currentState;
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

  void updatesquareclear() {
    setState(() {
      object.squareclear = squareclearController.text;
    });
  }

  void updateconstroldcoat() {
    setState(() {
      object.constroldcoat = constroldcoatController.text;
    });
  }

  void updateInst() {
    setState(() {
      object.inst = instController.text;
    });
  }

  void updateISO8501() {
    setState(() {
      object.iso8501 = iso8501Controller.text;
    });
  }

  void updatePrepmethod() {
    setState(() {
      object.prepmethod = prepmethodController.text;
    });
  }

  void updatedegrofdegr() {
    setState(() {
      object.degrofdegr = degrofdegrController.text;
    });
  }

  void updatedegrofoxid() {
    setState(() {
      object.degrofoxid = degrofoxidController.text;
    });
  }

  void updatedegrofdedust1() {
    setState(() {
      object.degrofdedust1 = degrofdedust1Controller.text;
    });
  }

  void updatedegrofdedust2() {
    setState(() {
      object.degrofdedust2 = degrofdedust2Controller.text;
    });
  }

  void updateRoughness() {
    setState(() {
      object.roughness = roughnessController.text;
    });
  }

  void updatesurfsalts() {
    setState(() {
      object.surfsalts = surfsaltsController.text;
    });
  }

  void updatetempair() {
    setState(() {
      object.tempair = tempairController.text;
    });
  }

  void updatetempsurf() {
    setState(() {
      object.tempsurf = tempsurfController.text;
    });
  }

  void updaterelathumid() {
    setState(() {
      object.relathumid = relathumidController.text;
    });
  }

  void updatedewpoint() {
    setState(() {
      object.dewpoint = dewpointController.text;
    });
  }

  void updatedifftemp() {
    setState(() {
      object.difftemp = difftempController.text;
    });
  }

  void updatetechcondmat() {
    setState(() {
      object.techcondmat = techcondmatController.text;
    });
  }

  void updatenumdoflay() {
    setState(() {
      object.numdoflay = numdoflayController.text;
    });
  }

  void updatesquarenew() {
    setState(() {
      object.squarenew = squarenewController.text;
    });
  }

  void updatethickofwellay() {
    setState(() {
      object.thickofwellay = thickofwellayController.text;
    });
  }

  void updatethickofdrylay() {
    setState(() {
      object.thickofdrylay = thickofdrylayController.text;
    });
  }

  void updatecontin() {
    setState(() {
      object.contin = continController.text;
    });
  }

  void updatetimedry() {
    setState(() {
      object.timedry = timedryController.text;
    });
  }

  void updatedegrdry() {
    setState(() {
      object.degrdry = degrdryController.text;
    });
  }

  void updatedefdur() {
    setState(() {
      object.defdur = defdurController.text;
    });
  }

  void updateapperance() {
    setState(() {
      object.apperance = apperanceController.text;
    });
  }

  void updatebgcolor() {
    setState(() {
      object.bgcolor = bgcolorController.text;
    });
  }

  void updateadhesion() {
    setState(() {
      object.adhesion = adhesionController.text;
    });
  }

  void updatedielcont() {
    setState(() {
      object.dielcont = dielcontController.text;
    });
  }

  void updatethickinsulmeter() {
    setState(() {
      object.thickinsulmeter = thickinsulmeterController.text;
    });
  }

  void updateadhesmeter() {
    setState(() {
      object.adhesmeter = adhesmeterController.text;
    });
  }

  void updatecontinmeter() {
    setState(() {
      object.continmeter = continmeterController.text;
    });
  }

  void updatesetvik() {
    setState(() {
      object.setvik = setvikController.text;
    });
  }

  void updatechangecolor() {
    setState(() {
      object.changecolor = changecolorController.text;
    });
  }

  void updatechangegloss() {
    setState(() {
      object.changegloss = changeglossController.text;
    });
  }

  void updatemudretant() {
    setState(() {
      object.mudretant = mudretantController.text;
    });
  }

  void updatechalking() {
    setState(() {
      object.chalking = chalkingController.text;
    });
  }

  void updateDescription() {
    setState(() {
      object.description = descriptionController.text;
    });
  }
}
