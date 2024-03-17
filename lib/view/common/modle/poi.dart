import 'dart:convert';

/// result : "true"
/// msg : "Course Of HBA 1C List"
/// date : [{"id":"1","user_id":"1","hba_1c":"89","date":"88","hour":"88","created_at":"2023-10-13 12:31:59"},{"id":"2","user_id":"1","hba_1c":"2","date":"88","hour":"88","created_at":"2023-10-14 15:32:25"},{"id":"3","user_id":"1","hba_1c":"33","date":"88","hour":"88","created_at":"2023-10-14 15:42:49"},{"id":"4","user_id":"1","hba_1c":"35","date":"88","hour":"88","created_at":"2023-10-14 15:43:20"}]

Poi poiFromJson(String str) => Poi.fromJson(json.decode(str));
String poiToJson(Poi data) => json.encode(data.toJson());

class Poi {
  Poi({
    String? result,
    String? msg,
    List<Date>? date,
  }) {
    _result = result;
    _msg = msg;
    _date = date;
  }

  Poi.fromJson(dynamic json) {
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
  Poi copyWith({
    String? result,
    String? msg,
    List<Date>? date,
  }) =>
      Poi(
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
/// hba_1c : "89"
/// date : "88"
/// hour : "88"
/// created_at : "2023-10-13 12:31:59"

Date dateFromJson(String str) => Date.fromJson(json.decode(str));
String dateToJson(Date data) => json.encode(data.toJson());

class Date {
  Date({
    String? id,
    String? userId,
    String? hba1c,
    String? date,
    String? hour,
    String? createdAt,
  }) {
    _id = id;
    _userId = userId;
    _hba1c = hba1c;
    _date = date;
    _hour = hour;
    _createdAt = createdAt;
  }

  Date.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _hba1c = json['hba_1c'];
    _date = json['date'];
    _hour = json['hour'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _userId;
  String? _hba1c;
  String? _date;
  String? _hour;
  String? _createdAt;
  Date copyWith({
    String? id,
    String? userId,
    String? hba1c,
    String? date,
    String? hour,
    String? createdAt,
  }) =>
      Date(
        id: id ?? _id,
        userId: userId ?? _userId,
        hba1c: hba1c ?? _hba1c,
        date: date ?? _date,
        hour: hour ?? _hour,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get userId => _userId;
  String? get hba1c => _hba1c;
  String? get date => _date;
  String? get hour => _hour;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['hba_1c'] = _hba1c;
    map['date'] = _date;
    map['hour'] = _hour;
    map['created_at'] = _createdAt;
    return map;
  }
}
