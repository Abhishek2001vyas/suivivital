import 'dart:convert';
/// result : "true"
/// msg : "All Time List"
/// data : [{"id":"38","doctor_id":"1","days_id":"1","time_id":"1,10,11,2,5,6,7","time":[{"id":"1","time":"09:00AM","booking_status":"0"},{"id":"10","time":"07:30PM","booking_status":"0"},{"id":"11","time":"08:00PM","booking_status":"0"},{"id":"2","time":"09:30AM","booking_status":"0"},{"id":"5","time":"01:00PM","booking_status":"1"},{"id":"6","time":"01:30PM","booking_status":"0"},{"id":"7","time":"02:00PM","booking_status":"0"}],"status":"0","created_at":"2023-10-23 14:54:53","day":"monday"}]

UsersideDoctortime usersideDoctortimeFromJson(String str) => UsersideDoctortime.fromJson(json.decode(str));
String usersideDoctortimeToJson(UsersideDoctortime data) => json.encode(data.toJson());
class UsersideDoctortime {
  UsersideDoctortime({
      String? result, 
      String? msg, 
      List<Data>? data,}){
    _result = result;
    _msg = msg;
    _data = data;
}

  UsersideDoctortime.fromJson(dynamic json) {
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
UsersideDoctortime copyWith({  String? result,
  String? msg,
  List<Data>? data,
}) => UsersideDoctortime(  result: result ?? _result,
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

/// id : "38"
/// doctor_id : "1"
/// days_id : "1"
/// time_id : "1,10,11,2,5,6,7"
/// time : [{"id":"1","time":"09:00AM","booking_status":"0"},{"id":"10","time":"07:30PM","booking_status":"0"},{"id":"11","time":"08:00PM","booking_status":"0"},{"id":"2","time":"09:30AM","booking_status":"0"},{"id":"5","time":"01:00PM","booking_status":"1"},{"id":"6","time":"01:30PM","booking_status":"0"},{"id":"7","time":"02:00PM","booking_status":"0"}]
/// status : "0"
/// created_at : "2023-10-23 14:54:53"
/// day : "monday"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? doctorId, 
      String? daysId, 
      String? timeId, 
      List<Time>? time, 
      String? status, 
      String? createdAt, 
      String? day,}){
    _id = id;
    _doctorId = doctorId;
    _daysId = daysId;
    _timeId = timeId;
    _time = time;
    _status = status;
    _createdAt = createdAt;
    _day = day;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _daysId = json['days_id'];
    _timeId = json['time_id'];
    if (json['time'] != null) {
      _time = [];
      json['time'].forEach((v) {
        _time?.add(Time.fromJson(v));
      });
    }
    _status = json['status'];
    _createdAt = json['created_at'];
    _day = json['day'];
  }
  String? _id;
  String? _doctorId;
  String? _daysId;
  String? _timeId;
  List<Time>? _time;
  String? _status;
  String? _createdAt;
  String? _day;
Data copyWith({  String? id,
  String? doctorId,
  String? daysId,
  String? timeId,
  List<Time>? time,
  String? status,
  String? createdAt,
  String? day,
}) => Data(  id: id ?? _id,
  doctorId: doctorId ?? _doctorId,
  daysId: daysId ?? _daysId,
  timeId: timeId ?? _timeId,
  time: time ?? _time,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  day: day ?? _day,
);
  String? get id => _id;
  String? get doctorId => _doctorId;
  String? get daysId => _daysId;
  String? get timeId => _timeId;
  List<Time>? get time => _time;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get day => _day;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['days_id'] = _daysId;
    map['time_id'] = _timeId;
    if (_time != null) {
      map['time'] = _time?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['day'] = _day;
    return map;
  }

}

/// id : "1"
/// time : "09:00AM"
/// booking_status : "0"

Time timeFromJson(String str) => Time.fromJson(json.decode(str));
String timeToJson(Time data) => json.encode(data.toJson());
class Time {
  Time({
      String? id, 
      String? time, 
      String? bookingStatus,}){
    _id = id;
    _time = time;
    _bookingStatus = bookingStatus;
}

  Time.fromJson(dynamic json) {
    _id = json['id'];
    _time = json['time'];
    _bookingStatus = json['booking_status'];
  }
  String? _id;
  String? _time;
  String? _bookingStatus;
Time copyWith({  String? id,
  String? time,
  String? bookingStatus,
}) => Time(  id: id ?? _id,
  time: time ?? _time,
  bookingStatus: bookingStatus ?? _bookingStatus,
);
  String? get id => _id;
  String? get time => _time;
  String? get bookingStatus => _bookingStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['time'] = _time;
    map['booking_status'] = _bookingStatus;
    return map;
  }

}