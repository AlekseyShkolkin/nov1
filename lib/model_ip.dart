import 'dart:ffi';
import 'dart:io';

import 'package:flutter/foundation.dart';

class Todo {
  int _id;
  String _title;
  String _osnovanie;
  String _piketkm;
  String _coordinate;
  String _lengthpit;
  String _depthpit;
  String _photo;

  String _photometdef1;
  String _photometdef2;
  String _photometdef3;
  String _photometdef4;
  String _photometdef5;
  String _photometdef6;
  String _photometdef7;
  String _photometdef8;
  String _photometdef9;
  String _photometdef10;
  String _photoinsuldef1;
  String _photoinsuldef2;
  String _photoinsuldef3;
  String _photoinsuldef4;
  String _photoinsuldef5;
  String _photoinsuldef6;
  String _photoinsuldef7;
  String _photoinsuldef8;
  String _photoinsuldef9;
  String _photoinsuldef10;
  String _photorest;
  String _photodesc;

  String _diameter;
  String _thickpipe;
  String _gradesteel;
  String _metalldamage;
  String _charmetdamage;
  String _locmetdamage;
  String _sizemetdamage;

  String _typeinsul;
  String _insuladhes;
  String _insulcharadhes;
  String _insulcondit;
  String _thickinsul;
  String _insuldamage;
  String _charinsuldamage;
  String _locinsuldamage;
  String _sizeinsuldamage;

  String _typeinsulrest;
  String _insuladhesrest;
  String _thickinsulrest;
  String _contininsulrest;

  String _tickinsulmeter;
  String _tickmetallmeter;
  String _adhesmeter;
  String _continmeter;
  String _setvik;

  String _description;
  String _date;

  Todo(
    this._title,
    this._date, [
    this._photometdef1,
    this._photometdef2,
    this._photometdef3,
    this._photometdef4,
    this._photometdef5,
    this._photometdef6,
    this._photometdef7,
    this._photometdef8,
    this._photometdef9,
    this._photometdef10,
    this._photoinsuldef1,
    this._photoinsuldef2,
    this._photoinsuldef3,
    this._photoinsuldef4,
    this._photoinsuldef5,
    this._photoinsuldef6,
    this._photoinsuldef7,
    this._photoinsuldef8,
    this._photoinsuldef9,
    this._photoinsuldef10,
    this._photorest,
    this._photodesc,
    this._photo,
    this._piketkm,
    this._coordinate,
    this._lengthpit,
    this._depthpit,
    this._osnovanie,
    this._description,
    this._diameter,
    this._thickpipe,
    this._gradesteel,
    this._metalldamage,
    this._charmetdamage,
    this._locmetdamage,
    this._sizemetdamage,
    this._typeinsul,
    this._insuladhes,
    this._insulcharadhes,
    this._insulcondit,
    this._thickinsul,
    this._insuldamage,
    this._charinsuldamage,
    this._locinsuldamage,
    this._sizeinsuldamage,
    this._typeinsulrest,
    this._insuladhesrest,
    this._thickinsulrest,
    this._contininsulrest,
    this._tickinsulmeter,
    this._tickmetallmeter,
    this._adhesmeter,
    this._continmeter,
    this._setvik,
  ]);

  Todo.withId(
    this._id,
    this._title,
    this._date, [
    this._photometdef1,
    this._photometdef2,
    this._photometdef3,
    this._photometdef4,
    this._photometdef5,
    this._photometdef6,
    this._photometdef7,
    this._photometdef8,
    this._photometdef9,
    this._photometdef10,
    this._photoinsuldef1,
    this._photoinsuldef2,
    this._photoinsuldef3,
    this._photoinsuldef4,
    this._photoinsuldef5,
    this._photoinsuldef6,
    this._photoinsuldef7,
    this._photoinsuldef8,
    this._photoinsuldef9,
    this._photoinsuldef10,
    this._photorest,
    this._photodesc,
    this._photo,
    this._piketkm,
    this._coordinate,
    this._lengthpit,
    this._depthpit,
    this._osnovanie,
    this._description,
    this._diameter,
    this._thickpipe,
    this._gradesteel,
    this._metalldamage,
    this._charmetdamage,
    this._locmetdamage,
    this._sizemetdamage,
    this._typeinsul,
    this._insuladhes,
    this._insulcharadhes,
    this._insulcondit,
    this._thickinsul,
    this._insuldamage,
    this._charinsuldamage,
    this._locinsuldamage,
    this._sizeinsuldamage,
    this._typeinsulrest,
    this._insuladhesrest,
    this._thickinsulrest,
    this._contininsulrest,
    this._tickinsulmeter,
    this._tickmetallmeter,
    this._adhesmeter,
    this._continmeter,
    this._setvik,
  ]);

