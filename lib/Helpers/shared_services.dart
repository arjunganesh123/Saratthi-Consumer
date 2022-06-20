import 'package:shared_preferences/shared_preferences.dart';

//For Storing the phone no of driver in local storage
Future<void> putPhoneToLocal({int? phoneNo}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(phoneNo);
  await prefs.setInt('phone', phoneNo!);
}

//For getting the phone no driver from local storage
Future<int?> getPhoneFromLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? phone;
  if (prefs.containsKey('phone')) {
    phone = prefs.getInt('phone')!;
  }
  return phone;
}

Future<int?> getUserFromLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? userId;
  if (prefs.containsKey('user')) {
    userId = prefs.getInt('user')!;
  }
  return userId;
}

//For removing the phone no of driver from local storage
Future<void> removeFromLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('phone');
  await prefs.remove('user');
}

Future<void> putUserToLocal({int? userId}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setInt('user', userId!);
}
