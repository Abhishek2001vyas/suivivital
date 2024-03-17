import 'dart:convert';

WaitingPat waitingPatFromJson(String str) => WaitingPat.fromJson(json.decode(str));
String waitingPatToJson(WaitingPat data) => json.encode(data.toJson());
class WaitingPat {
  WaitingPat({
      String? result, 
      String? msg, 
      List<Data>? data,}){
    _result = result;
    _msg = msg;
    _data = data;
}

  WaitingPat.fromJson(dynamic json) {
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
WaitingPat copyWith({  String? result,
  String? msg,
  List<Data>? data,
}) => WaitingPat(  result: result ?? _result,
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

/// id : "8"
/// doctor_id : "1"
/// date : "28-10-2023"
/// about : "xhj vk"
/// status : "Pending"
/// visit_date : "27-10-2023"
/// visit_time : "11:11"
/// userid : "1"
/// user_name : "Testing"
/// users_image : "6537a045ca3af.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? doctorId, 
      String? date, 
      String? about, 
      String? status, 
      String? visitDate, 
      String? visitTime, 
      String? userid, 
      String? userName, 
      String? usersImage,}){
    _id = id;
    _doctorId = doctorId;
    _date = date;
    _about = about;
    _status = status;
    _visitDate = visitDate;
    _visitTime = visitTime;
    _userid = userid;
    _userName = userName;
    _usersImage = usersImage;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _doctorId = json['doctor_id'];
    _date = json['date'];
    _about = json['about'];
    _status = json['status'];
    _visitDate = json['visit_date'];
    _visitTime = json['visit_time'];
    _userid = json['userid'];
    _userName = json['user_name'];
    _usersImage = json['users_image'];
  }
  String? _id;
  String? _doctorId;
  String? _date;
  String? _about;
  String? _status;
  String? _visitDate;
  String? _visitTime;
  String? _userid;
  String? _userName;
  String? _usersImage;
Data copyWith({  String? id,
  String? doctorId,
  String? date,
  String? about,
  String? status,
  String? visitDate,
  String? visitTime,
  String? userid,
  String? userName,
  String? usersImage,
}) => Data(  id: id ?? _id,
  doctorId: doctorId ?? _doctorId,
  date: date ?? _date,
  about: about ?? _about,
  status: status ?? _status,
  visitDate: visitDate ?? _visitDate,
  visitTime: visitTime ?? _visitTime,
  userid: userid ?? _userid,
  userName: userName ?? _userName,
  usersImage: usersImage ?? _usersImage,
);
  String? get id => _id;
  String? get doctorId => _doctorId;
  String? get date => _date;
  String? get about => _about;
  String? get status => _status;
  String? get visitDate => _visitDate;
  String? get visitTime => _visitTime;
  String? get userid => _userid;
  String? get userName => _userName;
  String? get usersImage => _usersImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['doctor_id'] = _doctorId;
    map['date'] = _date;
    map['about'] = _about;
    map['status'] = _status;
    map['visit_date'] = _visitDate;
    map['visit_time'] = _visitTime;
    map['userid'] = _userid;
    map['user_name'] = _userName;
    map['users_image'] = _usersImage;
    return map;
  }

}