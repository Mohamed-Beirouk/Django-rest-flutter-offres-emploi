import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workHive/presentations/components/default_button.dart';
import 'package:workHive/presentations/constants/constants.dart';

import '../../data/dataprovider/network_services.dart';

class EncryptAndSendFile extends StatefulWidget {
  @override
  _EncryptAndSendFileState createState() => _EncryptAndSendFileState();
}

class _EncryptAndSendFileState extends State<EncryptAndSendFile> {
  NetworkService networkService = new NetworkService();
  File? _file;
  Future<void> _selectFile() async {
    setState(() {
      _file = null;
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    String? fileName = result!.files.first.path;
    ;
    final file = File(fileName!);

    setState(() {
      _file = file;
    });
  }

  Future<void> _encryptAndSendFile() async {
    if (_file == null) {
      return;
    }

    networkService.sendFile(_file, 'intitule');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
              width: 200,
              height: 200,
              child: DefaultButton(
                onTap: _selectFile,
                buttoncolor: darkgreycolor,
                text: 'Selectioner un fichier a uploader',
                textcolor: Colors.black,
                borderRadius: 10,
                width: double.infinity,
                height: 57,
              ),
            ),

            if (_file != null)

            DefaultButton(
              onTap: _encryptAndSendFile,
              buttoncolor: darkgreycolor,
              text: 'Encrypter et envoyer',
              textcolor: Colors.black,
              borderRadius: 10,
              width: double.infinity,
              height: 57,
            ),
          ],
        ),
    ),
      );
  }

  // Future<List<int>> encryptFile(File file, String key) async {
  //   final plainText = await file.readAsBytes();
  //   final keyBytes = utf8.encode(key);
  //
  //   final keyParam = KeyParameter(keyBytes);
  //   final iv = Uint8List.fromList(List.generate(16, (i) => i));
  //
  //   final aes = AESFastEngine();
  //   final cipher = BlockCipher(aes, Padding('PKCS7'));
  //
  //   final params = ParametersWithIV(keyParam, iv);
  //   cipher.init(true, params);
  //
  //   final encrypted = cipher.process(plainText);
  //   return encrypted;
  // }
}
