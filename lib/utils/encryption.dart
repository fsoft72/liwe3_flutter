import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

Key buildKey(String masterPassword) {
  // use masterPassword to generate Key
  // convert masterPassword into md5 hash
  // convert md5 hash into 32 bytes
  final mp = md5.convert(utf8.encode(masterPassword)).bytes;
  final mp32 = mp.sublist(0, 16) + mp.sublist(0, 16).reversed.toList();
  final b64 = base64.encode(mp32);

  return encrypt.Key.fromBase64(b64);
}

IV buildIV(String masterPassword) {
  final mp = md5.convert(utf8.encode(masterPassword)).bytes;
  final mp16 = mp.sublist(0, 16);
  final b64 = base64.encode(mp16);

  return encrypt.IV.fromBase64(b64);
}

// Encrypt a string using AES and returns a string encrypted
String encryptString(String source, String masterPassword) {
  final key = buildKey(masterPassword);
  final iv = buildIV(masterPassword);

  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final encrypted = encrypter.encrypt(source, iv: iv);

  return encrypted.base64;
}

String decryptString(String source, String masterPassword) {
  final key = buildKey(masterPassword);
  final iv = buildIV(masterPassword);

  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final decrypted = encrypter.decrypt64(source, iv: iv);

  return decrypted;
}

String toMD5(String source) {
  return md5.convert(utf8.encode(source)).toString();
}
