import 'dart:convert';

/// result : "true"
/// msg : "All Time List"
/// data : [{"id":"2","start_time":"19:04","end_time":"20:02","date":"2023-10-10 00:00:00"},{"id":"3","start_time":"19:04","end_time":"20:02","date":"2023-10-10 00:00:00"},{"id":"4","start_time":"19:04","end_time":"20:02","date":"2023-10-10 00:00:00"},{"id":"5","start_time":"05:30","end_time":"12:20","date":"2023-10-10 19:35:17"},{"id":"6","start_time":"TimeOfDay(11:01)","end_time":"TimeOfDay(00:00)","date":"2023-10-11 11:01:25"},{"id":"7","start_time":"TimeOfDay(11:01)","end_time":"TimeOfDay(12:00)","date":"2023-10-11 11:03:06"},{"id":"8","start_time":"TimeOfDay(11:01)","end_time":"TimeOfDay(12:00)","date":"2023-10-11 11:07:15"},{"id":"9","start_time":"TimeOfDay(11:01)","end_time":"TimeOfDay(12:00)","date":"2023-10-11 11:08:39"},{"id":"10","start_time":"null","end_time":"null","date":"2023-10-11 11:30:43"}]

Gettimelist gettimelistFromJson(String str) =>
    Gettimelist.fromJson(json.decode(str));
String gettimelistToJson(Gettimelist data) => json.encode(data.toJson());

class Gettimelist {
  Gettimelist({
    String? result,
    String? msg,
    List<Data>? data,
  }) {
    _result = result;
    _msg = msg;
    _data = data;
  }

  Gettimelist.fromJson(dynamic json) {
    _result = json['result'];
    _msg = json['msg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _result;
  String? _msg;
  List<Data>? _data;
  Gettimelist copyWith({
    String? result,
    String? msg,
    List<Data>? data,
  }) =>
      Gettimelist(
        result: result ?? _result,
        msg: msg ?? _msg,
        data: data ?? _data,
      );
  String? get result => _result;
  String? get msg => _msg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['msg'] = _msg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "2"
/// start_time : "19:04"
/// end_time : "20:02"
/// date : "2023-10-10 00:00:00"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? startTime,
    String? endTime,
    String? date,
  }) {
    _id = id;
    _startTime = startTime;
    _endTime = endTime;
    _date = date;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _date = json['date'];
  }
  String? _id;
  String? _startTime;
  String? _endTime;
  String? _date;
  Data copyWith({
    String? id,
    String? startTime,
    String? endTime,
    String? date,
  }) =>
      Data(
        id: id ?? _id,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        date: date ?? _date,
      );
  String? get id => _id;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['date'] = _date;
    return map;
  }
}
