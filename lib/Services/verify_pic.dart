class VerifyPIC {
  String? message;

  VerifyPIC({this.message});

  VerifyPIC.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  String toJson() {
    final String data;
    data = message!;
    return data;
  }
}