  int get id => _id;
  String get photometdef1 => _photometdef1;
  String get photometdef2 => _photometdef2;
  String get photometdef3 => _photometdef3;
  String get photometdef4 => _photometdef4;
  String get photometdef5 => _photometdef5;
  String get photometdef6 => _photometdef6;
  String get photometdef7 => _photometdef7;
  String get photometdef8 => _photometdef8;
  String get photometdef9 => _photometdef9;
  String get photometdef10 => _photometdef10;
  String get photoinsuldef1 => _photoinsuldef1;
  String get photoinsuldef2 => _photoinsuldef2;
  String get photoinsuldef3 => _photoinsuldef3;
  String get photoinsuldef4 => _photoinsuldef4;
  String get photoinsuldef5 => _photoinsuldef5;
  String get photoinsuldef6 => _photoinsuldef6;
  String get photoinsuldef7 => _photoinsuldef7;
  String get photoinsuldef8 => _photoinsuldef8;
  String get photoinsuldef9 => _photoinsuldef9;
  String get photoinsuldef10 => _photoinsuldef10;
  String get photorest => _photorest;
  String get photodesc => _photodesc;
  String get photo => _photo;
  String get title => _title;
  String get piketkm => _piketkm;
  String get coordinate => _coordinate;
  String get lengthpit => _lengthpit;
  String get depthpit => _depthpit;
  String get osnovanie => _osnovanie;
  String get todoDate => _date;
  String get description => _description;

  String get diameter => _diameter;
  String get thickpipe => _thickpipe;
  String get gradesteel => _gradesteel;
  String get metalldamage => _metalldamage;
  String get charmetdamage => _charmetdamage;
  String get locmetdamage => _locmetdamage;
  String get sizemetdamage => _sizemetdamage;
  String get typeinsul => _typeinsul;
  String get insuladhes => _insuladhes;
  String get insulcharadhes => _insulcharadhes;
  String get insulcondit => _insulcondit;
  String get thickinsul => _thickinsul;
  String get insuldamage => _insuldamage;
  String get charinsuldamage => _charinsuldamage;
  String get locinsuldamage => _locinsuldamage;
  String get sizeinsuldamage => _sizeinsuldamage;
  String get typeinsulrest => _typeinsulrest;
  String get insuladhesrest => _insuladhesrest;
  String get thickinsulrest => _thickinsulrest;
  String get contininsulrest => _contininsulrest;
  String get tickinsulmeter => _tickinsulmeter;
  String get tickmetallmeter => _tickmetallmeter;
  String get adhesmeter => _adhesmeter;
  String get continmeter => _continmeter;
  String get setvik => _setvik;

