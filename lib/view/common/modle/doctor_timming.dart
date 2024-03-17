import 'dart:convert';
/// result : "true"
/// msg : "All Time List"
/// data : [{"id":"14","doctor_id":"1","days_id":"1","time_id":"1","time":["09:00AM"],"to_time":"","sift":"Morning","status":"0","created_at":"2023-10-19 18:38:51","day":"monday"},{"id":"13","doctor_id":"1","days_id":"5","time_id":"1","time":["09:00AM"],"to_time":"","sift":"Morning","status":"0","created_at":"2023-10-19 16:42:40","day":"friday"},{"id":"12","doctor_id":"1","days_id":"7","time_id":"1","time":["09:00AM"],"to_time":"","sift":"Morning","status":"0","created_at":"2023-10-18 13:45:22","day":"sunday"},{"id":"11","doctor_id":"1","days_id":"6","time_id":"1","time":["09:00AM"],"to_time":"","sift":"Morning","status":"0","created_at":"2023-10-18 13:38:49","day":"saturday"},{"id":"10","doctor_id":"1","days_id":"5","time_id":"1","time":["09:00AM"],"to_time":"","sift":"Morning","status":"0","created_at":"2023-10-18 13:37:53","day":"friday"},{"id":"9","doctor_id":"1","days_id":"4","time_id":"1","time":["09:00AM"],"to_time":"","sift":"","status":"0","created_at":"2023-10-17 13:41:06","day":"thursday"},{"id":"8","doctor_id":"1","days_id":"3","time_id":"1","time":["09:00AM"],"to_time":"","sift":"","status":"0","created_at":"2023-10-17 13:40:37","day":"wednesday"},{"id":"7","doctor_id":"1","days_id":"2","time_id":"1","time":["09:00AM"],"to_time":"","sift":"","status":"1","created_at":"2023-10-17 13:38:08","day":"tuesday"}]

DoctorTimming doctorTimmingFromJson(String str) => DoctorTimming.fromJson(json.decode(str));
String doctorTimmingToJson(DoctorTimming data) => json.encode(data.toJson());
class DoctorTimming {
  DoctorTimming({
      String? result, 
      String? msg, 
      List<Data>? data,}){
    _result = result;
    _msg = msg;
    _data = data;
}

  DoctorTimming.fromJson(dynamic json) {
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
DoctorTimming copyWith({  String? result,
  String? msg,
  List<Data>? data,
}) => DoctorTimming(  result: result ?? _result,
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

/// id : "14"
/// doctor_id : "1"
/// days_id : "1"
/// time_id : "1"
/// time : ["09:00AM"]
/// to_time : ""
/// sift : "Morning"
/// status : "0"
/// created_at : "2023-10-19 18:38:51"
/// day : "monday"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? doctorId, 
      String? daysId, 
      String? timeId, 
      List<String>? time, 
      String? toTime, 
      String? sift, 
      String? status, 
      String? createdAt, 
      String? day,}){
    _id = id;
    _doctorId = doctorId;
    _daysId = daysId;
    _timeId = timeId;
    _time = time;
    _toTime = toTime;
    _sift = sift;
    _status = status;
    _createdAt = createdAt;
    _day = day;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _daysId = json['days_id'];
    _timeId = json['time_id'];
    _time = json['time'] != null ? json['time'].cast<String>() : [];
    _toTime = json['to_time'];
    _sift = json['sift'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _day = json['day'];
  }
  String? _id;
  String? _doctorId;
  String? _daysId;
  String? _timeId;
  List<String>? _time;
  String? _toTime;
  String? _sift;
  String? _status;
  String? _createdAt;
  String? _day;
Data copyWith({  String? id,
  String? doctorId,
  String? daysId,
  String? timeId,
  List<String>? time,
  String? toTime,
  String? sift,
  String? status,
  String? createdAt,
  String? day,
}) => Data(  id: id ?? _id,
  doctorId: doctorId ?? _doctorId,
  daysId: daysId ?? _daysId,
  timeId: timeId ?? _timeId,
  time: time ?? _time,
  toTime: toTime ?? _toTime,
  sift: sift ?? _sift,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  day: day ?? _day,
);
  String? get id => _id;
  String? get doctorId => _doctorId;
  String? get daysId => _daysId;
  String? get timeId => _timeId;
  List<String>? get time => _time;
  String? get toTime => _toTime;
  String? get sift => _sift;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get day => _day;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['days_id'] = _daysId;
    map['time_id'] = _timeId;
    map['time'] = _time;
    map['to_time'] = _toTime;
    map['sift'] = _sift;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['day'] = _day;
    return map;
  }

}