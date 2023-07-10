import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Todo {
  int _id;

  String _date;
  String _title; //наименование
  String _squareclear; //площадь очистки
  String _constroldcoat; //конструкция старого покрытия
  String _photo;
  String _photoISO;
  String _photoDust;
  String _photoRoughness;
  String _prepmethod; //способ подготовки
  String _iso8501;
  String _degrofdegr; //степень обезжиривания
  String _degrofoxid; //степень очистки от окислов
  String _degrofdedust1; //степень обеспыливания количество
  String _degrofdedust2; //степень обеспыливания размер
  String _roughness; //шероховатость
  String _surfsalts; //загрязнение поверхности солями
  String _inst;

  String _tempair; //температура воздуха
  String _tempsurf; //температура поверхности
  String _relathumid; //относительная влажность
  String _dewpoint; //точка росы
  String _difftemp; //разница температур

  String _techcondmat; //технические условия на материал
  String _numdoflay; //количество слоев
  String _squarenew; //площадь очистки
  String _thickofwellay; // толщина мокрого слоя.
  String _thickofdrylay; //толщина сухого слоя
  String _contin; //сплошность.
  String _timedry; //время сушки.
  String _degrdry; //степень сушки.
  String _defdur; //дефекты при нанесении

  String _apperance; //внешний вид
  String _bgcolor; // цвет
  String _adhesion; //адгезия
  String _dielcont; //диэлектрическая сплошность

  String _thickinsulmeter; //толщиномер
  String _adhesmeter; //адгезиметр
  String _continmeter; //искровой дефектоскоп
  String _setvik; //комплект ВИК

  String _changecolor; //изменение цвета.
  String _changegloss; // изменение блеска.
  String _mudretant; //грязеудержание.
  String _chalking; //меление
  String _description;

  Todo(
    this._title,
    this._date, [
    this._photo,
    this._photoISO,
    this._photoDust,
    this._photoRoughness,
    this._inst,
    this._iso8501,
    this._squareclear,
    this._constroldcoat,
    this._prepmethod,
    this._degrofdegr,
    this._degrofoxid,
    this._degrofdedust1,
    this._degrofdedust2,
    this._roughness,
    this._surfsalts,
    this._tempair,
    this._tempsurf,
    this._relathumid,
    this._dewpoint,
    this._difftemp,
    this._techcondmat,
    this._numdoflay,
    this._squarenew,
    this._thickofwellay,
    this._thickofdrylay,
    this._contin,
    this._timedry,
    this._degrdry,
    this._defdur,
    this._apperance,
    this._bgcolor,
    this._adhesion,
    this._dielcont,
    this._thickinsulmeter,
    this._adhesmeter,
    this._continmeter,
    this._setvik,
    this._changecolor,
    this._changegloss,
    this._mudretant,
    this._chalking,
    this._description,
  ]);

  Todo.withId(
    this._id,
    this._title,
    this._date, [
    this._photo,
    this._photoISO,
    this._photoDust,
    this._photoRoughness,
    this._inst,
    this._iso8501,
    this._squareclear,
    this._constroldcoat,
    this._prepmethod,
    this._degrofdegr,
    this._degrofoxid,
    this._degrofdedust1,
    this._degrofdedust2,
    this._roughness,
    this._surfsalts,
    this._tempair,
    this._tempsurf,
    this._relathumid,
    this._dewpoint,
    this._difftemp,
    this._techcondmat,
    this._numdoflay,
    this._squarenew,
    this._thickofwellay,
    this._thickofdrylay,
    this._contin,
    this._timedry,
    this._degrdry,
    this._defdur,
    this._apperance,
    this._bgcolor,
    this._adhesion,
    this._dielcont,
    this._thickinsulmeter,
    this._adhesmeter,
    this._continmeter,
    this._setvik,
    this._changecolor,
    this._changegloss,
    this._mudretant,
    this._chalking,
    this._description,
  ]);

  int get id => _id;
  String get todoDate => _date;
  String get photo => _photo;
  String get photoISO => _photoISO;
  String get photoDust => _photoDust;
  String get photoRoughness => _photoRoughness;
  String get title => _title;
  String get squareclear => _squareclear;
  String get constroldcoat => _constroldcoat;
  String get inst => _inst;
  String get iso8501 => _iso8501;
  String get prepmethod => _prepmethod;
  String get degrofdegr => _degrofdegr;
  String get degrofoxid => _degrofoxid;
  String get degrofdedust1 => _degrofdedust1;
  String get degrofdedust2 => _degrofdedust2;
  String get roughness => _roughness;
  String get surfsalts => _surfsalts;

  String get tempair => _tempair;
  String get tempsurf => _tempsurf;
  String get relathumid => _relathumid;
  String get dewpoint => _dewpoint;
  String get difftemp => _difftemp;

  String get techcondmat => _techcondmat;
  String get numdoflay => _numdoflay;
  String get squarenew => _squarenew;
  String get thickofwellay => _thickofwellay;
  String get thickofdrylay => _thickofdrylay;
  String get contin => _contin;
  String get timedry => _timedry;
  String get degrdry => _degrdry;
  String get defdur => _defdur;

  String get apperance => _apperance;
  String get bgcolor => _bgcolor;
  String get adhesion => _adhesion;
  String get dielcont => _dielcont;

  String get thickinsulmeter => _thickinsulmeter;
  String get adhesmeter => _adhesmeter;
  String get continmeter => _continmeter;
  String get setvik => _setvik;

  String get changecolor => _changecolor;
  String get changegloss => _changegloss;
  String get mudretant => _mudretant;
  String get chalking => _chalking;
  String get description => _description;

  set photo(String newphoto) {
    if ((newphoto?.length ?? 0) <= 255) {
      _photo = newphoto;
    }
  }

  set photoISO(String newphotoISO) {
    if ((newphotoISO?.length ?? 0) <= 255) {
      _photoISO = newphotoISO;
    }
  }

  set photoDust(String newphotoDust) {
    if ((newphotoDust?.length ?? 0) <= 255) {
      _photoDust = newphotoDust;
    }
  }

  set photoRoughness(String newphotoRoughness) {
    if ((newphotoRoughness?.length ?? 0) <= 255) {
      _photoRoughness = newphotoRoughness;
    }
  }

  set title(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _title = newTitle;
    }
  }

  set squareclear(String newsquareclear) {
    if ((newsquareclear?.length ?? 0) <= 255) {
      _squareclear = newsquareclear;
    }
  }

  set constroldcoat(String newconstroldcoat) {
    if ((newconstroldcoat?.length ?? 0) <= 255) {
      _constroldcoat = newconstroldcoat;
    }
  }

  set inst(String newInst) {
    if ((newInst?.length ?? 0) <= 255) {
      _inst = newInst;
    }
  }

  set iso8501(String newISO8501) {
    if ((newISO8501?.length ?? 0) <= 255) {
      _iso8501 = newISO8501;
    }
  }

  set prepmethod(String newPrepMethod) {
    if ((newPrepMethod?.length ?? 0) <= 255) {
      _prepmethod = newPrepMethod;
    }
  }

  set degrofdegr(String newdegrofdegr) {
    if ((newdegrofdegr?.length ?? 0) <= 255) {
      _degrofdegr = newdegrofdegr;
    }
  }

  set degrofoxid(String newdegrofoxid) {
    if ((newdegrofoxid?.length ?? 0) <= 255) {
      _degrofoxid = newdegrofoxid;
    }
  }

  set degrofdedust1(String newdegrofdedust1) {
    if ((newdegrofdedust1?.length ?? 0) <= 255) {
      _degrofdedust1 = newdegrofdedust1;
    }
  }

  set degrofdedust2(String newdegrofdedust2) {
    if ((newdegrofdedust2?.length ?? 0) <= 255) {
      _degrofdedust2 = newdegrofdedust2;
    }
  }

  set roughness(String newRoughness) {
    if ((newRoughness?.length ?? 0) <= 255) {
      _roughness = newRoughness;
    }
  }

  set surfsalts(String newsurfsalts) {
    if ((newsurfsalts?.length ?? 0) <= 255) {
      _surfsalts = newsurfsalts;
    }
  }

  set tempair(String newtempair) {
    if ((newtempair?.length ?? 0) <= 255) {
      _tempair = newtempair;
    }
  }

  set tempsurf(String newtempsurf) {
    if ((newtempsurf?.length ?? 0) <= 255) {
      _tempsurf = newtempsurf;
    }
  }

  set relathumid(String newrelathumid) {
    if ((newrelathumid?.length ?? 0) <= 255) {
      _relathumid = newrelathumid;
    }
  }

  set dewpoint(String newdewpoint) {
    if ((newdewpoint?.length ?? 0) <= 255) {
      _dewpoint = newdewpoint;
    }
  }

  set difftemp(String newdifftemp) {
    if ((newdifftemp?.length ?? 0) <= 255) {
      _difftemp = newdifftemp;
    }
  }

  set techcondmat(String newtechcondmat) {
    if ((newtechcondmat?.length ?? 0) <= 255) {
      _techcondmat = newtechcondmat;
    }
  }

  set numdoflay(String newnumdoflay) {
    if ((newnumdoflay?.length ?? 0) <= 255) {
      _numdoflay = newnumdoflay;
    }
  }

  set squarenew(String newsquarenew) {
    if ((newsquarenew?.length ?? 0) <= 255) {
      _squarenew = newsquarenew;
    }
  }

  set thickofwellay(String newthickofwellay) {
    if ((newthickofwellay?.length ?? 0) <= 255) {
      _thickofwellay = newthickofwellay;
    }
  }

  set thickofdrylay(String newthickofdrylay) {
    if ((newthickofdrylay?.length ?? 0) <= 255) {
      _thickofdrylay = newthickofdrylay;
    }
  }

  set contin(String newcontin) {
    if ((newcontin?.length ?? 0) <= 255) {
      _contin = newcontin;
    }
  }

  set timedry(String newtimedry) {
    if ((newtimedry?.length ?? 0) <= 255) {
      _timedry = newtimedry;
    }
  }

  set degrdry(String newdegrdry) {
    if ((newdegrdry?.length ?? 0) <= 255) {
      _degrdry = newdegrdry;
    }
  }

  set defdur(String newdefdur) {
    if ((newdefdur?.length ?? 0) <= 255) {
      _defdur = newdefdur;
    }
  }

  set apperance(String newapperance) {
    if ((newapperance?.length ?? 0) <= 255) {
      _apperance = newapperance;
    }
  }

  set bgcolor(String newBgcolor) {
    if ((newBgcolor?.length ?? 0) <= 255) {
      _bgcolor = newBgcolor;
    }
  }

  set adhesion(String newadhesion) {
    if ((newadhesion?.length ?? 0) <= 255) {
      _adhesion = newadhesion;
    }
  }

  set dielcont(String newdielcont) {
    if ((newdielcont?.length ?? 0) <= 255) {
      _dielcont = newdielcont;
    }
  }

  set thickinsulmeter(String newthickinsulmeter) {
    if ((newthickinsulmeter?.length ?? 0) <= 255) {
      _thickinsulmeter = newthickinsulmeter;
    }
  }

  set adhesmeter(String newadhesmeter) {
    if ((newadhesmeter?.length ?? 0) <= 255) {
      _adhesmeter = newadhesmeter;
    }
  }

  set continmeter(String newcontinmeter) {
    if ((newcontinmeter?.length ?? 0) <= 255) {
      _continmeter = newcontinmeter;
    }
  }

  set setvik(String newsetvik) {
    if ((newsetvik?.length ?? 0) <= 255) {
      _setvik = newsetvik;
    }
  }

  set changecolor(String newchangecolor) {
    if ((newchangecolor?.length ?? 0) <= 255) {
      _changecolor = newchangecolor;
    }
  }

  set changegloss(String newchangegloss) {
    if ((newchangegloss?.length ?? 0) <= 255) {
      _changegloss = newchangegloss;
    }
  }

  set mudretant(String newmudretant) {
    if ((newmudretant?.length ?? 0) <= 255) {
      _mudretant = newmudretant;
    }
  }

  set chalking(String newchalking) {
    if ((newchalking?.length ?? 0) <= 255) {
      _chalking = newchalking;
    }
  }

  set description(String newdescription) {
    if ((newdescription?.length ?? 0) <= 255) {
      _description = newdescription;
    }
  }

  set todoDate(newDate) {
    _date = newDate;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = _title;

    map['date'] = _date;
    map['squareclear'] = _squareclear;
    map['constroldcoat'] = _constroldcoat;
    map['inst'] = _inst;
    map['iso8501'] = _iso8501;
    map['prepmethod'] = _prepmethod;
    map['degrofdegr'] = _degrofdegr;
    map['degrofoxid'] = _degrofoxid;
    map['degrofdedust1'] = _degrofdedust1;
    map['degrofdedust2'] = _degrofdedust2;
    map['roughness'] = _roughness;
    map['surfsalts'] = _surfsalts;

    map['tempair'] = _tempair;
    map['tempsurf'] = _tempsurf;
    map['relathumid'] = _relathumid;
    map['dewpoint'] = _dewpoint;
    map['difftemp'] = _difftemp;

    map['techcondmat'] = _techcondmat;
    map['numdoflay'] = _numdoflay;
    map['squarenew'] = _squarenew;
    map['thickofwellay'] = _thickofwellay;
    map['thickofdrylay'] = _thickofdrylay;
    map['contin'] = _contin;
    map['timedry'] = _timedry;
    map['degrdry'] = _degrdry;
    map['defdur'] = _defdur;

    map['apperance'] = _apperance;
    map['bgcolor'] = _bgcolor;
    map['adhesion'] = _adhesion;
    map['dielcont'] = _dielcont;

    map['thickinsulmeter'] = _thickinsulmeter;
    map['adhesmeter'] = _adhesmeter;
    map['continmeter'] = _continmeter;
    map['setvik'] = _setvik;

    map['changecolor'] = _changecolor;
    map['changegloss'] = _changegloss;
    map['mudretant'] = _mudretant;
    map['chalking'] = _chalking;
    map['description'] = _description;
    map['photo'] = _photo;
    map['photoISO'] = _photoISO;
    map['photoDust'] = _photoDust;
    map['photoRoughness'] = _photoRoughness;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _id = o['id'];
    _title = o['title'];

    _date = o['date'];
    _squareclear = o['squareclear'];
    _constroldcoat = o['constroldcoat'];
    _inst = o['inst'];
    _iso8501 = o['iso8501'];
    _prepmethod = o['prepmethod'];
    _degrofdegr = o['degrofdegr'];
    _degrofoxid = o['degrofoxid'];
    _degrofdedust1 = o['degrofdedust1'];
    _degrofdedust2 = o['degrofdedust2'];
    _roughness = o['roughness'];
    _surfsalts = o['surfsalts'];
    _tempair = o['tempair'];
    _tempsurf = o['tempsurf'];
    _relathumid = o['relathumid'];
    _dewpoint = o['dewpoint'];
    _difftemp = o['difftemp'];
    _techcondmat = o['techcondmat'];
    _numdoflay = o['numdoflay'];
    _squarenew = o['squarenew'];
    _thickofwellay = o['thickofwellay'];
    _thickofdrylay = o['thickofdrylay'];
    _contin = o['contin'];
    _timedry = o['timedry'];
    _degrdry = o['degrdry'];
    _defdur = o['defdur'];
    _apperance = o['apperance'];
    _bgcolor = o['bgcolor'];
    _adhesion = o['adhesion'];
    _dielcont = o['dielcont'];
    _thickinsulmeter = o['thickinsulmeter'];
    _adhesmeter = o['adhesmeter'];
    _continmeter = o['continmeter'];
    _setvik = o['setvik'];
    _changecolor = o['changecolor'];
    _changegloss = o['changegloss'];
    _mudretant = o['mudretant'];
    _chalking = o['chalking'];
    _description = o['description'];
    _photo = o['photo'];
    _photoISO = o['photoISO'];
    _photoDust = o['photoDust'];
    _photoRoughness = o['photoRoughness'];
  }
}