  set title(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _title = newTitle;
    }
  }

  set photo(String newphoto) {
    if ((newphoto?.length ?? 0) <= 255) {
      _photo = newphoto;
    }
  }

  set photometdef1(String newphotometdef1) {
    if ((newphotometdef1?.length ?? 0) <= 255) {
      _photometdef1 = newphotometdef1;
    }
  }

  set photometdef2(String newphotometdef2) {
    if ((newphotometdef2?.length ?? 0) <= 255) {
      _photometdef2 = newphotometdef2;
    }
  }

  set photometdef3(String newphotometdef3) {
    if ((newphotometdef3?.length ?? 0) <= 255) {
      _photometdef3 = newphotometdef3;
    }
  }

  set photometdef4(String newphotometdef4) {
    if ((newphotometdef4?.length ?? 0) <= 255) {
      _photometdef4 = newphotometdef4;
    }
  }

  set photometdef5(String newphotometdef5) {
    if ((newphotometdef5?.length ?? 0) <= 255) {
      _photometdef5 = newphotometdef5;
    }
  }

  set photometdef6(String newphotometdef6) {
    if ((newphotometdef6?.length ?? 0) <= 255) {
      _photometdef6 = newphotometdef6;
    }
  }

  set photometdef7(String newphotometdef7) {
    if ((newphotometdef7?.length ?? 0) <= 255) {
      _photometdef7 = newphotometdef7;
    }
  }

  set photometdef8(String newphotometdef8) {
    if ((newphotometdef8?.length ?? 0) <= 255) {
      _photometdef8 = newphotometdef8;
    }
  }

  set photometdef9(String newphotometdef9) {
    if ((newphotometdef9?.length ?? 0) <= 255) {
      _photometdef9 = newphotometdef9;
    }
  }

  set photometdef10(String newphotometdef10) {
    if ((newphotometdef10?.length ?? 0) <= 255) {
      _photometdef10 = newphotometdef10;
    }
  }

  set photoinsuldef1(String newphotoinsuldef1) {
    if ((newphotoinsuldef1?.length ?? 0) <= 255) {
      _photoinsuldef1 = newphotoinsuldef1;
    }
  }

  set photoinsuldef2(String newphotoinsuldef2) {
    if ((newphotoinsuldef2?.length ?? 0) <= 255) {
      _photoinsuldef2 = newphotoinsuldef2;
    }
  }

  set photoinsuldef3(String newphotoinsuldef3) {
    if ((newphotoinsuldef3?.length ?? 0) <= 255) {
      _photoinsuldef3 = newphotoinsuldef3;
    }
  }

  set photoinsuldef4(String newphotoinsuldef4) {
    if ((newphotoinsuldef4?.length ?? 0) <= 255) {
      _photoinsuldef4 = newphotoinsuldef4;
    }
  }

  set photoinsuldef5(String newphotoinsuldef5) {
    if ((newphotoinsuldef5?.length ?? 0) <= 255) {
      _photoinsuldef5 = newphotoinsuldef5;
    }
  }

  set photoinsuldef6(String newphotoinsuldef6) {
    if ((newphotoinsuldef6?.length ?? 0) <= 255) {
      _photoinsuldef6 = newphotoinsuldef6;
    }
  }

  set photoinsuldef7(String newphotoinsuldef7) {
    if ((newphotoinsuldef7?.length ?? 0) <= 255) {
      _photoinsuldef7 = newphotoinsuldef7;
    }
  }

  set photoinsuldef8(String newphotoinsuldef8) {
    if ((newphotoinsuldef8?.length ?? 0) <= 255) {
      _photoinsuldef8 = newphotoinsuldef8;
    }
  }

  set photoinsuldef9(String newphotoinsuldef9) {
    if ((newphotoinsuldef9?.length ?? 0) <= 255) {
      _photoinsuldef9 = newphotoinsuldef9;
    }
  }

  set photoinsuldef10(String newphotoinsuldef10) {
    if ((newphotoinsuldef10?.length ?? 0) <= 255) {
      _photoinsuldef7 = newphotoinsuldef10;
    }
  }

  set photorest(String newpphotorest) {
    if ((newpphotorest?.length ?? 0) <= 255) {
      _photorest = newpphotorest;
    }
  }

  set photodesc(String newphotodesc) {
    if ((newphotodesc?.length ?? 0) <= 255) {
      _photodesc = newphotodesc;
    }
  }

  set piketkm(String newPiketkm) {
    if ((newPiketkm?.length ?? 0) <= 255) {
      _piketkm = newPiketkm;
    }
  }

  set coordinate(String newCoordinate) {
    if ((newCoordinate?.length ?? 0) <= 255) {
      _coordinate = newCoordinate;
    }
  }

  set lengthpit(String newLengthpit) {
    if ((newLengthpit?.length ?? 0) <= 255) {
      _lengthpit = newLengthpit;
    }
  }

  set depthpit(String newDepthpit) {
    if ((newDepthpit?.length ?? 0) <= 255) {
      _depthpit = newDepthpit;
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

  set diameter(String newdiameter) {
    if ((newdiameter?.length ?? 0) <= 255) {
      _diameter = newdiameter;
    }
  }

  set thickpipe(String newthickpipe) {
    if ((newthickpipe?.length ?? 0) <= 255) {
      _thickpipe = newthickpipe;
    }
  }

  set gradesteel(String newgradesteel) {
    if ((newgradesteel?.length ?? 0) <= 255) {
      _gradesteel = newgradesteel;
    }
  }

  set metalldamage(String newmetalldamage) {
    if ((newmetalldamage?.length ?? 0) <= 255) {
      _metalldamage = newmetalldamage;
    }
  }

  set charmetdamage(String newcharmetdamage) {
    if ((newcharmetdamage?.length ?? 0) <= 255) {
      _charmetdamage = newcharmetdamage;
    }
  }

  set locmetdamage(String newlocmetdamage) {
    if ((newlocmetdamage?.length ?? 0) <= 255) {
      _locmetdamage = newlocmetdamage;
    }
  }

  set sizemetdamage(String newsizemetdamage) {
    if ((newsizemetdamage?.length ?? 0) <= 255) {
      _sizemetdamage = newsizemetdamage;
    }
  }

  set typeinsul(String newtypeinsul) {
    if ((newtypeinsul?.length ?? 0) <= 255) {
      _typeinsul = newtypeinsul;
    }
  }

  set insuladhes(String newinsuladhes) {
    if ((newinsuladhes?.length ?? 0) <= 255) {
      _insuladhes = newinsuladhes;
    }
  }

  set insulcharadhes(String newinsulcharadhes) {
    if ((newinsulcharadhes?.length ?? 0) <= 255) {
      _insulcharadhes = newinsulcharadhes;
    }
  }

  set insulcondit(String newinsulcondit) {
    if ((newinsulcondit?.length ?? 0) <= 255) {
      _insulcondit = newinsulcondit;
    }
  }

  set thickinsul(String newthickinsul) {
    if ((newthickinsul?.length ?? 0) <= 255) {
      _thickinsul = newthickinsul;
    }
  }

  set insuldamage(String newinsuldamage) {
    if ((newinsuldamage?.length ?? 0) <= 255) {
      _insuldamage = newinsuldamage;
    }
  }

  set charinsuldamage(String newcharinsuldamage) {
    if ((newcharinsuldamage?.length ?? 0) <= 255) {
      _charinsuldamage = newcharinsuldamage;
    }
  }

  set locinsuldamage(String newlocinsuldamage) {
    if ((newlocinsuldamage?.length ?? 0) <= 255) {
      _locinsuldamage = newlocinsuldamage;
    }
  }

  set sizeinsuldamage(String newsizeinsuldamage) {
    if ((newsizeinsuldamage?.length ?? 0) <= 255) {
      _sizeinsuldamage = newsizeinsuldamage;
    }
  }

  set typeinsulrest(String newtypeinsulrest) {
    if ((newtypeinsulrest?.length ?? 0) <= 255) {
      _typeinsulrest = newtypeinsulrest;
    }
  }

  set insuladhesrest(String newinsuladhesrest) {
    if ((newinsuladhesrest?.length ?? 0) <= 255) {
      _insuladhesrest = newinsuladhesrest;
    }
  }

  set thickinsulrest(String newthickinsulrest) {
    if ((newthickinsulrest?.length ?? 0) <= 255) {
      _thickinsulrest = newthickinsulrest;
    }
  }

  set contininsulrest(String newcontininsulrest) {
    if ((newcontininsulrest?.length ?? 0) <= 255) {
      _contininsulrest = newcontininsulrest;
    }
  }

  set tickinsulmeter(String newtickinsulmeter) {
    if ((newtickinsulmeter?.length ?? 0) <= 255) {
      _tickinsulmeter = newtickinsulmeter;
    }
  }

  set tickmetallmeter(String newtickmetallmeter) {
    if ((newtickmetallmeter?.length ?? 0) <= 255) {
      _tickmetallmeter = newtickmetallmeter;
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

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = _title;
    map['piketkm'] = _piketkm;
    map['coordinate'] = _coordinate;
    map['lengthpit'] = _lengthpit;
    map['depthpit'] = _depthpit;
    map['osnovanie'] = _osnovanie;
    map['date'] = _date;
    map['description'] = _description;

    map['diameter'] = _diameter;
    map['thickpipe'] = _thickpipe;
    map['gradesteel'] = _gradesteel;
    map['metalldamage'] = _metalldamage;
    map['charmetdamage'] = _charmetdamage;
    map['locmetdamage'] = _locmetdamage;
    map['sizemetdamage'] = _sizemetdamage;

    map['typeinsul'] = _typeinsul;
    map['insuladhes'] = _insuladhes;
    map['insulcharadhes'] = _insulcharadhes;
    map['insulcondit'] = _insulcondit;
    map['thickinsul'] = _thickinsul;
    map['insuldamage'] = _insuldamage;
    map['charinsuldamage'] = _charinsuldamage;
    map['locinsuldamage'] = _locinsuldamage;
    map['sizeinsuldamage'] = _sizeinsuldamage;
    map['typeinsulrest'] = _typeinsulrest;
    map['insuladhesrest'] = _insuladhesrest;
    map['thickinsulrest'] = _thickinsulrest;
    map['contininsulrest'] = _contininsulrest;
    map['tickinsulmeter'] = _tickinsulmeter;
    map['tickmetallmeter'] = _tickmetallmeter;
    map['adhesmeter'] = _adhesmeter;
    map['continmeter'] = _continmeter;
    map['setvik'] = _setvik;

    map['photo'] = _photo;

    map['photometdef1'] = _photometdef1;
    map['photometdef2'] = _photometdef2;
    map['photometdef3'] = _photometdef3;
    map['photometdef4'] = _photometdef4;
    map['photometdef5'] = _photometdef5;
    map['photometdef6'] = _photometdef6;
    map['photometdef7'] = _photometdef7;
    map['photometdef8'] = _photometdef8;
    map['photometdef9'] = _photometdef9;
    map['photometdef10'] = _photometdef10;
    map['photoinsuldef1'] = _photoinsuldef1;
    map['photoinsuldef2'] = _photoinsuldef2;
    map['photoinsuldef3'] = _photoinsuldef3;
    map['photoinsuldef4'] = _photoinsuldef4;
    map['photoinsuldef5'] = _photoinsuldef5;
    map['photoinsuldef6'] = _photoinsuldef6;
    map['photoinsuldef7'] = _photoinsuldef7;
    map['photoinsuldef8'] = _photoinsuldef8;
    map['photoinsuldef9'] = _photoinsuldef9;
    map['photoinsuldef10'] = _photoinsuldef10;
    map['photorest'] = _photorest;
    map['photodesc'] = _photodesc;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _id = o['id'];
    _title = o['title'];
    _piketkm = o['piketkm'];
    _coordinate = o['coordinate'];
    _lengthpit = o['lengthpit'];
    _depthpit = o['depthpit'];
    _osnovanie = o['osnovanie'];
    _date = o['date'];
    _description = o['description'];

    _diameter = o['diameter'];
    _thickpipe = o['thickpipe'];
    _gradesteel = o['gradesteel'];
    _metalldamage = o['metalldamage'];
    _charmetdamage = o['charmetdamage'];
    _locmetdamage = o['locmetdamage'];
    _sizemetdamage = o['sizemetdamage'];

    _typeinsul = o['typeinsul'];
    _insuladhes = o['insuladhes'];
    _insulcharadhes = o['insulcharadhes'];
    _insulcondit = o['insulcondit'];
    _thickinsul = o['thickinsul'];
    _insuldamage = o['insuldamage'];
    _charinsuldamage = o['charinsuldamage'];
    _locinsuldamage = o['locinsuldamage'];
    _sizeinsuldamage = o['sizeinsuldamage'];
    _typeinsulrest = o['typeinsulrest'];
    _insuladhesrest = o['insuladhesrest'];
    _thickinsulrest = o['thickinsulrest'];
    _contininsulrest = o['contininsulrest'];
    _tickinsulmeter = o['tickinsulmeter'];
    _tickmetallmeter = o['tickmetallmeter'];
    _adhesmeter = o['adhesmeter'];
    _continmeter = o['continmeter'];
    _setvik = o['setvik'];
    _photo = o['photo'];

    _photometdef1 = o['photometdef1'];
    _photometdef2 = o['photometdef2'];
    _photometdef3 = o['photometdef3'];
    _photometdef4 = o['photometdef4'];
    _photometdef5 = o['photometdef5'];
    _photometdef6 = o['photometdef6'];
    _photometdef7 = o['photometdef7'];
    _photometdef8 = o['photometdef8'];
    _photometdef9 = o['photometdef9'];
    _photometdef10 = o['photometdef10'];
    _photoinsuldef1 = o['photoinsuldef1'];
    _photoinsuldef2 = o['photoinsuldef2'];
    _photoinsuldef3 = o['photoinsuldef3'];
    _photoinsuldef4 = o['photoinsuldef4'];
    _photoinsuldef5 = o['photoinsuldef5'];
    _photoinsuldef6 = o['photoinsuldef6'];
    _photoinsuldef7 = o['photoinsuldef7'];
    _photoinsuldef8 = o['photoinsuldef8'];
    _photoinsuldef9 = o['photoinsuldef9'];
    _photoinsuldef10 = o['photoinsuldef10'];
    _photorest = o['photorest'];
    _photodesc = o['photodesc'];
  }
}
