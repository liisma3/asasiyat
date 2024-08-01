import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionService {
  // The singleton instance
  static final EncryptionService _instance = EncryptionService._internal();

  // Private constructor
  EncryptionService._internal();

  // Factory constructor to return the same instance
  factory EncryptionService() {
    return _instance;
  }

  // Encryption key
  encrypt.Key? _key;

  // Method to initialize the encryption key
  void init() {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final mykey =
        List.generate(32, (index) => _chars[r.nextInt(_chars.length)]).join();
    print(mykey);
    _key = encrypt.Key.fromBase64(mykey);
    print(_key);
  }

  // Method to encrypt data
  String encryptData(String plainText) {
    if (_key == null) {
      throw Exception('Encryption key is not initialized.');
    }
    final iv = encrypt.IV.fromLength(16); // Generate a random IV
    final encrypter =
        encrypt.Encrypter(encrypt.AES(_key!, mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    final ivBase64 = iv.base64;
    final encryptedBase64 = encrypted.base64;

    return '$ivBase64:$encryptedBase64'; // Store IV and ciphertext together
  }

  // Method to decrypt data
  String decryptData(String encryptedData) {
    if (_key == null) {
      throw Exception('Encryption key is not initialized.');
    }
    final parts = encryptedData.split(':');
    final iv = encrypt.IV.fromBase64(parts[0]); // Extract the IV
    final encrypted = encrypt.Encrypted.fromBase64(parts[1]);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(_key!, mode: encrypt.AESMode.cbc));
    final decrypted = encrypter.decrypt(encrypted, iv: iv);

    return decrypted;
  }
}
/**String encrypt(String str) {
    final key = Encrypt.Key.fromBase64('your 44 char key');
    final iv = Encrypt.IV.fromLength(16);
    final encrypter = Encrypt.Encrypter(Encrypt.AES(key));

    final encrypted = encrypter.encrypt(str, iv: iv);
    return encrypted.base64;
}

String decrypt(String str) {
    final key = Encrypt.Key.fromBase64('your 44 char key');
    final iv = Encrypt.IV.fromLength(16);
    final encrypter = Encrypt.Encrypter(Encrypt.AES(key));

    final encrypted = Encrypt.Encrypted.fromBase64(str);
    return encrypter.decrypt(encrypted, iv: iv);
} */