import 'dart:convert';

/// result : "true"
/// msg : "Blood Sugar Levels List"
/// date : [{"id":"1","user_id":"1","concentration":"12","date":"7585","hour":"7557","measure":"Before Lunch","remark":"gg","date_time":"2023-10-14 15:18:03"},{"id":"2","user_id":"1","concentration":"13456","date":"75853","hour":"75575","measure":"After Lunch","remark":"gghj","date_time":"2023-10-14 15:27:01"},{"id":"3","user_id":"1","concentration":"13456665","date":"75853","hour":"75575","measure":"Before Breakfast","remark":"gghj","date_time":"2023-10-14 15:28:36"},{"id":"4","user_id":"1","concentration":"16","date":"75853","hour":"75575","measure":"Before Breakfast","remark":"gghj","date_time":"2023-10-14 15:41:50"},{"id":"5","user_id":"1","concentration":"48","date":"75853","hour":"75575","measure":"Before Breakfast","remark":"gghj","date_time":"2023-10-14 16:31:04"},{"id":"6","user_id":"1","concentration":"48","date":"75853","hour":"75575","measure":"Before Breakfast","remark":"gghj","date_time":"2023-10-14 16:31:40"},{"id":"7","user_id":"1","concentration":"1510","date":"1510","hour":"105","measure":"After Lunch","remark":"gshs","date_time":"2023-10-14 16:48:39"},{"id":"8","user_id":"1","concentration":"25588","date":"088","hour":"88","measure":"Before Breakfast","remark":"ghj","date_time":"2023-10-14 17:38:45"}]

Qwe qweFromJson(String str) => Qwe.fromJson(json.decode(str));
String qweToJson(Qwe data) => json.encode(data.toJson());

class Qwe {
  Qwe({
    String? result,
    String? msg,
    List<Date>? date,
  }) {
    _result = result;
    _msg = msg;
    _date = date;
  }

  Qwe.fromJson(dynamic json) {
    _result = json['result'];
    _msg = json['msg'];
    if (json['date'] != null) {
      _date = [];
      json['date'].forEach((v) {
        _date?.add(Date.fromJson(v));
      });
    }
  }
  String? _result;
  String? _msg;
  List<Date>? _date;
  Qwe copyWith({
    String? result,
    String? msg,
    List<Date>? date,
  }) =>
      Qwe(
        result: result ?? _result,
        msg: msg ?? _msg,
        date: date ?? _date,
      );
  String? get result => _result;
  String? get msg => _msg;
  List<Date>? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['msg'] = _msg;
    if (_date != null) {
      map['date'] = _date?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "1"
/// user_id : "1"
/// concentration : "12"
/// date : "7585"
/// hour : "7557"
/// measure : "Before Lunch"
/// remark : "gg"
/// date_time : "2023-10-14 15:18:03"

Date dateFromJson(String str) => Date.fromJson(json.decode(str));
String dateToJson(Date data) => json.encode(data.toJson());

class Date {
  Date({
    String? id,
    String? userId,
    String? concentration,
    String? date,
    String? hour,
    String? measure,
    String? remark,
    String? dateTime,
  }) {
    _id = id;
    _userId = userId;
    _concentration = concentration;
    _date = date;
    _hour = hour;
    _measure = measure;
    _remark = remark;
    _dateTime = dateTime;
  }

  Date.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _concentration = json['concentration'];
    _date = json['date'];
    _hour = json['hour'];
    _measure = json['measure'];
    _remark = json['remark'];
    _dateTime = json['date_time'];
  }
  String? _id;
  String? _userId;
  String? _concentration;
  String? _date;
  String? _hour;
  String? _measure;
  String? _remark;
  String? _dateTime;
  Date copyWith({
    String? id,
    String? userId,
    String? concentration,
    String? date,
    String? hour,
    String? measure,
    String? remark,
    String? dateTime,
  }) =>
      Date(
        id: id ?? _id,
        userId: userId ?? _userId,
        concentration: concentration ?? _concentration,
        date: date ?? _date,
        hour: hour ?? _hour,
        measure: measure ?? _measure,
        remark: remark ?? _remark,
        dateTime: dateTime ?? _dateTime,
      );
  String? get id => _id;
  String? get userId => _userId;
  String? get concentration => _concentration;
  String? get date => _date;
  String? get hour => _hour;
  String? get measure => _measure;
  String? get remark => _remark;
  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['concentration'] = _concentration;
    map['date'] = _date;
    map['hour'] = _hour;
    map['measure'] = _measure;
    map['remark'] = _remark;
    map['date_time'] = _dateTime;
    return map;
  }
}
