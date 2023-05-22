import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../components/ApiUrl.dart';
import '../components/shared_preferences.dart';

class MAuth{

  Future register({
    required String nama,
    required String nim,
    required String prodi,
    required String jenis_kelamin,
    required String password,
    required String nomor_telepon,
    required String email
  }) async {
    try{
      http.Response res = await http.post(Uri.parse(ApiURL+'/ApiAuth/login'),
          body: {
            'nama': nama,
            'nim': nim,
            'prodi': prodi,
            'jenis_kelamin': jenis_kelamin,
            'password': password,
            'nomer_telepon': nomor_telepon,
            'email': email,
          });
      var json = jsonDecode(res.body);
      print(json);

      return json;
    // } on SocketException {
    //   return Future.error('Periksa sambungan internet Anda!');
    } catch (e) {
      print('ERROR');
      return Future.error(e.toString());
    }
  }
  Future userLogin(
  {required String nim, required String password}
      ) async {
    try {
      var json;
      http.Response res = await http.post(
        Uri.parse(ApiURL+'/ApiAuth/login'),
        // headers: {'Authorization': 'Bearer ' + Token!},
        body: {
          "nim": nim,
          "password": password,
          // "token_fcm": tokenFCM
        },
      );
      json = jsonDecode(res.body);
      // print(json['response']);

      if(json['status']['status'] == 200){
        print('Login Berhasil berhasil');
        saveUserData(
            id_mahasiswa: json['data_mahasiswa']['id_mahasiswa'],
            nama: json['data_mahasiswa'] ['nama'],
            nim: json['data_mahasiswa']['nim'],
            prodi: json['data_mahasiswa']['prodi'],
            jenis_kelamin: json['data_mahasiswa']['jenis_kelamin'],
            password: json['data_mahasiswa']['password'],
            nomer_telepon: json['data_mahasiswa']['nomer_telepon'],
            email: json['data_mahasiswa']['email']
        );
      }

      return json;
    } on TimeoutException {
      return Future.error(
          'Server terlalu lama merespon, periksa sambungan internet Anda!');
    } on SocketException {
      return Future.error('Periksa sambungan internet Anda!');
    } catch (e) {
      // return Future.error('Username atau password tidak sesuai!');
      print('Error');
      return Future.error(e.toString());
    }
  }
}




