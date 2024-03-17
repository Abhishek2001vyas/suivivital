import 'dart:convert';

/// result : "true"
/// msg : "All Data"
/// path : "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/doctor/"
/// data : {"id":"5","name":"abh0vyas","email":"abhishek5@gmail.com","mobile":"1234567895","qualification":"Graduate","profession":"Medical Doctor","experience":"5+ years","state":"null","address":"indore","latitude":"","longitude":"","fees_condition":"50088","referral_code":"","fcm_id":"","profile_image":"65294f0f5a1bd.png","certificate_image":"65294f0f5a404.jpg","license_image":"65294f0f5a565.jpg","gender":"","about":"","otp":"8316","verify_otp":"1","status":"1","status_on_of":"1","date":"2023-10-14","time":"11:00"}

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));
String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    String? result,
    String? msg,
    String? path,
    Data? data,
  }) {
    _result = result;
    _msg = msg;
    _path = path;
    _data = data;
  }

  Profile.fromJson(dynamic json) {
    _result = json['result'];
    _msg = json['msg'];
    _path = json['path'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _result;
  String? _msg;
  String? _path;
  Data? _data;
  Profile copyWith({
    String? result,
    String? msg,
    String? path,
    Data? data,
  }) =>
      Profile(
        result: result ?? _result,
        msg: msg ?? _msg,
        path: path ?? _path,
        data: data ?? _data,
      );
  String? get result => _result;
  String? get msg => _msg;
  String? get path => _path;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['result'] = _result;
    map['msg'] = _msg;
    map['path'] = _path;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? qualification,
    String? profession,
    String? experience,
    String? state,
    String? address,
    String? latitude,
    String? longitude,
    String? feesCondition,
    String? referralCode,
    String? fcmId,
    String? profileImage,
    String? certificateImage,
    String? licenseImage,
    String? gender,
    String? about,
    String? otp,
    String? verifyOtp,
    String? status,
    String? statusOnOf,
    String? date,
    String? time,
  }) {
    _id = id;
    _name = name;
    _email = email;
    _mobile = mobile;
    _qualification = qualification;
    _profession = profession;
    _experience = experience;
    _state = state;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _feesCondition = feesCondition;
    _referralCode = referralCode;
    _fcmId = fcmId;
    _profileImage = profileImage;
    _certificateImage = certificateImage;
    _licenseImage = licenseImage;
    _gender = gender;
    _about = about;
    _otp = otp;
    _verifyOtp = verifyOtp;
    _status = status;
    _statusOnOf = statusOnOf;
    _date = date;
    _time = time;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _qualification = json['qualification'];
    _profession = json['profession'];
    _experience = json['experience'];
    _state = json['state'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _feesCondition = json['fees_condition'];
    _referralCode = json['referral_code'];
    _fcmId = json['fcm_id'];
    _profileImage = json['profile_image'];
    _certificateImage = json['certificate_image'];
    _licenseImage = json['license_image'];
    _gender = json['gender'];
    _about = json['about'];
    _otp = json['otp'];
    _verifyOtp = json['verify_otp'];
    _status = json['status'];
    _statusOnOf = json['status_on_of'];
    _date = json['date'];
    _time = json['time'];
  }
  String? _id;
  String? _name;
  String? _email;
  String? _mobile;
  String? _qualification;
  String? _profession;
  String? _experience;
  String? _state;
  String? _address;
  String? _latitude;
  String? _longitude;
  String? _feesCondition;
  String? _referralCode;
  String? _fcmId;
  String? _profileImage;
  String? _certificateImage;
  String? _licenseImage;
  String? _gender;
  String? _about;
  String? _otp;
  String? _verifyOtp;
  String? _status;
  String? _statusOnOf;
  String? _date;
  String? _time;
  Data copyWith({
    String? id,
    String? name,
    String? email,
    String? mobile,
    String? qualification,
    String? profession,
    String? experience,
    String? state,
    String? address,
    String? latitude,
    String? longitude,
    String? feesCondition,
    String? referralCode,
    String? fcmId,
    String? profileImage,
    String? certificateImage,
    String? licenseImage,
    String? gender,
    String? about,
    String? otp,
    String? verifyOtp,
    String? status,
    String? statusOnOf,
    String? date,
    String? time,
  }) =>
      Data(
        id: id ?? _id,
        name: name ?? _name,
        email: email ?? _email,
        mobile: mobile ?? _mobile,
        qualification: qualification ?? _qualification,
        profession: profession ?? _profession,
        experience: experience ?? _experience,
        state: state ?? _state,
        address: address ?? _address,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        feesCondition: feesCondition ?? _feesCondition,
        referralCode: referralCode ?? _referralCode,
        fcmId: fcmId ?? _fcmId,
        profileImage: profileImage ?? _profileImage,
        certificateImage: certificateImage ?? _certificateImage,
        licenseImage: licenseImage ?? _licenseImage,
        gender: gender ?? _gender,
        about: about ?? _about,
        otp: otp ?? _otp,
        verifyOtp: verifyOtp ?? _verifyOtp,
        status: status ?? _status,
        statusOnOf: statusOnOf ?? _statusOnOf,
        date: date ?? _date,
        time: time ?? _time,
      );
  String? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get qualification => _qualification;
  String? get profession => _profession;
  String? get experience => _experience;
  String? get state => _state;
  String? get address => _address;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get feesCondition => _feesCondition;
  String? get referralCode => _referralCode;
  String? get fcmId => _fcmId;
  String? get profileImage => _profileImage;
  String? get certificateImage => _certificateImage;
  String? get licenseImage => _licenseImage;
  String? get gender => _gender;
  String? get about => _about;
  String? get otp => _otp;
  String? get verifyOtp => _verifyOtp;
  String? get status => _status;
  String? get statusOnOf => _statusOnOf;
  String? get date => _date;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['qualification'] = _qualification;
    map['profession'] = _profession;
    map['experience'] = _experience;
    map['state'] = _state;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['fees_condition'] = _feesCondition;
    map['referral_code'] = _referralCode;
    map['fcm_id'] = _fcmId;
    map['profile_image'] = _profileImage;
    map['certificate_image'] = _certificateImage;
    map['license_image'] = _licenseImage;
    map['gender'] = _gender;
    map['about'] = _about;
    map['otp'] = _otp;
    map['verify_otp'] = _verifyOtp;
    map['status'] = _status;
    map['status_on_of'] = _statusOnOf;
    map['date'] = _date;
    map['time'] = _time;
    return map;
  }
}
