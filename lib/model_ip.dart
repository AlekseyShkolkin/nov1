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
  String _potencial;
  String _soprgrunt;

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

  String _charmetdamage1;
  String _locmetdamage1;
  String _sizemetdamage1;

  String _charmetdamage2;
  String _locmetdamage2;
  String _sizemetdamage2;

  String _charmetdamage3;
  String _locmetdamage3;
  String _sizemetdamage3;

  String _typeinsul;
  String _insuladhes;
  String _insulcharadhes;
  String _insulcondit;
  String _thickinsul;

  String _insuldamage;

  String _charinsuldamage1;
  String _locinsuldamage1;
  String _sizeinsuldamage1;

  String _charinsuldamage2;
  String _locinsuldamage2;
  String _sizeinsuldamage2;

  String _charinsuldamage3;
  String _locinsuldamage3;
  String _sizeinsuldamage3;

  String _tempair; //температура воздуха
  String _tempsurf; //температура поверхности
  String _relathumid; //относительная влажность
  String _dewpoint; //точка росы
  String _difftemp; //разница температур

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
  String _dateObsl;
  String _location;

  String _filial; //филиал
  String _dolzhnpredskom; //должность председателя комиссии
  String _fiopredskom; //фио председеателя комиссии
  String _dolzhnproizvrab; //должность производителя работ
  String _fioproizvrab; //фио производителя работ
  String _dolzhnnachuchastka; //должность начальника участка
  String _fionachuchastka; //фио начальника участка
  String _dolzhnpredstzakazch; //должность представителя заказчика
  String _fiopredstzakazch; //фио представителя заказчика
  String _dolzhnpredstzakazchSK; //должность представителя заказчика по СК
  String _fiopredstzakazchSK; //фио представителя заказчика
  String _dolzhnpredststroitSK; //должность представителя строителя по СК
  String _fiopredststroitSK; //фио представителя строителя по СК
  String _dolzhnpredststroit; //должность представителя строителя
  String _fiopredststroit; //фио представителя строителя
  String _dolzhndruglic; //должность других лиц
  String _fiodruglic; //фио других лиц

  Todo(
    this._title,
    this._date, [
    this._soprgrunt,
    this._potencial,
    this._location,
    this._dateObsl,
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
    this._charmetdamage1,
    this._locmetdamage1,
    this._sizemetdamage1,
    this._charmetdamage2,
    this._locmetdamage2,
    this._sizemetdamage2,
    this._charmetdamage3,
    this._locmetdamage3,
    this._sizemetdamage3,
    this._typeinsul,
    this._insuladhes,
    this._insulcharadhes,
    this._insulcondit,
    this._thickinsul,
    this._insuldamage,
    this._charinsuldamage1,
    this._locinsuldamage1,
    this._sizeinsuldamage1,
    this._charinsuldamage2,
    this._locinsuldamage2,
    this._sizeinsuldamage2,
    this._charinsuldamage3,
    this._locinsuldamage3,
    this._sizeinsuldamage3,
    this._tempair,
    this._tempsurf,
    this._relathumid,
    this._dewpoint,
    this._difftemp,
    this._typeinsulrest,
    this._insuladhesrest,
    this._thickinsulrest,
    this._contininsulrest,
    this._tickinsulmeter,
    this._tickmetallmeter,
    this._adhesmeter,
    this._continmeter,
    this._setvik,
    this._filial,
    this._dolzhnpredskom,
    this._fiopredskom,
    this._dolzhnproizvrab,
    this._fioproizvrab,
    this._dolzhnnachuchastka,
    this._fionachuchastka,
    this._dolzhnpredstzakazch,
    this._fiopredstzakazch,
    this._dolzhnpredstzakazchSK,
    this._fiopredstzakazchSK,
    this._dolzhnpredststroitSK,
    this._fiopredststroitSK,
    this._dolzhnpredststroit,
    this._fiopredststroit,
    this._dolzhndruglic,
    this._fiodruglic,
  ]);

  Todo.withId(
    this._id,
    this._title,
    this._date, [
    this._soprgrunt,
    this._potencial,
    this._location,
    this._dateObsl,
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
    this._charmetdamage1,
    this._locmetdamage1,
    this._sizemetdamage1,
    this._charmetdamage2,
    this._locmetdamage2,
    this._sizemetdamage2,
    this._charmetdamage3,
    this._locmetdamage3,
    this._sizemetdamage3,
    this._typeinsul,
    this._insuladhes,
    this._insulcharadhes,
    this._insulcondit,
    this._thickinsul,
    this._insuldamage,
    this._charinsuldamage1,
    this._locinsuldamage1,
    this._sizeinsuldamage1,
    this._charinsuldamage2,
    this._locinsuldamage2,
    this._sizeinsuldamage2,
    this._charinsuldamage3,
    this._locinsuldamage3,
    this._sizeinsuldamage3,
    this._tempair,
    this._tempsurf,
    this._relathumid,
    this._dewpoint,
    this._difftemp,
    this._typeinsulrest,
    this._insuladhesrest,
    this._thickinsulrest,
    this._contininsulrest,
    this._tickinsulmeter,
    this._tickmetallmeter,
    this._adhesmeter,
    this._continmeter,
    this._setvik,
    this._filial,
    this._dolzhnpredskom,
    this._fiopredskom,
    this._dolzhnproizvrab,
    this._fioproizvrab,
    this._dolzhnnachuchastka,
    this._fionachuchastka,
    this._dolzhnpredstzakazch,
    this._fiopredstzakazch,
    this._dolzhnpredstzakazchSK,
    this._fiopredstzakazchSK,
    this._dolzhnpredststroitSK,
    this._fiopredststroitSK,
    this._dolzhnpredststroit,
    this._fiopredststroit,
    this._dolzhndruglic,
    this._fiodruglic,
  ]);

  int get id => _id;

  String get potencial => _potencial;
  String get soprgrunt => _soprgrunt;

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
  String get dateObsl => _dateObsl;
  String get location => _location;
  String get description => _description;

  String get diameter => _diameter;
  String get thickpipe => _thickpipe;
  String get gradesteel => _gradesteel;
  String get metalldamage => _metalldamage;

  String get charmetdamage1 => _charmetdamage1;
  String get locmetdamage1 => _locmetdamage1;
  String get sizemetdamage1 => _sizemetdamage1;

  String get charmetdamage2 => _charmetdamage2;
  String get locmetdamage2 => _locmetdamage2;
  String get sizemetdamage2 => _sizemetdamage2;

  String get charmetdamage3 => _charmetdamage3;
  String get locmetdamage3 => _locmetdamage3;
  String get sizemetdamage3 => _sizemetdamage3;

  String get typeinsul => _typeinsul;
  String get insuladhes => _insuladhes;
  String get insulcharadhes => _insulcharadhes;
  String get insulcondit => _insulcondit;
  String get thickinsul => _thickinsul;
  String get insuldamage => _insuldamage;

  String get charinsuldamage1 => _charinsuldamage1;
  String get locinsuldamage1 => _locinsuldamage1;
  String get sizeinsuldamage1 => _sizeinsuldamage1;

  String get charinsuldamage2 => _charinsuldamage2;
  String get locinsuldamage2 => _locinsuldamage2;
  String get sizeinsuldamage2 => _sizeinsuldamage2;

  String get charinsuldamage3 => _charinsuldamage3;
  String get locinsuldamage3 => _locinsuldamage3;
  String get sizeinsuldamage3 => _sizeinsuldamage3;

  String get tempair => _tempair;
  String get tempsurf => _tempsurf;
  String get relathumid => _relathumid;
  String get dewpoint => _dewpoint;
  String get difftemp => _difftemp;

  String get typeinsulrest => _typeinsulrest;
  String get insuladhesrest => _insuladhesrest;
  String get thickinsulrest => _thickinsulrest;
  String get contininsulrest => _contininsulrest;
  String get tickinsulmeter => _tickinsulmeter;
  String get tickmetallmeter => _tickmetallmeter;
  String get adhesmeter => _adhesmeter;
  String get continmeter => _continmeter;
  String get setvik => _setvik;

  String get filial => _filial;
  String get dolzhnpredskom => _dolzhnpredskom;
  String get fiopredskom => _fiopredskom;
  String get dolzhnproizvrab => _dolzhnproizvrab;
  String get fioproizvrab => _fioproizvrab;
  String get dolzhnnachuchastka => _dolzhnnachuchastka;
  String get fionachuchastka => _fionachuchastka;
  String get dolzhnpredstzakazch => _dolzhnpredstzakazch;
  String get fiopredstzakazch => _fiopredstzakazch;
  String get dolzhnpredstzakazchSK => _dolzhnpredstzakazchSK;
  String get fiopredstzakazchSK => _fiopredstzakazchSK;
  String get dolzhnpredststroitSK => _dolzhnpredststroitSK;
  String get fiopredststroitSK => _fiopredststroitSK;
  String get dolzhnpredststroit => _dolzhnpredststroit;
  String get fiopredststroit => _fiopredststroit;
  String get dolzhndruglic => _dolzhndruglic;
  String get fiodruglic => _fiodruglic;

  set title(String newTitle) {
    if ((newTitle?.length ?? 0) <= 255) {
      _title = newTitle;
    }
  }

  set location(String newlocation) {
    if ((newlocation?.length ?? 0) <= 255) {
      _location = newlocation;
    }
  }

  set potencial(String newpotencial) {
    if ((newpotencial?.length ?? 0) <= 255) {
      _potencial = newpotencial;
    }
  }

  set soprgrunt(String newsoprgrunt) {
    if ((newsoprgrunt?.length ?? 0) <= 255) {
      _soprgrunt = newsoprgrunt;
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

  // set dateObsl(newDateObsl) {
  //   _dateObsl = newDateObsl;
  // }

  set dateObsl(String newdateObsl) {
    if ((newdateObsl?.length ?? 0) <= 255) {
      _dateObsl = newdateObsl;
    }
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

  set charmetdamage1(String newcharmetdamage1) {
    if ((newcharmetdamage1?.length ?? 0) <= 255) {
      _charmetdamage1 = newcharmetdamage1;
    }
  }

  set locmetdamage1(String newlocmetdamage1) {
    if ((newlocmetdamage1?.length ?? 0) <= 255) {
      _locmetdamage1 = newlocmetdamage1;
    }
  }

  set sizemetdamage1(String newsizemetdamage1) {
    if ((newsizemetdamage1?.length ?? 0) <= 255) {
      _sizemetdamage1 = newsizemetdamage1;
    }
  }

  set charmetdamage2(String newcharmetdamage2) {
    if ((newcharmetdamage2?.length ?? 0) <= 255) {
      _charmetdamage2 = newcharmetdamage2;
    }
  }

  set locmetdamage2(String newlocmetdamage2) {
    if ((newlocmetdamage2?.length ?? 0) <= 255) {
      _locmetdamage2 = newlocmetdamage2;
    }
  }

  set sizemetdamage2(String newsizemetdamage2) {
    if ((newsizemetdamage2?.length ?? 0) <= 255) {
      _sizemetdamage2 = newsizemetdamage2;
    }
  }

  set charmetdamage3(String newcharmetdamage3) {
    if ((newcharmetdamage3?.length ?? 0) <= 255) {
      _charmetdamage3 = newcharmetdamage3;
    }
  }

  set locmetdamage3(String newlocmetdamage3) {
    if ((newlocmetdamage3?.length ?? 0) <= 255) {
      _locmetdamage3 = newlocmetdamage3;
    }
  }

  set sizemetdamage3(String newsizemetdamage3) {
    if ((newsizemetdamage3?.length ?? 0) <= 255) {
      _sizemetdamage3 = newsizemetdamage3;
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

  set charinsuldamage1(String newcharinsuldamage1) {
    if ((newcharinsuldamage1?.length ?? 0) <= 255) {
      _charinsuldamage1 = newcharinsuldamage1;
    }
  }

  set locinsuldamage1(String newlocinsuldamage1) {
    if ((newlocinsuldamage1?.length ?? 0) <= 255) {
      _locinsuldamage1 = newlocinsuldamage1;
    }
  }

  set sizeinsuldamage1(String newsizeinsuldamage1) {
    if ((newsizeinsuldamage1?.length ?? 0) <= 255) {
      _sizeinsuldamage1 = newsizeinsuldamage1;
    }
  }

  set charinsuldamage2(String newcharinsuldamage2) {
    if ((newcharinsuldamage2?.length ?? 0) <= 255) {
      _charinsuldamage2 = newcharinsuldamage2;
    }
  }

  set locinsuldamage2(String newlocinsuldamage2) {
    if ((newlocinsuldamage2?.length ?? 0) <= 255) {
      _locinsuldamage2 = newlocinsuldamage2;
    }
  }

  set sizeinsuldamage2(String newsizeinsuldamage2) {
    if ((newsizeinsuldamage2?.length ?? 0) <= 255) {
      _sizeinsuldamage2 = newsizeinsuldamage2;
    }
  }

  set charinsuldamage3(String newcharinsuldamage3) {
    if ((newcharinsuldamage3?.length ?? 0) <= 255) {
      _charinsuldamage3 = newcharinsuldamage3;
    }
  }

  set locinsuldamage3(String newlocinsuldamage3) {
    if ((newlocinsuldamage3?.length ?? 0) <= 255) {
      _locinsuldamage3 = newlocinsuldamage3;
    }
  }

  set sizeinsuldamage3(String newsizeinsuldamage3) {
    if ((newsizeinsuldamage3?.length ?? 0) <= 255) {
      _sizeinsuldamage3 = newsizeinsuldamage3;
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

  set filial(String newfilial) {
    if ((newfilial?.length ?? 0) <= 255) {
      _filial = newfilial;
    }
  }

  set dolzhnpredskom(String newdolzhnpredskom) {
    if ((newdolzhnpredskom?.length ?? 0) <= 255) {
      _dolzhnpredskom = newdolzhnpredskom;
    }
  }

  set fiopredskom(String newfiopredskom) {
    if ((newfiopredskom?.length ?? 0) <= 255) {
      _fiopredskom = newfiopredskom;
    }
  }

  set dolzhnproizvrab(String newdolzhnproizvrab) {
    if ((newdolzhnproizvrab?.length ?? 0) <= 255) {
      _dolzhnproizvrab = newdolzhnproizvrab;
    }
  }

  set fioproizvrab(String newfioproizvrab) {
    if ((newfioproizvrab?.length ?? 0) <= 255) {
      _fioproizvrab = newfioproizvrab;
    }
  }

  set dolzhnnachuchastka(String newdolzhnnachuchastka) {
    if ((newdolzhnnachuchastka?.length ?? 0) <= 255) {
      _dolzhnnachuchastka = newdolzhnnachuchastka;
    }
  }

  set fionachuchastka(String newfionachuchastka) {
    if ((newfionachuchastka?.length ?? 0) <= 255) {
      _fionachuchastka = newfionachuchastka;
    }
  }

  set dolzhnpredstzakazch(String newdolzhnpredstzakazch) {
    if ((newdolzhnpredstzakazch?.length ?? 0) <= 255) {
      _dolzhnpredstzakazch = newdolzhnpredstzakazch;
    }
  }

  set fiopredstzakazch(String newfiopredstzakazch) {
    if ((newfiopredstzakazch?.length ?? 0) <= 255) {
      _fiopredstzakazch = newfiopredstzakazch;
    }
  }

  set dolzhnpredstzakazchSK(String newdolzhnpredstzakazchSK) {
    if ((newdolzhnpredstzakazchSK?.length ?? 0) <= 255) {
      _dolzhnpredstzakazchSK = newdolzhnpredstzakazchSK;
    }
  }

  set fiopredstzakazchSK(String newfiopredstzakazchSK) {
    if ((newfiopredstzakazchSK?.length ?? 0) <= 255) {
      _fiopredstzakazchSK = newfiopredstzakazchSK;
    }
  }

  set dolzhnpredststroitSK(String newdolzhnpredststroitSK) {
    if ((newdolzhnpredststroitSK?.length ?? 0) <= 255) {
      _dolzhnpredststroitSK = newdolzhnpredststroitSK;
    }
  }

  set fiopredststroitSK(String newfiopredststroitSK) {
    if ((newfiopredststroitSK?.length ?? 0) <= 255) {
      _fiopredststroitSK = newfiopredststroitSK;
    }
  }

  set dolzhnpredststroit(String newdolzhnpredststroit) {
    if ((newdolzhnpredststroit?.length ?? 0) <= 255) {
      _dolzhnpredststroit = newdolzhnpredststroit;
    }
  }

  set fiopredststroit(String newfiopredststroit) {
    if ((newfiopredststroit?.length ?? 0) <= 255) {
      _fiopredststroit = newfiopredststroit;
    }
  }

  set dolzhndruglic(String newdolzhndruglic) {
    if ((newdolzhndruglic?.length ?? 0) <= 255) {
      _dolzhndruglic = newdolzhndruglic;
    }
  }

  set fiodruglic(String newfiodruglic) {
    if ((newfiodruglic?.length ?? 0) <= 255) {
      _fiodruglic = newfiodruglic;
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['title'] = _title;
    map['location'] = _location;
    map['potencial'] = _potencial;
    map['soprgrunt'] = _soprgrunt;
    map['piketkm'] = _piketkm;
    map['coordinate'] = _coordinate;
    map['lengthpit'] = _lengthpit;
    map['depthpit'] = _depthpit;
    map['osnovanie'] = _osnovanie;
    map['date'] = _date;
    map['dateObsl'] = _dateObsl;
    map['description'] = _description;

    map['diameter'] = _diameter;
    map['thickpipe'] = _thickpipe;
    map['gradesteel'] = _gradesteel;
    map['metalldamage'] = _metalldamage;
    map['charmetdamage1'] = _charmetdamage1;
    map['locmetdamage1'] = _locmetdamage1;
    map['sizemetdamage1'] = _sizemetdamage1;

    map['charmetdamage2'] = _charmetdamage2;
    map['locmetdamage2'] = _locmetdamage2;
    map['sizemetdamage2'] = _sizemetdamage2;

    map['charmetdamage3'] = _charmetdamage3;
    map['locmetdamage3'] = _locmetdamage3;
    map['sizemetdamage3'] = _sizemetdamage3;

    map['typeinsul'] = _typeinsul;
    map['insuladhes'] = _insuladhes;
    map['insulcharadhes'] = _insulcharadhes;
    map['insulcondit'] = _insulcondit;
    map['thickinsul'] = _thickinsul;
    map['insuldamage'] = _insuldamage;
    map['charinsuldamage1'] = _charinsuldamage1;
    map['locinsuldamage1'] = _locinsuldamage1;
    map['sizeinsuldamage1'] = _sizeinsuldamage1;

    map['charinsuldamage2'] = _charinsuldamage2;
    map['locinsuldamage2'] = _locinsuldamage2;
    map['sizeinsuldamage2'] = _sizeinsuldamage2;

    map['charinsuldamage3'] = _charinsuldamage3;
    map['locinsuldamage3'] = _locinsuldamage3;
    map['sizeinsuldamage3'] = _sizeinsuldamage3;

    map['tempair'] = _tempair;
    map['tempsurf'] = _tempsurf;
    map['relathumid'] = _relathumid;
    map['dewpoint'] = _dewpoint;
    map['difftemp'] = _difftemp;

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

    map['filial '] = _filial;
    map['dolzhnpredskom '] = _dolzhnpredskom;
    map['fiopredskom '] = _fiopredskom;
    map['dolzhnproizvrab '] = _dolzhnproizvrab;
    map['fioproizvrab '] = _fioproizvrab;
    map['dolzhnnachuchastka '] = _dolzhnnachuchastka;
    map['fionachuchastka '] = _fionachuchastka;
    map['dolzhnpredstzakazch '] = _dolzhnpredstzakazch;
    map['fiopredstzakazch '] = _fiopredstzakazch;
    map['dolzhnpredstzakazchSK '] = _dolzhnpredstzakazchSK;
    map['fiopredstzakazchSK '] = _fiopredstzakazchSK;
    map['dolzhnpredststroitSK '] = _dolzhnpredststroitSK;
    map['fiopredststroitSK '] = _fiopredststroitSK;
    map['dolzhnpredststroit '] = _dolzhnpredststroit;
    map['fiopredststroit '] = _fiopredststroit;
    map['dolzhndruglic '] = _dolzhndruglic;
    map['fiodruglic '] = _fiodruglic;

    if (_id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Todo.fromObject(dynamic o) {
    _id = o['id'];
    _title = o['title'];
    _location = o['location'];
    _potencial = o['potencial'];
    _soprgrunt = o['soprgrunt'];
    _piketkm = o['piketkm'];
    _coordinate = o['coordinate'];
    _lengthpit = o['lengthpit'];
    _depthpit = o['depthpit'];
    _osnovanie = o['osnovanie'];
    _date = o['date'];
    _dateObsl = o['dateObsl'];
    _description = o['description'];

    _diameter = o['diameter'];
    _thickpipe = o['thickpipe'];
    _gradesteel = o['gradesteel'];
    _metalldamage = o['metalldamage'];

    _charmetdamage1 = o['charmetdamage1'];
    _locmetdamage1 = o['locmetdamage1'];
    _sizemetdamage1 = o['sizemetdamage1'];

    _charmetdamage2 = o['charmetdamage2'];
    _locmetdamage2 = o['locmetdamage2'];
    _sizemetdamage2 = o['sizemetdamage2'];

    _charmetdamage3 = o['charmetdamage3'];
    _locmetdamage3 = o['locmetdamage3'];
    _sizemetdamage3 = o['sizemetdamage3'];

    _typeinsul = o['typeinsul'];
    _insuladhes = o['insuladhes'];
    _insulcharadhes = o['insulcharadhes'];
    _insulcondit = o['insulcondit'];
    _thickinsul = o['thickinsul'];
    _insuldamage = o['insuldamage'];
    _charinsuldamage1 = o['charinsuldamage1'];
    _locinsuldamage1 = o['locinsuldamage1'];
    _sizeinsuldamage1 = o['sizeinsuldamage1'];

    _charinsuldamage2 = o['charinsuldamage2'];
    _locinsuldamage2 = o['locinsuldamage2'];
    _sizeinsuldamage2 = o['sizeinsuldamage2'];

    _charinsuldamage3 = o['charinsuldamage3'];
    _locinsuldamage3 = o['locinsuldamage3'];
    _sizeinsuldamage3 = o['sizeinsuldamage3'];

    _tempair = o['tempair'];
    _tempsurf = o['tempsurf'];
    _relathumid = o['relathumid'];
    _dewpoint = o['dewpoint'];
    _difftemp = o['difftemp'];

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

    _filial = o['filial'];
    _dolzhnpredskom = o['dolzhnpredskom'];
    _fiopredskom = o['fiopredskom'];
    _dolzhnproizvrab = o['dolzhnproizvrab'];
    _fioproizvrab = o['fioproizvrab'];
    _dolzhnnachuchastka = o['dolzhnnachuchastka'];
    _fionachuchastka = o['fionachuchastka'];
    _dolzhnpredstzakazch = o['dolzhnpredstzakazch'];
    _fiopredstzakazch = o['fiopredstzakazch'];
    _dolzhnpredstzakazchSK = o['dolzhnpredstzakazchSK'];
    _fiopredstzakazchSK = o['fiopredstzakazchSK'];
    _dolzhnpredststroitSK = o['dolzhnpredststroitSK'];
    _fiopredststroitSK = o['fiopredststroitSK'];
    _dolzhnpredststroit = o['dolzhnpredststroit'];
    _fiopredststroit = o['fiopredststroit'];
    _dolzhndruglic = o['dolzhndruglic'];
    _fiodruglic = o['fiodruglic'];
  }
}
