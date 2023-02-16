import 'dart:io';

import 'package:file_cryptor/file_cryptor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_combo_box/components/combo_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:workHive/cubit/ProfileCubit.dart';
import 'package:workHive/data/dataprovider/network_services.dart';
import 'package:workHive/presentations/components/default_button.dart';
import 'package:workHive/presentations/constants/constants.dart';
import 'package:workHive/presentations/cryptageBeirouk/cryptagefunctions.dart';
import 'package:workHive/size_config.dart';

import '../cryptageBeirouk/cryptageAESFiles.dart';

class AddDocument extends StatefulWidget {

  @override
  State<AddDocument> createState() => _AddDocument();
}
class Gender{
  final String? title;
  final String? subtitle;

  Gender({this.title, this.subtitle});
}
class _AddDocument extends State<AddDocument> {

  var genders = ['CV', 'identity', 'diplome', 'certificat'];
  var genderTitleSubTitles = [
    Gender(title: 'cv'     , subtitle: 'votre CV')
  ];

  late Future<List<dynamic>> datas;

  String selectedGender = 'CV';
  String didHeSelectAFile = 'Selectioner un fichier a uploader';
  var selectedGenderTitleSubTitle = Gender();
  bool? filledColor = false;
  String hintText = '';
  String typedocument ='';
  TextEditingController typedocumentController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  NetworkService networkService = new NetworkService();
  EncryptionService encryptionService = new EncryptionService();
  File? _file;

  Future<void> _selectFile() async {
    setState(() {
      _file = null;
    });


    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
    String? fileName = result!.files.first.path;


    final file = File(await Encrypt.encrypt_file_aes(fileName!));

    didHeSelectAFile = (fileName.toString().split("/").last).split(".")[0]+(fileName.toString().split("/").last).split(".")[1];

    setState(() {
      _file = file;
    });
  }

  Future<int> encryptAndSendFile() async {
    if (_file == null) {
      return 101;
    }
    StreamedResponse? response;
    networkService.sendFile(_file, selectedGender).then((value){
      response= value;
    });
    if (response?.statusCode == 400 || response?.statusCode == 500) {
      print('File sent successfully');
      return 400;
    }
    else {
      return 201;
    }
    return 500;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          getProportionateScreenWidth(20),
          getProportionateScreenHeight(25),
          getProportionateScreenWidth(20),
          getProportionateScreenHeight(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ajouter un document',
                style: textstyle.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: getProportionateScreenHeight(22)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  "assets/svg/close.svg",
                ),
              ),
            ],
          ),
          spaceHeight(5),
          Text(
            'Vos fichier sont cryptes, uploader sans tn5l3u',
            style: textstyle.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: getProportionateScreenHeight(12)),
          ),
          spaceHeight(25),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    labelText: 'Document',
                    hintText: 'Selectionner type de document',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w800),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black26),
                      gapPadding: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black26),
                      gapPadding: 16,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.black26),
                      gapPadding: 16,
                    ),
                  ),
                  items: genders.map((item) {
                    return DropdownMenuItem(
                      child: TileTitle(title: item, accent: primaryColor),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (value) => setState(() =>
                  selectedGender = value ?? 'N/A',

                  ),
                  value: selectedGender,
                ),
                spaceHeight(getProportionateScreenHeight(20)),
                Text(
                  'uploader document',
                  style: textstyle.copyWith(fontSize: 12),
                ),
                spaceHeight(10),
                 Container(
                   child: DefaultButton(
                    onTap: _selectFile,
                    buttoncolor: blueIcondesactivate,
                    text: didHeSelectAFile,
                    textcolor: Colors.black,
                    borderRadius: 10,
                    width: double.infinity,
                    height: 57,
                ),
                 ),
                spaceHeight(30),


              ],
            ),
          ),
          spaceHeight(20),
          DefaultButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                if (_file != null){
                  print(_file!.path);
                  encryptAndSendFile().then((value) {
                    if(value == 201){
                      final snackBar = SnackBar(
                        backgroundColor: Colors.green,
                        content: const Text('Done with succes'),
                        action: SnackBarAction(
                          textColor: Colors.black,
                          label: 'cacher',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    }
                    else{
                      final snackBar = SnackBar(
                        backgroundColor: Colors.red,
                        content: const Text('Ressayer plus tard'),
                        action: SnackBarAction(
                          label: 'cacher',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  });
                }
                else{
                  final snackBar = SnackBar(

                    backgroundColor: Colors.red,
                    content: const Text('Vous n\'avez pas encore selectionner un fichier'),
                    action: SnackBarAction(
                      label: 'cacher',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }

              } else {
                setState(() {
                  filledColor = true;
                });
              }
            },
            buttoncolor: primaryColor,
            text: 'Submit',
            borderRadius: 10,
            width: double.infinity,
            height: 57,
          ),
        ],
      ),
    );
  }
}