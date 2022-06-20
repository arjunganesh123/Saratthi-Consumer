import 'dart:convert';
import 'base_url.dart';
import 'package:http/http.dart' as http;

import '../models/customer_profile.dart';

final postsEndpoint = "${Driver.VerifyURL}/getprofile";
Future<DriverProfile> driverProfile({int? PhoneNo}) async {
  final url = Uri.parse(postsEndpoint);
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'mobile': PhoneNo}),
  );
  if (response.statusCode == 200) {
    return DriverProfile.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create post');
  }
}
