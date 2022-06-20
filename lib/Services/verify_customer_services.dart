import 'dart:convert';
import '../models/verify_otp.dart';
import 'base_url.dart';
import 'package:http/http.dart' as http;

final postsEndpoint = "${Driver.baseURL}/profile/verify";
Future<VerifyOTP> verifyOtp({int? userId, int? otp}) async {
  final url = Uri.parse("$postsEndpoint/$userId");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'otp': otp}),
  );
  print(response.request);
  if (response.statusCode == 200) {
    return VerifyOTP.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create post');
  }
}
