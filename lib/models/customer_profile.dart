class DriverProfile {
  String? fullname;
  String? dob;
  String? gender;
  int? mobile;
  String? img;
  int? id;
  String? email;
  DriverProfile({
    this.fullname,
    this.dob,
    this.gender,
    this.mobile,
    this.img,
    this.id,
    this.email,
  });

  DriverProfile.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    dob = json['dob'];
    gender = json['gender'];
    mobile = json['mobile'];
    email = json['email'];
    img = json['img'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['img'] = this.img;
    data['_id'] = this.id;
    return data;
  }
}
