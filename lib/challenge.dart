import 'dart:convert';
import 'package:crypto/crypto.dart';

String challengeCreate(List<String> params, String secret) {
  List<String> s = params.map((p) => p.toString().toLowerCase()).toList();
  s.sort();
  s.add(secret);
  final String s1 = s.join('-');

  String ckey = s1;

  // remove all starting '-' chars
  while (ckey.startsWith('-')) {
    ckey = ckey.substring(1);
  }

  // print("=== challengeCreate: $ckey");

  return md5.convert(utf8.encode(ckey)).toString();
}
