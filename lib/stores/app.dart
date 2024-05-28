import 'package:get/get.dart';

import '../utils/debug.dart';

class AppStore extends GetxController {
  String baseURL = '';
  String token = '';
  String refreshToken = '';

  String username = '';
  String name = '';
  String lastname = '';
  String email = '';
  String uid = '';

  tokensSave(String token, String refreshToken) {
    this.token = token;
    this.refreshToken = refreshToken;
  }

  userSet(String uid, String username, String name, String lastname, String email) {
    this.uid = uid;
    this.username = username;
    this.name = name;
    this.lastname = lastname;
    this.email = email;
  }

  dump() {
    zprint("=== AppStore ===");
    zprint("=== baseURL: $baseURL");
    zprint("=== token: $token");
    zprint("=== refreshToken: $refreshToken");
    zprint("=== username: $username");
    zprint("=== name: $name");
    zprint("=== lastname: $lastname");
    zprint("=== email: $email");
    zprint("=== uid: $uid");
  }
}

final AppStore appStore = AppStore();
