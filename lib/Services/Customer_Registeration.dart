class CustomerRegistration {
  int? mobile;

  CustomerRegistration({this.mobile});

  CustomerRegistration.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = mobile;
    return data;
  }
}
