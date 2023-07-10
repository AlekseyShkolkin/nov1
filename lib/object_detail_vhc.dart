import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import './camera_page_ip.dart';
import './img_screen_ip.dart';
import './model_ip.dart';
import './object_list_ip.dart';

class ObjectDetailVhC extends StatefulWidget {
  const ObjectDetailVhC({Key key, @required this.object});
  final Object object;
  @override
  State<StatefulWidget> createState() => ObjectDetailVhCState(object);
}

class ObjectDetailVhCState extends State<ObjectDetailVhC> {
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

  File _image;
  File _imageDefmet1;

  Color _cardColor = Colors.white;
  final List<String> _osnovanie = [
    'ВТД',
    'Коррозионное обследование',
    'Данные электрометрии',
    'Обследование тройников',
  ];
  final List<String> _diameter = [
    '59',
    '89',
    '108',
    '159',
    '219',
    '273',
    '325',
    '377',
    '426',
    '530',
    '720',
    '820',
    '1020',
    '1220',
    '1420'
  ];
  final List<String> _gradesteel = [
    'Ст20',
    '09Г2С',
    '10Г2ФБЮ',
    'К60',
    'К56',
    'К55',
    'К54',
    'К52',
    '13ХФА',
    '09ГСФ',
    '17Г1С'
  ];
  final List<String> _metalldamage = [
    'Да',
    'Нет',
  ];
  final List<String> _insuldamage = [
    'Да',
    'Нет',
  ];
  final List<String> _charmetdamage = [
    'Сплошная коррозия',
    'Местная коррозия',
    'КРН',
    'Механическое повреждение',
  ];
  final List<String> _charinsuldamage = [
    'Отслоение',
    'Сдир',
    'Царапина',
    'Пропуск',
    'Вмятина',
  ];

  final List<String> _typeinsul = [
    'РАМ',
    'Мастичное',
    'Полиэтиленовое',
    'Ленточное',
    'Лакокрасочное',
    'Полиуретановое',
    'Покрытие отсутствует'
  ];
  final List<String> _insulcharadhes = [
    'Адгезионный',
    'Когезионный',
    'Смешанный'
  ];
  final List<String> _insulcondit = [
    'Неудовлетворительное',
    'Удовлетворительное',
  ];
  final List<String> _typeinsulrest = [
    'Грунтовка + РАМ 1 слой + Литкор НК Газ',
    'Грунтовка + РАМ 2 слоя + Литкор НК Газ',
    'БИУРС',
    'Термоусаживающаяся манжета',
  ];

  TextEditingController titleController = TextEditingController();
  TextEditingController piketkmController = TextEditingController();
  TextEditingController coordinateController = TextEditingController();
  TextEditingController lengthpitController = TextEditingController();
  TextEditingController depthpitController = TextEditingController();

  TextEditingController diameterController = TextEditingController();
  TextEditingController thickpipeController = TextEditingController();
  TextEditingController gradesteelController = TextEditingController();
  TextEditingController metalldamageController = TextEditingController();
  TextEditingController charmetdamageController = TextEditingController();
  TextEditingController locmetdamageController = TextEditingController();
  TextEditingController sizemetdamageController = TextEditingController();

  TextEditingController typeinsulController = TextEditingController();
  TextEditingController insuladhesController = TextEditingController();
  TextEditingController insulcharadhesController = TextEditingController();
  TextEditingController insulconditController = TextEditingController();
  TextEditingController thickinsulController = TextEditingController();
  TextEditingController insuldamageController = TextEditingController();
  TextEditingController charinsuldamageController = TextEditingController();
  TextEditingController locinsuldamageController = TextEditingController();
  TextEditingController sizeinsuldamageController = TextEditingController();

  TextEditingController typeinsulrestController = TextEditingController();
  TextEditingController insuladhesrestController = TextEditingController();
  TextEditingController thickinsulrestController = TextEditingController();
  TextEditingController contininsulrestController = TextEditingController();
  TextEditingController tickinsulmeterController = TextEditingController();

