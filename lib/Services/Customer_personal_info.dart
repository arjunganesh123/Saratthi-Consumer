import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/verify_otp.dart';
import 'base_url.dart';

final postsEndpoint = "${Driver.baseURL}/profile";
Future<VerifyOTP> driverPersonalInfo({
  int? userId,
  String? fullName,
  String? dob,
  String? gender,
  String? email,
}) async {
  final url = Uri.parse("$postsEndpoint/$userId");
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        {"fullname": fullName, "email": email, "dob": dob, "gender": gender}),
  );
  print(response.request);
  if (response.statusCode == 200) {
    return VerifyOTP.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create post');
  }
}
