// import 'dart:io';
// import 'package:dio/dio.dart';
//
// void _upload(File file, int userId) async {
//   String fileName = file.path.split('/').last;
//
//   FormData data = FormData.fromMap({
//     "file": await MultipartFile.fromFile(
//       file.path,
//       filename: fileName,
//     ),
//   });
//
//   Dio dio = new Dio();
//
//   dio
//       .post(
//           "https://saratthi-app.herokuapp.com/api/customer/profileupload/${userId}",
//           data: data)
//       .then((response) => print(response))
//       .catchError((error) => print(error));
// }
