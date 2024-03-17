import 'dart:convert';

/// result : "true"
/// msg : "Body Weights List"
/// date : [{"id":"1","user_id":"1","weight":"888","date":"88","hour":"08","created_at":"2023-10-13 12:34:24"},{"id":"2","user_id":"1","weight":"9656","date":"848","hour":"5545","created_at":"2023-10-14 15:43:58"},{"id":"3","user_id":"1","weight":"9765","date":"848848","hour":"554555","created_at":"2023-10-14 15:44:05"},{"id":"4","user_id":"1","weight":"976565","date":"848848","hour":"554555","created_at":"2023-10-14 15:44:11"},{"id":"5","user_id":"1","weight":"9765659","date":"848848","hour":"554555","created_at":"2023-10-14 15:44:14"},{"id":"6","user_id":"1","weight":"9765659","date":"848848","hour":"554555","created_at":"2023-10-14 15:44:19"}]

Rty rtyFromJson(String str) => Rty.fromJson(json.decode(str));
String rtyToJson(Rty data) => json.encode(data.toJson());

class Rty {
  Rty({
    String? result,
    String? msg,
    List<Date>? date,
  }) {
    _result = result;
    _msg = msg;
    _date = date;
  }

  Rty.fromJson(dynamic json) {
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
  Rty copyWith({
    String? result,
    String? msg,
    List<Date>? date,
  }) =>
      Rty(
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
/// weight : "888"
/// date : "88"
/// hour : "08"
/// created_at : "2023-10-13 12:34:24"

Date dateFromJson(String str) => Date.fromJson(json.decode(str));
String dateToJson(Date data) => json.encode(data.toJson());

class Date {
  Date({
    String? id,
    String? userId,
    String? weight,
    String? date,
    String? hour,
    String? createdAt,
  }) {
    _id = id;
    _userId = userId;
    _weight = weight;
    _date = date;
    _hour = hour;
    _createdAt = createdAt;
  }

  Date.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _weight = json['weight'];
    _date = json['date'];
    _hour = json['hour'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _userId;
  String? _weight;
  String? _date;
  String? _hour;
  String? _createdAt;
  Date copyWith({
    String? id,
    String? userId,
    String? weight,
    String? date,
    String? hour,
    String? createdAt,
  }) =>
      Date(
        id: id ?? _id,
        userId: userId ?? _userId,
        weight: weight ?? _weight,
        date: date ?? _date,
        hour: hour ?? _hour,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get userId => _userId;
  String? get weight => _weight;
  String? get date => _date;
  String? get hour => _hour;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['weight'] = _weight;
    map['date'] = _date;
    map['hour'] = _hour;
    map['created_at'] = _createdAt;
    return map;
  }
}
