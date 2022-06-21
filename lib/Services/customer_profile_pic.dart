import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../Models/verify_otp.dart';
import 'base_url.dart';
import 'package:dio/dio.dart';

final postsEndpoint = "${Driver.VerifyURL}/profileupload";
Dio dio = new Dio();
Future<VerifyOTP> CustProfilePicUp({int? userId, File? file}) async {
  String fileName = file!.path.split('/').last;
  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(file.path, filename: fileName),
  });
  var response = await dio.post("$postsEndpoint/$userId", data: formData);
  if (response.statusCode == 201) {
    print("NO Error occured");
  } else {
    print('errr');
  }
  return response as VerifyOTP;
}
