import 'dart:convert';

/// result : "true"
/// msg : "Blood Pressure List"
/// date : [{"id":"1","user_id":"1","weight":"99","weight_2":"88","date":"88","hour":"88","created_at":"2023-10-13 12:32:32"},{"id":"2","user_id":"1","weight":"235","weight_2":"99","date":"8","hour":"85","created_at":"2023-10-14 15:50:07"},{"id":"3","user_id":"1","weight":"235","weight_2":"99","date":"8","hour":"85","created_at":"2023-10-14 15:50:09"},{"id":"4","user_id":"1","weight":"235","weight_2":"99","date":"8","hour":"85","created_at":"2023-10-14 15:50:12"},{"id":"5","user_id":"1","weight":"235","weight_2":"99","date":"8","hour":"85","created_at":"2023-10-14 15:50:14"}]

Mnb mnbFromJson(String str) => Mnb.fromJson(json.decode(str));
String mnbToJson(Mnb data) => json.encode(data.toJson());

class Mnb {
  Mnb({
    String? result,
    String? msg,
    List<Date>? date,
  }) {
    _result = result;
    _msg = msg;
    _date = date;
  }

  Mnb.fromJson(dynamic json) {
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
  Mnb copyWith({
    String? result,
    String? msg,
    List<Date>? date,
  }) =>
      Mnb(
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
/// weight : "99"
/// weight_2 : "88"
/// date : "88"
/// hour : "88"
/// created_at : "2023-10-13 12:32:32"

Date dateFromJson(String str) => Date.fromJson(json.decode(str));
String dateToJson(Date data) => json.encode(data.toJson());

class Date {
  Date({
    String? id,
    String? userId,
    String? weight,
    String? weight2,
    String? date,
    String? hour,
    String? createdAt,
  }) {
    _id = id;
    _userId = userId;
    _weight = weight;
    _weight2 = weight2;
    _date = date;
    _hour = hour;
    _createdAt = createdAt;
  }

  Date.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _weight = json['weight'];
    _weight2 = json['weight_2'];
    _date = json['date'];
    _hour = json['hour'];
    _createdAt = json['created_at'];
  }
  String? _id;
  String? _userId;
  String? _weight;
  String? _weight2;
  String? _date;
  String? _hour;
  String? _createdAt;
  Date copyWith({
    String? id,
    String? userId,
    String? weight,
    String? weight2,
    String? date,
    String? hour,
    String? createdAt,
  }) =>
      Date(
        id: id ?? _id,
        userId: userId ?? _userId,
        weight: weight ?? _weight,
        weight2: weight2 ?? _weight2,
        date: date ?? _date,
        hour: hour ?? _hour,
        createdAt: createdAt ?? _createdAt,
      );
  String? get id => _id;
  String? get userId => _userId;
  String? get weight => _weight;
  String? get weight2 => _weight2;
  String? get date => _date;
  String? get hour => _hour;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['weight'] = _weight;
    map['weight_2'] = _weight2;
    map['date'] = _date;
    map['hour'] = _hour;
    map['created_at'] = _createdAt;
    return map;
  }
}
