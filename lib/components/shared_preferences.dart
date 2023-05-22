import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveUserData({
  required String id_mahasiswa,
  required String nama,
  required String nim,
  required String prodi,
  required String jenis_kelamin,
  required String password,
  required String nomer_telepon,
  required String email,
}) async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences userPrefs = await prefs;

  userPrefs.setString('id_mahasiswa', id_mahasiswa ?? '');
  userPrefs.setString('nama', nama ?? '');
  userPrefs.setString('nim', nim ?? '');
  userPrefs.setString('prodi', prodi ?? '');
  userPrefs.setString('jenis_kelamin', jenis_kelamin ?? '');
  userPrefs.setString('password', password ?? '');
  userPrefs.setString('email', email ?? '');
  userPrefs.setString('nomer_telepon', nomer_telepon ?? '');
}

Future<bool> checkLoggedInUser() async {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences userPrefs = await prefs;

  return userPrefs.containsKey('id_mahasiswa');
}

Future<String> getLocalData(String param) async {
  String data = '';
  try {
    Future<SharedPreferences> sharePref = SharedPreferences.getInstance();
    final SharedPreferences prefs = await sharePref;
    data = prefs.getString(param)!;
  } catch (e) {
    log(e.toString() + ' at $param');
  }

  return data;
}