import 'dart:convert';
/// result : "true"
/// msg : "Popular Doctor List"
/// data : [{"id":"1","rating":"4","name":"Abhishek ","email":"Abhi123@gmail.com","mobile":"1234567890","qualification":"MBBS","profession":"Medicine","experience":"5+ years","address":"Paris, France"}]

Populadoctor populadoctorFromJson(String str) => Populadoctor.fromJson(json.decode(str));
String populadoctorToJson(Populadoctor data) => json.encode(data.toJson());
class Populadoctor {
  Populadoctor({
      String? result, 
      String? msg, 
      List<Data>? data,}){
    _result = result;
    _msg = msg;
    _data = data;
}

  Populadoctor.fromJson(dynamic json) {
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
Populadoctor copyWith({  String? result,
  String? msg,
  List<Data>? data,
}) => Populadoctor(  result: result ?? _result,
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

/// id : "1"
/// rating : "4"
/// name : "Abhishek "
/// email : "Abhi123@gmail.com"
/// mobile : "1234567890"
/// qualification : "MBBS"
/// profession : "Medicine"
/// experience : "5+ years"
/// address : "Paris, France"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? rating, 
      String? name, 
      String? email, 
      String? mobile, 
      String? qualification, 
      String? profession, 
      String? experience, 
      String? address,}){
    _id = id;
    _rating = rating;
    _name = name;
    _email = email;
    _mobile = mobile;
    _qualification = qualification;
    _profession = profession;
    _experience = experience;
    _address = address;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _rating = json['rating'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _qualification = json['qualification'];
    _profession = json['profession'];
    _experience = json['experience'];
    _address = json['address'];
  }
  String? _id;
  String? _rating;
  String? _name;
  String? _email;
  String? _mobile;
  String? _qualification;
  String? _profession;
  String? _experience;
  String? _address;
Data copyWith({  String? id,
  String? rating,
  String? name,
  String? email,
  String? mobile,
  String? qualification,
  String? profession,
  String? experience,
  String? address,
}) => Data(  id: id ?? _id,
  rating: rating ?? _rating,
  name: name ?? _name,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  qualification: qualification ?? _qualification,
  profession: profession ?? _profession,
  experience: experience ?? _experience,
  address: address ?? _address,
);
  String? get id => _id;
  String? get rating => _rating;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get qualification => _qualification;
  String? get profession => _profession;
  String? get experience => _experience;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['rating'] = _rating;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['qualification'] = _qualification;
    map['profession'] = _profession;
    map['experience'] = _experience;
    map['address'] = _address;
    return map;
  }

}