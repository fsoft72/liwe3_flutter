// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../components/button.dart';
import '../stores/theme.dart';
import '../stores/app.dart';
import '../utils/api.dart';
import '../utils/debug.dart';

Future<Widget> apiScreen() async {
  var serv = LiWEAPIGateway();

  void user_me() async {
    DataStore? res = await serv.doGET("/api/user/me");

    if (res != null) {
      if (res.contains("error")) {
        zprint("Error: ${res['error']}");
        return;
      }
    }
  }

  void user_login() async {
    DataStore? res = await serv.doPOST('/api/user/login', {
      "username": "..admin",
      "password": "UserAdmin1!",
      "recaptcha": "test",
    });

    if (res != null) {
      if (res.contains("error")) {
        zprint("Error: ${res['error']}");
        return;
      }
      appStore.saveTokens(res['access_token'], res['refresh_token']);
      appStore.setUser(res['id'], res['username'], res['name'], res['lastname'], res['email']);

      appStore.dump();
    }
  }

  return Center(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Centers the buttons
            children: [
              Button(
                label: "Login ME",
                mode: LiWETheme.info,
                onClick: (_) {
                  user_login();
                },
              ),
              Button(
                label: "User ME",
                mode: LiWETheme.error,
                onClick: (_) {
                  user_me();
                },
              ),
              const SizedBox(width: 10), // Adds a gap of 10 pixels
            ],
          ),
        ],
      ),
    ),
  );
}
