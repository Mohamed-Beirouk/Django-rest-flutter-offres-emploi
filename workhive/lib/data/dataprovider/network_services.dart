
import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workHive/presentations/constants/strings.dart';
import 'package:workHive/presentations/cryptageBeirouk/cryptagefunctions.dart';

class NetworkService {

  //http://192.168.41.42:8080/document/

  Future<Response?> login(String phone, String password) async {
    try {
      return await post(
          Uri.parse(BASE_URL+'/login/'),
          body: {
            'username' : phone,
            'password' : password
          });
    } catch (e) {
      return null;
    }
  }

  Future<StreamedResponse> sendFile(File? file, String intitule) async {
    print("from batou mbedde"+intitule.toString());

    var request = http.MultipartRequest('POST', Uri.parse(BASE_URL+'/document/'));

    var filePart = http.MultipartFile.fromBytes('cv', await file!.readAsBytes(), filename: file.path);

    request.files.add(filePart);
    request.fields['intitule'] = intitule;
    request.fields['c_emploi'] = "8";
    return  await request.send();

  }

  Future<String?> uploadFile(filename, url) async {



    var request = http.MultipartRequest('POST', Uri.parse(BASE_URL+'/document/'));
    request.files.add(await http.MultipartFile.fromPath('cv', filename));

    var res = await request.send();
    return res.reasonPhrase;
  }

  Future<Response?> jobs() async {

    try {
      final prefs = await SharedPreferences.getInstance();
      final token_u = prefs.getString('token');
      return await http
          .get(Uri.parse(BASE_URL+'/jobs/'),
          headers:  {"Accept-Charset": "utf-8", "Authorization": 'JWT '+token_u!});

    } catch (e) {
      return null;
    }
  }

  Future<Response?> getDocuments() async {

    try {
      final prefs = await SharedPreferences.getInstance();
      final token_u = prefs.getString('token');
      return await http
          .get(Uri.parse(BASE_URL+'/document/'),
          headers:  {"Accept-Charset": "utf-8", "Authorization": 'JWT '+token_u!});

    } catch (e) {
      return null;
    }
  }

  static Future<File> getAFile(String filrUrl) async {
      var response = await http.get(Uri.parse(filrUrl));
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      print("temppp : "+tempPath);
      var file = File(tempPath+"/"+filrUrl.toString().split("/").last);
     return  await file.writeAsBytes(response.bodyBytes);
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
