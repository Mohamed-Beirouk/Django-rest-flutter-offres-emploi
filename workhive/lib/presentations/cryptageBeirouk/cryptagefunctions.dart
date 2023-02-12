import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';
import 'package:steel_crypt/steel_crypt.dart';

class Encrypt {


  static Future<String> decryptAES(String responseData, String responseKey) {

    print("key api"+responseKey);
    print("data api"+responseData);

    var myData = base64.decode(responseData);
    var myKey = base64.decode(responseKey);

    final enc = Encrypter(AES(Key.fromBase64(responseKey), mode: AESMode.ecb, padding: "PKCS7"));
    final encrypted = Encrypted.fromBase64(responseData);
    return Future.value(enc.decrypt(encrypted, iv: IV.fromLength(16)));

    // var cipher = AESEngine();
    // var key = KeyParameter(myKey);
    // cipher.init(false, key);
    //
    // var out = Uint8List(myData.length);
    // var i = 0;
    //
    // while (i < myData.length) {
    //   var len = cipher.processBlock(myData, i, out, i);
    //   i += len;
    // }
    //
    // int padLength = out[out.length - 1];
    // print("pad length : "+padLength.toString());
    // String decrypted = utf8.decode(out.sublist(0, out.length));
    // print("--------------------");
    // print("From cubit \n"+decrypted);
    // print("--------------------");
    // print('Decrypted text: $decrypted');
    // return Future.value(decrypted);




    // var myData = base64.decode(responseData);
    // var myKey = base64.decode(responseKey);
    // final blockCipher = AESEngine();
    // final key = KeyParameter(myKey);
    // blockCipher.init(false, key);
    // final padding = PKCS7Padding();
    // final paddedBlockCipher = PaddedBlockCipherImpl(padding, blockCipher);
    // final decrypted = paddedBlockCipher.process(myData);
    // print(decrypted);
    // return Future.value(utf8.decode(decrypted));


    // var cipher = AESEngine();
    // var key = KeyParameter(myKey);
    // cipher.init(false, key);
    //
    // var out = Uint8List(myData.length);
    // var i = 0;
    //
    // while (i < myData.length) {
    //   var len = cipher.processBlock(myData, i, out, i);
    //   i += len;
    // }
    //
    //
    // int padLength = out[out.length - 1];
    // print("pad length : "+padLength.toString());
    //
    // String decrypted = utf8.decode(out.sublist(0, out.length));
    //
    // print("--------------------");
    // print("From cubit \n"+decrypted);
    // print("--------------------");
    // print('Decrypted text: $decrypted');
    // return Future.value(decrypted);

    // var dataBytes = base64.decode(responseData);
    // var keyBytes = base64.decode(responseKey);
    // print(keyBytes);
    // // Create a cipher object using the AES algorithm
    // var cipher = AESEngine();
    // // Create the key and iv for the encryption
    // var key = KeyParameter(Uint8List.fromList(keyBytes));
    //
    //
    // // Decrypt the data
    // cipher.init(false, key);
    // int padding = responseData.codeUnitAt(responseData.length - 1);
    // dataBytes = utf8.encode(responseData.substring(0, responseData.length - padding));
    // var decrypted = cipher.process(Uint8List.fromList(dataBytes));
    // print("decrypted "+decrypted.toString());
    // return Future.value(utf8.decode(decrypted));
  }

  static Uint8List getBytesFromResponse(String response) {
    var responseBytes = response.codeUnits;
    var dataBytes = responseBytes.sublist(responseBytes.length);
    return Uint8List.fromList(dataBytes);
  }

  // static Future<Uint8List> decryptAES(String  encryptedData, String  key) async {
  //   print("key api"+key);
  //   print("data api"+encryptedData);
  //   Uint8List dataToDecrypt = Uint8List.fromList(utf8.encode(encryptedData));
  //   Uint8List publicKey = Uint8List.fromList(utf8.encode(key));
  //
  //   print("key after convertion"+publicKey.toString());
  //   print("data after convertion"+dataToDecrypt.toString());
  //
  //
  //   var publicKeyBytes = publicKey.sublist(2, publicKey.length - 1);
  //
  //   var cipher = new AESEngine();
  //   var params = new KeyParameter(publicKeyBytes);
  //   cipher.init(false, params);
  //   var output = new Uint8List(encryptedData.length);
  //   print("output"+output.toString());
  //   var length = cipher.processBlock(dataToDecrypt, 0, output, 0);
  //   return output.sublist(0, length);
  // }

  Future<String> decryptInfo(String data) async {
    var encodedKey = 'FCAcEA0HBAoRGyALBQIeCAcaDxYWEQQPBxcXH****** example';
    var decoded = base64.decode(data);
    var payload = json.decode(String.fromCharCodes(decoded));
    String encodedIv = payload["iv"]?? "";
    String value = payload["value"] ?? "";
    final key1 = enc.Key.fromBase64(encodedKey);
    final iv = enc.IV.fromBase64(encodedIv);
    final encrypter = enc.Encrypter(enc.AES(key1, mode: enc.AESMode.cbc));
    final decrypted = encrypter.decrypt(enc.Encrypted.fromBase64(value));

    return decrypted;
  }


  static Future<String>  encryptStringRSA(String plainText ) async {
    final publicPem = await rootBundle.loadString('assets/public_key.pem');
    final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    final privatePem = await rootBundle.loadString('assets/private_key.pem');
    final privateKey = RSAKeyParser().parse(privatePem) as RSAPrivateKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privateKey));
    final encrypted = encrypter.encrypt(plainText);
    return (encrypted.base64);
  }

  static Future<String> decryptStringRSA(String plainText ) async {

    final publicPem = await rootBundle.loadString('assets/public_key_flutter.pem');
    final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    final privatePem = await rootBundle.loadString('assets/private_key_django.pem');
    final privateKey = RSAKeyParser().parse(privatePem) as RSAPrivateKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey, privateKey: privateKey));
    return encrypter.decrypt64(plainText);
  }


  // Future<void> encryptFile(File file, String password) async {
  //   var key = KeyParameter(Uint8List.fromList(utf8.encode(password)));
  //   var iv = Uint8List.fromList(utf8.encode(password.substring(0, 16)));
  //   var params = ParametersWithIV(key, iv);
  //
  //   var encrypter = StreamCipher('AES/CBC/PKCS7');
  //   encrypter.init(true, params);
  //
  //   var input = file.openRead();
  //   var output = file.openWrite();
  //
  //   var transformer = StreamTransformer.fromHandlers(handleData: (data, sink) {
  //     var encryptedData = encrypter.process(data);
  //     sink.add(encryptedData);
  //   });
  //
  //   input.transform(transformer).pipe(output);
  //   await output.close();
  //   await input.close();
  //
  //   print('File encrypted successfully');
  // }
}