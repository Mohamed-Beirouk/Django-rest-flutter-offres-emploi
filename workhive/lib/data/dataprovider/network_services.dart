
import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NetworkService {

  String BASE_URL = 'http://192.168.85.41:8080/';

  Future<Response?> login(String phone, String password) async {
    try {
      return await post(
          Uri.parse(BASE_URL+'login/'),
          body: {
            'username' : phone,
            'password' : password
          });

    } catch (e) {
      return null;
    }
  }

  Future<void> sendFile(File? file, String intitule) async {

    var request = http.MultipartRequest('POST', Uri.parse(BASE_URL+'document/'));

    var filePart = http.MultipartFile.fromBytes('cv', await file!.readAsBytes(), filename: file.path);

    request.files.add(filePart);
    request.fields['intitule'] = intitule;
    request.fields['c_emploi'] = "8";
    var response = await request.send();
    if (response.statusCode == 201) {
      print('File sent successfully');
    } else {
      print('File sending failed');
    }
  }

  Future<String?> uploadFile(filename, url) async {

    var request = http.MultipartRequest('POST', Uri.parse(BASE_URL+'document/'));
    request.files.add(await http.MultipartFile.fromPath('cv', filename));

    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<Response?> jobs() async {

    try {
      final prefs = await SharedPreferences.getInstance();
      final token_u = prefs.getString('token');
      return await http
          .get(Uri.parse('http://192.168.85.41:8080/jobs/'),
          headers:  {"Accept-Charset": "utf-8", "Authorization": 'JWT '+token_u!});

    } catch (e) {
      return null;
    }
  }

  Future<File?> pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
      String? fileName = result!.files.first.path;
      return File(fileName!);
    } catch (e) {
      print("Error while picking the file: " + e.toString());
      return null;
    }
  }


}

class FileEcryptionApi {

  static Future<Uint8List?> encryptFile(data) async {
    final key = Key.fromSecureRandom(16);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encryptedFile = encrypter.encryptBytes(data, iv: iv);
    return encryptedFile.bytes;
  }
}
