import 'dart:convert';

/// result : "true"
/// msg : "All Data"
/// path : "https://logicaltest.website/Deepesh/SuiviVital_Doctor/assets/users/"
/// data : {"id":"1","user_name":"abhi150","first_name":"abhi","last_name":"vyas","email":"abhi@gmail.com","mobile":"1234567890","address":"India","referral_code":"12345","gender":"male","dob":"2001-10-15","diabetes_types":"type-1","metric":null,"weight":"60","height":"5.9","activity_factor":"Little or no exercise","jime_type":null,"hyperglycemia":"25","glucose_high":"99","glucose_low":"99","hypoglycemia":"99","insulin_sensitive":null,"carbohydrates_ratio":null,"time":"2023-10-05 15:54:06.296963","time_2":"2023-10-05 15:54:06.297087","ratio":"7","ratio_2":"78","therapy":null,"rapid_short_acting_insulin":"null","non_insulin":"non insulin","medi_name":"name","dose":"6","qty":"1","medi_name_2":"","dose_2":"","qty_2":"","intermediate_long":"null","multiple_daily_injections":null,"insulin_pen_dose_increments":null,"medication":null,"insulin_pump":null,"insulin_name":null,"glucose_targets":"99","image":"651e8e7b16892.jpg","otp":"5908","fcm_id":"","verify_otp":"1","status":"0","receive_email":"1","user_status":"5","created_at":"2023-10-05 15:52:51"}

ProfileUser profileUserFromJson(String str) =>
    ProfileUser.fromJson(json.decode(str));

String profileUserToJson(ProfileUser data) => json.encode(data.toJson());

