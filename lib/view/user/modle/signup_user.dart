class signup_user {
  String? result;
  String? msg;
  String? path;
  Data? data;

  signup_user({this.result, this.msg, this.path, this.data});

  signup_user.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    path = json['path'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['msg'] = this.msg;
    data['path'] = this.path;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? id;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  String? address;
  String? gender;
  String? dob;
  String? receiveEmail;
  String? image;
  String? userStatus;
  String? createdAt;

  Data(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.address,
      this.gender,
      this.dob,
      this.receiveEmail,
      this.image,
      this.userStatus,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
    gender = json['gender'];
    dob = json['dob'];
    receiveEmail = json['receive_email'];
    image = json['image'];
    userStatus = json['user_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['receive_email'] = this.receiveEmail;
    data['image'] = this.image;
    data['user_status'] = this.userStatus;
    data['created_at'] = this.createdAt;
    return data;
  }
}