  TextEditingController tickmetallmeterController = TextEditingController();
  TextEditingController adhesmeterController = TextEditingController();
  TextEditingController continmeterController = TextEditingController();
  TextEditingController setvikController = TextEditingController();

  TextEditingController osnovanieController = TextEditingController();
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
    print('открыли: ${object.photometdef1.toString()}');
    isEdit = object.title == '' ? false : true;
    object.photo == '' ? false : true;
    object.photometdef1 == '' ? false : true;
    titleController.text = object.title ?? '';
    piketkmController.text = object.piketkm ?? '';
    coordinateController.text = object.coordinate ?? '';
    lengthpitController.text = object.lengthpit ?? '';
    depthpitController.text = object.depthpit ?? '';

    diameterController.text = object.diameter ?? '';
    thickpipeController.text = object.thickpipe ?? '';
    gradesteelController.text = object.gradesteel ?? '';
    metalldamageController.text = object.metalldamage ?? '';
    charmetdamageController.text = object.charmetdamage ?? '';
    locmetdamageController.text = object.locmetdamage ?? '';
    sizemetdamageController.text = object.sizemetdamage ?? '';

    typeinsulController.text = object.typeinsul ?? '';
    insuladhesController.text = object.insuladhes ?? '';
    insulcharadhesController.text = object.insulcharadhes ?? '';
    insulconditController.text = object.insulcondit ?? '';
    thickinsulController.text = object.thickinsul ?? '';
    insuldamageController.text = object.insuldamage ?? '';
    charinsuldamageController.text = object.charinsuldamage ?? '';
    locinsuldamageController.text = object.locinsuldamage ?? '';
    sizeinsuldamageController.text = object.sizeinsuldamage ?? '';

    typeinsulrestController.text = object.typeinsulrest ?? '';
    insuladhesrestController.text = object.insuladhesrest ?? '';
    thickinsulrestController.text = object.thickinsulrest ?? '';
    contininsulrestController.text = object.contininsulrest ?? '';

    tickinsulmeterController.text = object.tickinsulmeter ?? '';
    tickmetallmeterController.text = object.tickmetallmeter ?? '';
    adhesmeterController.text = object.adhesmeter ?? '';
    continmeterController.text = object.continmeter ?? '';
    setvikController.text = object.setvik ?? '';

