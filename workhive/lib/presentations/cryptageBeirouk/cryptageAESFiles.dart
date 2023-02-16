import 'dart:io';

import 'package:aes_crypt_null_safe/aes_crypt_null_safe.dart';
import 'package:workHive/presentations/cryptageBeirouk/randomservices.dart';
import 'package:path/path.dart';

class EncryptionService {
  final RandomService _randomService = RandomService();


   Future<String> encryptFilev2(File file) async {
    final crypt = AesCrypt();
    final password = "TEjDDnThDGH1VRjh";
    print("Passssword : "+password);
    crypt.setPassword(password);
    crypt.setOverwriteMode(AesCryptOwMode.rename);
    final encryptedFilePath = join(file.parent.path, basename(file.path) + '.odin');
    crypt.encryptFileSync(file.path, encryptedFilePath);
    return encryptedFilePath;
  }

   Future<String> decryptFileV2(File file) async {
    final crypt = AesCrypt();
    crypt.setPassword("TEjDDnThDGH1VRjh");
    crypt.setOverwriteMode(AesCryptOwMode.rename);
    file = await file.rename(file.path.substring(0, file.path.length - 5) + ".aes");
    final decryptedFilePath = crypt.decryptFileSync(
        file.path, join(file.parent.path, basenameWithoutExtension(file.path)));
    File decryptedFile = File(decryptedFilePath);
    return decryptedFile.path;
  }
}