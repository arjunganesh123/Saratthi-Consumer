import 'dart:convert';

OtpLoginResponseModel otpLoginResponseJSON(String str) =>
    OtpLoginResponseModel.fromJson(jsonDecode(str));

class OtpLoginResponseModel {
  OtpLoginResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final String? data;

  OtpLoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'];
  }
}
