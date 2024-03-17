import 'dart:convert';

/// result : "true"
/// msg : "All Time List"
/// data : [{"id":"12","doctor_id":"5","start_time":"TimeOfDay(12:15)","end_time":"TimeOfDay(12:15)","date":"2023-10-11 15:18:25"},{"id":"13","doctor_id":"5","start_time":"TimeOfDay(16:20)","end_time":"TimeOfDay(14:20)","date":"2023-10-11 15:21:22"},{"id":"14","doctor_id":"5","start_time":"TimeOfDay(14:21)","end_time":"TimeOfDay(19:22)","date":"2023-10-11 15:22:04"},{"id":"15","doctor_id":"5","start_time":"TimeOfDay(14:21)","end_time":"TimeOfDay(19:22)","date":"2023-10-11 15:23:47"},{"id":"16","doctor_id":"5","start_time":"TimeOfDay(14:21)","end_time":"TimeOfDay(19:22)","date":"2023-10-11 15:25:57"},{"id":"17","doctor_id":"5","start_time":"TimeOfDay(14:21)","end_time":"TimeOfDay(19:22)","date":"2023-10-11 15:27:09"},{"id":"18","doctor_id":"5","start_time":"TimeOfDay(16:18)","end_time":"TimeOfDay(21:18)","date":"2023-10-11 16:18:15"},{"id":"19","doctor_id":"5","start_time":"05:44","end_time":"05:40","date":"2023-10-11 16:20:00"},{"id":"20","doctor_id":"5","start_time":"TimeOfDay(16:23)","end_time":"TimeOfDay(21:18)","date":"2023-10-11 16:23:17"},{"id":"21","doctor_id":"5","start_time":"05:44","end_time":"05:40","date":"2023-10-11 16:23:20"},{"id":"22","doctor_id":"5","start_time":"TimeOfDay(16:23)","end_time":"TimeOfDay(21:18)","date":"2023-10-11 16:34:30"},{"id":"23","doctor_id":"5","start_time":":23","end_time":":18","date":"2023-10-11 16:35:15"}]

Gettime gettimeFromJson(String str) => Gettime.fromJson(json.decode(str));
String gettimeToJson(Gettime data) => json.encode(data.toJson());

class Gettime {
  Gettime({
    String? result,
    String? msg,
    List<Data>? data,
  }) {
    _result = result;
    _msg = msg;
    _data = data;
  }

  Gettime.fromJson(dynamic json) {
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
  Gettime copyWith({
    String? result,
    String? msg,
    List<Data>? data,
  }) =>
      Gettime(
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

/// id : "12"
/// doctor_id : "5"
/// start_time : "TimeOfDay(12:15)"
/// end_time : "TimeOfDay(12:15)"
/// date : "2023-10-11 15:18:25"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? doctorId,
    String? startTime,
    String? endTime,
    String? date,
  }) {
    _id = id;
    _doctorId = doctorId;
    _startTime = startTime;
    _endTime = endTime;
    _date = date;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _startTime = json['start_time'];
    _endTime = json['end_time'];
    _date = json['date'];
  }
  String? _id;
  String? _doctorId;
  String? _startTime;
  String? _endTime;
  String? _date;
  Data copyWith({
    String? id,
    String? doctorId,
    String? startTime,
    String? endTime,
    String? date,
  }) =>
      Data(
        id: id ?? _id,
        doctorId: doctorId ?? _doctorId,
        startTime: startTime ?? _startTime,
        endTime: endTime ?? _endTime,
        date: date ?? _date,
      );
  String? get id => _id;
  String? get doctorId => _doctorId;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  String? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['start_time'] = _startTime;
    map['end_time'] = _endTime;
    map['date'] = _date;
    return map;
  }
}