class ProfileUser {
  ProfileUser({
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

  ProfileUser.fromJson(dynamic json) {
    _result = json['result'];
    _msg = json['msg'];
    _path = json['path'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  String? _result;
  String? _msg;
  String? _path;
  Data? _data;

  ProfileUser copyWith({
    String? result,
    String? msg,
    String? path,
    Data? data,
  }) =>
      ProfileUser(
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

/// id : "1"
/// user_name : "abhi150"
/// first_name : "abhi"
/// last_name : "vyas"
/// email : "abhi@gmail.com"
/// mobile : "1234567890"
/// address : "India"
/// referral_code : "12345"
/// gender : "male"
/// dob : "2001-10-15"
/// diabetes_types : "type-1"
/// metric : null
/// weight : "60"
/// height : "5.9"
/// activity_factor : "Little or no exercise"
/// jime_type : null
/// hyperglycemia : "25"
/// glucose_high : "99"
/// glucose_low : "99"
/// hypoglycemia : "99"
/// insulin_sensitive : null
/// carbohydrates_ratio : null
/// time : "2023-10-05 15:54:06.296963"
/// time_2 : "2023-10-05 15:54:06.297087"
/// ratio : "7"
/// ratio_2 : "78"
/// therapy : null
/// rapid_short_acting_insulin : "null"
/// non_insulin : "non insulin"
/// medi_name : "name"
/// dose : "6"
/// qty : "1"
/// medi_name_2 : ""
/// dose_2 : ""
/// qty_2 : ""
/// intermediate_long : "null"
/// multiple_daily_injections : null
/// insulin_pen_dose_increments : null
/// medication : null
/// insulin_pump : null
/// insulin_name : null
/// glucose_targets : "99"
/// image : "651e8e7b16892.jpg"
/// otp : "5908"
/// fcm_id : ""
/// verify_otp : "1"
/// status : "0"
/// receive_email : "1"
/// user_status : "5"
/// created_at : "2023-10-05 15:52:51"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? mobile,
    String? address,
    String? referralCode,
    String? gender,
    String? dob,
    String? diabetesTypes,
    dynamic metric,
    String? weight,
    String? height,
    String? activityFactor,
    dynamic jimeType,
    String? hyperglycemia,
    String? glucoseHigh,
    String? glucoseLow,
    String? hypoglycemia,
    dynamic insulinSensitive,
    dynamic carbohydratesRatio,
    String? time,
    String? time2,
    String? ratio,
    String? ratio2,
    dynamic therapy,
    String? rapidShortActingInsulin,
    String? nonInsulin,
    String? mediName,
    String? dose,
    String? qty,
    String? mediName2,
    String? dose2,
    String? qty2,
    String? intermediateLong,
    dynamic multipleDailyInjections,
    dynamic insulinPenDoseIncrements,
    dynamic medication,
    dynamic insulinPump,
    dynamic insulinName,
    String? glucoseTargets,
    String? image,
    String? otp,
    String? fcmId,
    String? verifyOtp,
    String? status,
    String? receiveEmail,
    String? userStatus,
    String? createdAt,
  }) {
    _id = id;
    _userName = userName;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _mobile = mobile;
    _address = address;
    _referralCode = referralCode;
    _gender = gender;
    _dob = dob;
    _diabetesTypes = diabetesTypes;
    _metric = metric;
    _weight = weight;
    _height = height;
    _activityFactor = activityFactor;
    _jimeType = jimeType;
    _hyperglycemia = hyperglycemia;
    _glucoseHigh = glucoseHigh;
    _glucoseLow = glucoseLow;
    _hypoglycemia = hypoglycemia;
    _insulinSensitive = insulinSensitive;
    _carbohydratesRatio = carbohydratesRatio;
    _time = time;
    _time2 = time2;
    _ratio = ratio;
    _ratio2 = ratio2;
    _therapy = therapy;
    _rapidShortActingInsulin = rapidShortActingInsulin;
    _nonInsulin = nonInsulin;
    _mediName = mediName;
    _dose = dose;
    _qty = qty;
    _mediName2 = mediName2;
    _dose2 = dose2;
    _qty2 = qty2;
    _intermediateLong = intermediateLong;
    _multipleDailyInjections = multipleDailyInjections;
    _insulinPenDoseIncrements = insulinPenDoseIncrements;
    _medication = medication;
    _insulinPump = insulinPump;
    _insulinName = insulinName;
    _glucoseTargets = glucoseTargets;
    _image = image;
    _otp = otp;
    _fcmId = fcmId;
    _verifyOtp = verifyOtp;
    _status = status;
    _receiveEmail = receiveEmail;
    _userStatus = userStatus;
    _createdAt = createdAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userName = json['user_name'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _address = json['address'];
    _referralCode = json['referral_code'];
    _gender = json['gender'];
    _dob = json['dob'];
    _diabetesTypes = json['diabetes_types'];
    _metric = json['metric'];
    _weight = json['weight'];
    _height = json['height'];
    _activityFactor = json['activity_factor'];
    _jimeType = json['jime_type'];
    _hyperglycemia = json['hyperglycemia'];
    _glucoseHigh = json['glucose_high'];
    _glucoseLow = json['glucose_low'];
    _hypoglycemia = json['hypoglycemia'];
    _insulinSensitive = json['insulin_sensitive'];
    _carbohydratesRatio = json['carbohydrates_ratio'];
    _time = json['time'];
    _time2 = json['time_2'];
    _ratio = json['ratio'];
    _ratio2 = json['ratio_2'];
    _therapy = json['therapy'];
    _rapidShortActingInsulin = json['rapid_short_acting_insulin'];
    _nonInsulin = json['non_insulin'];
    _mediName = json['medi_name'];
    _dose = json['dose'];
    _qty = json['qty'];
    _mediName2 = json['medi_name_2'];
    _dose2 = json['dose_2'];
    _qty2 = json['qty_2'];
    _intermediateLong = json['intermediate_long'];
    _multipleDailyInjections = json['multiple_daily_injections'];
    _insulinPenDoseIncrements = json['insulin_pen_dose_increments'];
    _medication = json['medication'];
    _insulinPump = json['insulin_pump'];
    _insulinName = json['insulin_name'];
    _glucoseTargets = json['glucose_targets'];
    _image = json['image'];
    _otp = json['otp'];
    _fcmId = json['fcm_id'];
    _verifyOtp = json['verify_otp'];
    _status = json['status'];
    _receiveEmail = json['receive_email'];
    _userStatus = json['user_status'];
    _createdAt = json['created_at'];
  }

  String? _id;
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobile;
  String? _address;
  String? _referralCode;
  String? _gender;
  String? _dob;
  String? _diabetesTypes;
  dynamic _metric;
  String? _weight;
  String? _height;
  String? _activityFactor;
  dynamic _jimeType;
  String? _hyperglycemia;
  String? _glucoseHigh;
  String? _glucoseLow;
  String? _hypoglycemia;
  dynamic _insulinSensitive;
  dynamic _carbohydratesRatio;
  String? _time;
  String? _time2;
  String? _ratio;
  String? _ratio2;
  dynamic _therapy;
  String? _rapidShortActingInsulin;
  String? _nonInsulin;
  String? _mediName;
  String? _dose;
  String? _qty;
  String? _mediName2;
  String? _dose2;
  String? _qty2;
  String? _intermediateLong;
  dynamic _multipleDailyInjections;
  dynamic _insulinPenDoseIncrements;
  dynamic _medication;
  dynamic _insulinPump;
  dynamic _insulinName;
  String? _glucoseTargets;
  String? _image;
  String? _otp;
  String? _fcmId;
  String? _verifyOtp;
  String? _status;
  String? _receiveEmail;
  String? _userStatus;
  String? _createdAt;

  Data copyWith({
    String? id,
    String? userName,
    String? firstName,
    String? lastName,
    String? email,
    String? mobile,
    String? address,
    String? referralCode,
    String? gender,
    String? dob,
    String? diabetesTypes,
    dynamic metric,
    String? weight,
    String? height,
    String? activityFactor,
    dynamic jimeType,
    String? hyperglycemia,
    String? glucoseHigh,
    String? glucoseLow,
    String? hypoglycemia,
    dynamic insulinSensitive,
    dynamic carbohydratesRatio,
    String? time,
    String? time2,
    String? ratio,
    String? ratio2,
    dynamic therapy,
    String? rapidShortActingInsulin,
    String? nonInsulin,
    String? mediName,
    String? dose,
    String? qty,
    String? mediName2,
    String? dose2,
    String? qty2,
    String? intermediateLong,
    dynamic multipleDailyInjections,
    dynamic insulinPenDoseIncrements,
    dynamic medication,
    dynamic insulinPump,
    dynamic insulinName,
    String? glucoseTargets,
    String? image,
    String? otp,
    String? fcmId,
    String? verifyOtp,
    String? status,
    String? receiveEmail,
    String? userStatus,
    String? createdAt,
  }) =>
      Data(
        id: id ?? _id,
        userName: userName ?? _userName,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        mobile: mobile ?? _mobile,
        address: address ?? _address,
        referralCode: referralCode ?? _referralCode,
        gender: gender ?? _gender,
        dob: dob ?? _dob,
        diabetesTypes: diabetesTypes ?? _diabetesTypes,
        metric: metric ?? _metric,
        weight: weight ?? _weight,
        height: height ?? _height,
        activityFactor: activityFactor ?? _activityFactor,
        jimeType: jimeType ?? _jimeType,
        hyperglycemia: hyperglycemia ?? _hyperglycemia,
        glucoseHigh: glucoseHigh ?? _glucoseHigh,
        glucoseLow: glucoseLow ?? _glucoseLow,
        hypoglycemia: hypoglycemia ?? _hypoglycemia,
        insulinSensitive: insulinSensitive ?? _insulinSensitive,
        carbohydratesRatio: carbohydratesRatio ?? _carbohydratesRatio,
        time: time ?? _time,
        time2: time2 ?? _time2,
        ratio: ratio ?? _ratio,
        ratio2: ratio2 ?? _ratio2,
        therapy: therapy ?? _therapy,
        rapidShortActingInsulin:
            rapidShortActingInsulin ?? _rapidShortActingInsulin,
        nonInsulin: nonInsulin ?? _nonInsulin,
        mediName: mediName ?? _mediName,
        dose: dose ?? _dose,
        qty: qty ?? _qty,
        mediName2: mediName2 ?? _mediName2,
        dose2: dose2 ?? _dose2,
        qty2: qty2 ?? _qty2,
        intermediateLong: intermediateLong ?? _intermediateLong,
        multipleDailyInjections:
            multipleDailyInjections ?? _multipleDailyInjections,
        insulinPenDoseIncrements:
            insulinPenDoseIncrements ?? _insulinPenDoseIncrements,
        medication: medication ?? _medication,
        insulinPump: insulinPump ?? _insulinPump,
        insulinName: insulinName ?? _insulinName,
        glucoseTargets: glucoseTargets ?? _glucoseTargets,
        image: image ?? _image,
        otp: otp ?? _otp,
        fcmId: fcmId ?? _fcmId,
        verifyOtp: verifyOtp ?? _verifyOtp,
        status: status ?? _status,
        receiveEmail: receiveEmail ?? _receiveEmail,
        userStatus: userStatus ?? _userStatus,
        createdAt: createdAt ?? _createdAt,
      );

  String? get id => _id;

  String? get userName => _userName;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get mobile => _mobile;

  String? get address => _address;

  String? get referralCode => _referralCode;

  String? get gender => _gender;

  String? get dob => _dob;

  String? get diabetesTypes => _diabetesTypes;

  dynamic get metric => _metric;

  String? get weight => _weight;

  String? get height => _height;

  String? get activityFactor => _activityFactor;

  dynamic get jimeType => _jimeType;

  String? get hyperglycemia => _hyperglycemia;

  String? get glucoseHigh => _glucoseHigh;

  String? get glucoseLow => _glucoseLow;

  String? get hypoglycemia => _hypoglycemia;

  dynamic get insulinSensitive => _insulinSensitive;

  dynamic get carbohydratesRatio => _carbohydratesRatio;

  String? get time => _time;

  String? get time2 => _time2;

  String? get ratio => _ratio;

  String? get ratio2 => _ratio2;

  dynamic get therapy => _therapy;

  String? get rapidShortActingInsulin => _rapidShortActingInsulin;

  String? get nonInsulin => _nonInsulin;

  String? get mediName => _mediName;

  String? get dose => _dose;

  String? get qty => _qty;

  String? get mediName2 => _mediName2;

  String? get dose2 => _dose2;

  String? get qty2 => _qty2;

  String? get intermediateLong => _intermediateLong;

  dynamic get multipleDailyInjections => _multipleDailyInjections;

  dynamic get insulinPenDoseIncrements => _insulinPenDoseIncrements;

  dynamic get medication => _medication;

  dynamic get insulinPump => _insulinPump;

  dynamic get insulinName => _insulinName;

  String? get glucoseTargets => _glucoseTargets;

  String? get image => _image;

  String? get otp => _otp;

  String? get fcmId => _fcmId;

  String? get verifyOtp => _verifyOtp;

  String? get status => _status;

  String? get receiveEmail => _receiveEmail;

  String? get userStatus => _userStatus;

  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_name'] = _userName;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['address'] = _address;
    map['referral_code'] = _referralCode;
    map['gender'] = _gender;
    map['dob'] = _dob;
    map['diabetes_types'] = _diabetesTypes;
    map['metric'] = _metric;
    map['weight'] = _weight;
    map['height'] = _height;
    map['activity_factor'] = _activityFactor;
    map['jime_type'] = _jimeType;
    map['hyperglycemia'] = _hyperglycemia;
    map['glucose_high'] = _glucoseHigh;
    map['glucose_low'] = _glucoseLow;
    map['hypoglycemia'] = _hypoglycemia;
    map['insulin_sensitive'] = _insulinSensitive;
    map['carbohydrates_ratio'] = _carbohydratesRatio;
    map['time'] = _time;
    map['time_2'] = _time2;
    map['ratio'] = _ratio;
    map['ratio_2'] = _ratio2;
    map['therapy'] = _therapy;
    map['rapid_short_acting_insulin'] = _rapidShortActingInsulin;
    map['non_insulin'] = _nonInsulin;
    map['medi_name'] = _mediName;
    map['dose'] = _dose;
    map['qty'] = _qty;
    map['medi_name_2'] = _mediName2;
    map['dose_2'] = _dose2;
    map['qty_2'] = _qty2;
    map['intermediate_long'] = _intermediateLong;
    map['multiple_daily_injections'] = _multipleDailyInjections;
    map['insulin_pen_dose_increments'] = _insulinPenDoseIncrements;
    map['medication'] = _medication;
    map['insulin_pump'] = _insulinPump;
    map['insulin_name'] = _insulinName;
    map['glucose_targets'] = _glucoseTargets;
    map['image'] = _image;
    map['otp'] = _otp;
    map['fcm_id'] = _fcmId;
    map['verify_otp'] = _verifyOtp;
    map['status'] = _status;
    map['receive_email'] = _receiveEmail;
    map['user_status'] = _userStatus;
    map['created_at'] = _createdAt;
    return map;
  }
}