    osnovanieController.text = object.osnovanie ?? '';
    descriptionController.text = object.description ?? '';
  }

  ObjectDetailVhCState(this.object);

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
                // fontSize: 32,
                color: Colors.white, // цвет невыбранных иконок
              ),
              tabs: [
                Tab(
                    icon: Icon(
                  Icons.notes_rounded,
                  size: 32,
                  // color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_unchecked_sharp,
                  size: 32,
                  // color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.radio_button_on_sharp,
                  size: 32,
                  // color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.build_circle_sharp,
                  size: 32,
                  // color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.design_services_sharp,
                  size: 32,
                  // color: Colors.white,
                )),
                Tab(
                    icon: Icon(
                  Icons.playlist_add_circle_sharp,
                  size: 32,
                  // color: Colors.white,
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
                          labelText: 'Наименование объекта *',
                          hintText: 'Как называется объект контроля',
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
                      DropdownButtonFormField(
                        focusNode: focusNode2,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelText: 'Основание для проведения шурфовки',
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
                            Icons.wysiwyg_rounded,
                            color: focusNode2.hasFocus ||
                                    osnovanieController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
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
                          focusNode2.requestFocus();
                          setState(() {});
                          object.osnovanie = value;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        focusNode: focusNode3,
                        maxLength: 10,
                        onFieldSubmitted: (value) {
                          object.piketkm = value;
                        },
                        controller: piketkmController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Километр газопровода',
                          hintText: 'Километр проведения',
                          helperText: 'км',
                          prefixIcon: Icon(
                            Icons.add_location_outlined,
                            color: focusNode3.hasFocus ||
                                    piketkmController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              piketkmController.clear();
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp(r'^\d+\,?\d{0,3}'),
                              allow: true)
                        ],
                        onChanged: (String value) {
                          setState(() {});
                          focusNode3.requestFocus();
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode4,
                        maxLength: 20,
                        onSaved: (value) {
                          object.coordinate = value;
                        },
                        controller: coordinateController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Координаты места шурфовки',
                          hintText: 'Координаты места шурфовки',
                          helperText: 'NN.NNNNNN/EE.EEEEEE',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode4.hasFocus ||
                                    coordinateController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              coordinateController.clear();
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
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode4.requestFocus();
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode5,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode5.requestFocus();
                        },
                        maxLength: 6,
                        onSaved: (value) {
                          object.lengthpit = value;
                        },
                        controller: lengthpitController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Длина шурфа',
                          hintText: 'Введите длину шурфа',
                          helperText: 'м',
                          prefixIcon: Icon(
                            Icons.arrow_forward_rounded,
                            color: focusNode5.hasFocus ||
                                    lengthpitController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              lengthpitController.clear();
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp(r'^\d+\,?\d{0,3}'),
                              allow: true)
                        ],
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode6,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode6.requestFocus();
                        },
                        maxLength: 6,
                        onSaved: (value) {
                          object.depthpit = value;
                        },
                        controller: depthpitController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Глубина шурфа',
                          hintText: 'Введите глубину шурфа',
                          helperText: 'м',
                          prefixIcon: Icon(
                            Icons.arrow_downward_sharp,
                            color: focusNode6.hasFocus ||
                                    depthpitController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              depthpitController.clear();
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp(r'^\d+\,?\d{0,3}'),
                              allow: true)
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
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
                            'ДАННЫЕ О ТРУБЕ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode7,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
                          labelText: 'Диаметр газопровода',
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
                            Icons.not_interested_sharp,
                            color: focusNode7.hasFocus ||
                                    diameterController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
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
                        ),
                        items: _diameter.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.diameter,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode7.requestFocus();
                          object.diameter = value;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        onChanged: (String value) {
                          setState(() {});
                          focusNode8.requestFocus();
                        },
                        focusNode: focusNode8,
                        maxLength: 6,
                        onSaved: (value) {
                          object.thickpipe = value;
                        },
                        controller: thickpipeController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Толщина стенки',
                          hintText: 'Введите толщину стенки',
                          helperText: 'мм',
                          prefixIcon: Icon(
                            Icons.vertical_align_center_sharp,
                            color: focusNode8.hasFocus ||
                                    thickpipeController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              thickpipeController.clear();
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          // FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter(RegExp(r'^\d+\,?\d{0,3}'),
                              allow: true),
                        ],
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode9,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          prefixIcon: Icon(
                            Icons.star_border_sharp,
                            color: focusNode9.hasFocus ||
                                    gradesteelController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Марка стали',
                        ),
                        items: _gradesteel.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.gradesteel,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode9.requestFocus();

                          object.gradesteel = value;
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode10,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          prefixIcon: Icon(
                            Icons.ssid_chart_sharp,
                            color: focusNode10.hasFocus ||
                                    metalldamageController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Повреждения металла',
                        ),
                        items: _metalldamage.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.metalldamage,
                        onChanged: (String value) {
                          object.metalldamage = value;
                          setState(() {});
                          focusNode10.requestFocus();
                        },
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode11,
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).primaryColor,
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
                            prefixIcon: Icon(
                              Icons.ssid_chart_sharp,
                              color: focusNode11.hasFocus ||
                                      charmetdamageController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            labelText: 'Характер дефекта',
                            suffixIcon: GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CameraPageIp()),
                                  ).then((value) {
                                    setState(() async {
                                      if (value != null) {
                                        _imageDefmet1 = value;
                                        if (_2formKey.currentState.validate()) {
                                          _2formKey.currentState.save();
                                          if (_imageDefmet1 != null) {
                                            final Directory extDir =
                                                await getApplicationDocumentsDirectory();
                                            final String dirPath =
                                                '${extDir.path}/Pictures/flutter';
                                            await Directory(dirPath)
                                                .create(recursive: true);
                                            final String filePath =
                                                '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
                                            await _imageDefmet1.copy(filePath);
                                            object.photometdef1 = filePath;
                                            print(
                                                'сделали: ${object.photometdef1.toString()}');
                                          }
                                        }
                                      }
                                    });
                                  });
                                },
                                child: Icon(Icons.camera_alt_sharp,
                                    color: Color.fromRGBO(97, 153, 59, 1.0)))),
                        items: _charmetdamage.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.charmetdamage,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode11.requestFocus();
                          object.charmetdamage = value;
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
                                            imagePath: object.photometdef1)),
                                  );
                                },
                                child: Center(
                                  child: object.photometdef1 != null
                                      ? Image.file(
                                          File(object.photometdef1),
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
                      TextFormField(
                        onChanged: (String value) {
                          setState(() {});
                          focusNode12.requestFocus();
                        },
                        focusNode: focusNode12,
                        maxLength: 20,
                        onSaved: (value) {
                          object.locmetdamage = value;
                        },
                        controller: locmetdamageController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Расположение дефекта',
                          hintText: 'Введите час и расстояние от шва по ХГ',
                          helperText: 'ЧАС-расстояние от шва по ХГ',
                          prefixIcon: Icon(
                            Icons.location_searching_sharp,
                            color: focusNode12.hasFocus ||
                                    locmetdamageController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              locmetdamageController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (String value) {
                          setState(() {});
                          focusNode13.requestFocus();
                        },
                        focusNode: focusNode13,
                        maxLength: 20,
                        onSaved: (value) {
                          object.sizemetdamage = value;
                        },
                        controller: sizemetdamageController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Размеры дефекта металла',
                          hintText: 'Введите размеры',
                          helperText: 'Длина х ширина х глубина',
                          prefixIcon: Icon(
                            Icons.location_searching_sharp,
                            color: focusNode13.hasFocus ||
                                    sizemetdamageController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              sizemetdamageController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
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
                            'ИЗОЛЯЦИОННОЕ ПОКРЫТИЕ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode14,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          prefixIcon: Icon(
                            Icons.star_rate_sharp,
                            color: focusNode14.hasFocus ||
                                    typeinsulController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Тип покрытия',
                        ),
                        items: _typeinsul.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.typeinsul,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode14.requestFocus();
                          object.typeinsul = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode15,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode15.requestFocus();
                        },
                        maxLength: 3,
                        onSaved: (value) {
                          object.thickinsul = value;
                        },
                        controller: thickinsulController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Толщина ИП',
                          hintText: 'Введите толщину покрытия',
                          helperText: 'мм',
                          prefixIcon: Icon(
                            Icons.vertical_align_center_sharp,
                            color: focusNode15.hasFocus ||
                                    thickinsulController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              thickinsulController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged: (String value) {
                          setState(() {});
                          focusNode16.requestFocus();
                        },
                        focusNode: focusNode16,
                        maxLength: 3,
                        onSaved: (value) {
                          object.insuladhes = value;
                        },
                        controller: insuladhesController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Адгезия ИП к стали',
                          hintText: 'Введите значение адгезии',
                          helperText: 'Н/см',
                          prefixIcon: Icon(
                            Icons.compress_sharp,
                            color: focusNode16.hasFocus ||
                                    insuladhesController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              insuladhesController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        focusNode: focusNode17,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          prefixIcon: Icon(
                            Icons.ssid_chart_sharp,
                            color: focusNode17.hasFocus ||
                                    insulcharadhesController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Характер разрушения',
                        ),
                        items: _insulcharadhes.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.insulcharadhes,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode17.requestFocus();

                          object.insulcharadhes = value;
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode18,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          prefixIcon: Icon(
                            Icons.thumbs_up_down_outlined,
                            color: focusNode18.hasFocus ||
                                    insulconditController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Состояние покрытия',
                        ),
                        items: _insulcondit.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.insulcondit,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode18.requestFocus();

                          object.insulcondit = value;
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode19,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          prefixIcon: Icon(
                            Icons.filter_tilt_shift_sharp,
                            color: focusNode19.hasFocus ||
                                    insuldamageController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Повреждения ИП',
                        ),
                        items: _insuldamage.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.insuldamage,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode19.requestFocus();
                          object.insuldamage = value;
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode20,
                        decoration: InputDecoration(
                            focusColor: Theme.of(context).primaryColor,
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
                            prefixIcon: Icon(
                              Icons.filter_tilt_shift_sharp,
                              color: focusNode20.hasFocus ||
                                      charinsuldamageController.text.isNotEmpty
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey,
                              size: 32,
                            ),
                            labelText: 'Характер повреждения',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CameraPageIp()),
                                  ).then((value) {
                                    setState(() async {
                                      if (value != null) {
                                        _image = value;

                                        print(
                                            'сделали: ${object.photo.toString()}');

                                        if (_1formKey.currentState.validate()) {
                                          _1formKey.currentState.save();
                                          if (_image != null) {
                                            final Directory extDir =
                                                await getApplicationDocumentsDirectory();
                                            final String dirPath =
                                                '${extDir.path}/Pictures/flutter_test';
                                            await Directory(dirPath)
                                                .create(recursive: true);
                                            final String filePath =
                                                '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
                                            await _image.copy(filePath);
                                            object.photo = filePath;
                                          }
                                        }
                                      }
                                    });
                                  });
                                },
                                child: Icon(Icons.camera_alt_sharp,
                                    color: Color.fromRGBO(97, 153, 59, 1.0)))),
                        items: _charinsuldamage.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.charinsuldamage,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode20.requestFocus();
                          object.charinsuldamage = value;
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
                      TextFormField(
                        focusNode: focusNode21,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode21.requestFocus();
                        },
                        onSaved: (value) {
                          object.locinsuldamage = value;
                        },
                        controller: locinsuldamageController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Расположение дефекта',
                          hintText: 'Введите час и расстояние от шва по ХГ',
                          helperText: 'ЧАС-расстояние от шва по ХГ',
                          prefixIcon: Icon(
                            Icons.location_searching_sharp,
                            color: focusNode21.hasFocus ||
                                    locinsuldamageController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              locinsuldamageController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode22,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode22.requestFocus();
                        },
                        maxLength: 20,
                        onSaved: (value) {
                          object.sizeinsuldamage = value;
                        },
                        controller: sizeinsuldamageController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Размеры дефекта покрытия',
                          hintText: 'Введите размеры',
                          helperText: 'Длина х ширина х глубина',
                          prefixIcon: Icon(
                            Icons.location_searching_sharp,
                            color: focusNode22.hasFocus ||
                                    sizeinsuldamageController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              sizeinsuldamageController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
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
                            'ДАННЫЕ О РЕМОНТЕ ИП',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      DropdownButtonFormField(
                        focusNode: focusNode23,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          prefixIcon: Icon(
                            Icons.map,
                            color: focusNode23.hasFocus ||
                                    typeinsulrestController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          labelText: 'Конструкция отремонтированного покрытия',
                        ),
                        items: _typeinsulrest.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: textStyle,
                        value: object.typeinsulrest,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode23.requestFocus();
                          object.typeinsulrest = value;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode24,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode24.requestFocus();
                        },
                        maxLength: 3,
                        onSaved: (value) {
                          object.insuladhesrest = value;
                        },
                        controller: insuladhesrestController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Адгезия ИП к стали',
                          hintText: 'Введите значение адгезии',
                          helperText: 'Н/см',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode24.hasFocus ||
                                    insuladhesrestController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              insuladhesrestController.clear();
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
                        keyboardType: TextInputType.number,
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
                          object.thickinsulrest = value;
                        },
                        controller: thickinsulrestController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Толщина ИП',
                          hintText: 'Введите толщину покрытия',
                          helperText: 'мм',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode25.hasFocus ||
                                    thickinsulrestController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              thickinsulrestController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode26,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode26.requestFocus();
                        },
                        maxLength: 3,
                        onSaved: (value) {
                          object.contininsulrest = value;
                        },
                        controller: contininsulrestController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Отсутствие пробоя при напряжении',
                          hintText: 'Введите величину напряжения',
                          helperText: 'кВ',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode26.hasFocus ||
                                    contininsulrestController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              contininsulrestController.clear();
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
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
                      SizedBox(height: 10),
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
                          object.tickinsulmeter = value;
                        },
                        controller: tickinsulmeterController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Толщиномер покрытий',
                          hintText: 'Введите название и номер',
                          helperText: '... № ...',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode27.hasFocus ||
                                    tickinsulmeterController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              tickinsulmeterController.clear();
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
                          object.tickmetallmeter = value;
                        },
                        controller: tickmetallmeterController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Толщиномер металла',
                          hintText: 'Введите название и номер',
                          helperText: '... № ...',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode28.hasFocus ||
                                    tickmetallmeterController.text.isNotEmpty
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            size: 32,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              tickmetallmeterController.clear();
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
                          object.adhesmeter = value;
                        },
                        controller: adhesmeterController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Адгезиметр',
                          hintText: 'Введите название и номер',
                          helperText: '... № ...',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode29.hasFocus ||
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
                          object.continmeter = value;
                        },
                        controller: continmeterController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Искровой дефектоскоп',
                          hintText: 'Введите название и номер',
                          helperText: '... № ...',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode30.hasFocus ||
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        focusNode: focusNode31,
                        onChanged: (String value) {
                          setState(() {});
                          focusNode31.requestFocus();
                        },
                        maxLength: 20,
                        onSaved: (value) {
                          object.setvik = value;
                        },
                        controller: setvikController,
                        style: textStyle,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Комплект ВИК',
                          hintText: 'Введите номер комплекта',
                          helperText: '№ ...',
                          prefixIcon: Icon(
                            Icons.map_sharp,
                            color: focusNode31.hasFocus ||
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
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
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
                            'ДОПОЛНИТЕЛЬНАЯ ИНОФРМАЦИЯ',
                            style: TextStyle(
                                fontSize: 24,
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w300),
                          )),
                      SizedBox(height: 20),
                      TextFormField(
                        maxLength: 1000,
                        onSaved: (value) {
                          object.description = value;
                        },
                        controller: descriptionController,
                        decoration: InputDecoration(
                          focusColor: Theme.of(context).primaryColor,
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
                          labelText: 'Дополнительные сведения',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CameraPageIp()),
                                ).then((value) {
                                  setState(() async {
                                    if (value != null) {
                                      _image = value;

                                      print(
                                          'сделали: ${object.photo.toString()}');

                                      if (_1formKey.currentState.validate()) {
                                        _1formKey.currentState.save();
                                        if (_image != null) {
                                          final Directory extDir =
                                              await getApplicationDocumentsDirectory();
                                          final String dirPath =
                                              '${extDir.path}/Pictures/flutter_test';
                                          await Directory(dirPath)
                                              .create(recursive: true);
                                          final String filePath =
                                              '$dirPath/${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
                                          await _image.copy(filePath);
                                          object.photo = filePath;
                                        }
                                      }
                                    }
                                  });
                                });
                              },
                              child: Icon(Icons.camera_alt_sharp,
                                  color: Color.fromRGBO(97, 153, 59, 1.0))),
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
                        ),
                        maxLines: 10,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(137),
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary:
                                Theme.of(context).accentColor, // background
                            onPrimary: Colors.white,
                            elevation: 2,
                            padding: const EdgeInsets.all(13.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(10.0)) // foreground
                            ),
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
                backgroundColor: Color.fromRGBO(187, 30, 16, 1.0),
                tooltip: 'Удалить запись',
                child: Icon(
                  Icons.clear,
                  size: 35.0,
                  color: Colors.white,
                ))
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      ),
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
                style: TextStyle(
                    color: Color.fromRGBO(187, 30, 16, 1.0),
                    fontWeight: FontWeight.bold),
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
      object.title == titleController.text;
    });
  }

  void updatePiketkm() {
    setState(() {
      object.piketkm = piketkmController.text;
    });
  }

  void updateCoordinate() {
    setState(() {
      object.coordinate = coordinateController.text;
    });
  }

  void updateLengthpit() {
    setState(() {
      object.lengthpit = lengthpitController.text;
    });
  }

  void updateDepthpit() {
    setState(() {
      object.depthpit = depthpitController.text;
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

  void updateDiameter() {
    setState(() {
      object.diameter = diameterController.text;
    });
  }

  void updateThickpipe() {
    setState(() {
      object.thickpipe = thickpipeController.text;
    });
  }

  void updateGradesteele() {
    setState(() {
      object.gradesteel = gradesteelController.text;
    });
  }

  void updateMetalldamage() {
    setState(() {
      object.metalldamage = metalldamageController.text;
    });
  }

  void updateCharmetdamage() {
    setState(() {
      object.charmetdamage = charmetdamageController.text;
    });
  }

  void updateLocmetdamage() {
    setState(() {
      object.locmetdamage = locmetdamageController.text;
    });
  }

  void updateSizemetdamage() {
    setState(() {
      object.sizemetdamage = sizemetdamageController.text;
    });
  }

  void updateTypeinsul() {
    setState(() {
      object.typeinsul = typeinsulController.text;
    });
  }

  void updateInsuladhes() {
    setState(() {
      object.insuladhes = insuladhesController.text;
    });
  }

  void updateInsulcharadhes() {
    setState(() {
      object.insulcharadhes = insulcharadhesController.text;
    });
  }

  void updateInsulcondit() {
    setState(() {
      object.insulcondit = insulconditController.text;
    });
  }

  void updateThickinsul() {
    setState(() {
      object.thickinsul = thickinsulController.text;
    });
  }

  void updateInsuldamage() {
    setState(() {
      object.insuldamage = insuldamageController.text;
    });
  }

  void updateCharinsuldamage() {
    setState(() {
      object.charinsuldamage = charinsuldamageController.text;
    });
  }

  void updateLocinsuldamage() {
    setState(() {
      object.locinsuldamage = locinsuldamageController.text;
    });
  }

  void updateSizeinsuldamage() {
    setState(() {
      object.sizeinsuldamage = sizeinsuldamageController.text;
    });
  }

  void updateTypeinsulrest() {
    setState(() {
      object.typeinsulrest = typeinsulrestController.text;
    });
  }

  void updateInsuladhesrest() {
    setState(() {
      object.insuladhesrest = insuladhesrestController.text;
    });
  }

  void updateThickinsulrest() {
    setState(() {
      object.thickinsulrest = thickinsulrestController.text;
    });
  }

  void updateContininsulrest() {
    setState(() {
      object.contininsulrest = contininsulrestController.text;
    });
  }

  void updateTickinsulmeter() {
    setState(() {
      object.tickinsulmeter = tickinsulmeterController.text;
    });
  }

  void updateTickmetallmeter() {
    setState(() {
      object.tickmetallmeter = tickmetallmeterController.text;
    });
  }

  void updateAdhesmeter() {
    setState(() {
      object.adhesmeter = adhesmeterController.text;
    });
  }

  void updateContinmeter() {
    setState(() {
      object.continmeter = continmeterController.text;
    });
  }

  void updateSetvik() {
    setState(() {
      object.setvik = setvikController.text;
    });
  }
}
