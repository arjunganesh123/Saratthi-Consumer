import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_url.dart';

final postsEndpoint = "${Driver.baseURL}/regcustomer";
Future<Map<dynamic, dynamic>> registerCustomer({int? PhoneNo}) async {
  final url = Uri.parse(postsEndpoint);
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({'mobile': PhoneNo}),
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to create post');
  }
}
