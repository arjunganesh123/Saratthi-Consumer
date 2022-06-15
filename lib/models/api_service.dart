import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:saratthi_consumer/models/config.dart';

import 'otp_login_response_model.dart';

class APIService {
  static var client = http.Client();

  static Future<OtpLoginResponseModel> otpVerify(String otp) async {
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.otpLoginAPI);
    var response = await client.post(url,
        headers: requestHeader, body: jsonEncode({"otp": otp}));
    return otpLoginResponseJSON(response.body);
  }
}
