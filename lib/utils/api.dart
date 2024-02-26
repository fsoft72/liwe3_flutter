// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get.dart';

import '../stores/app.dart';
import 'debug.dart';

class DataStore {
  Map<String, dynamic> _dataMap = {};

  DataStore(Object dataObject) {
    // dataObject is a string, we need to convert it to a map
    if (dataObject is String) {
      dataObject = jsonDecode(dataObject);
    }
    var data = dataObject as Map<String, dynamic>;
    _dataMap = Map<String, dynamic>.from(data);
  }

  bool get isEmpty => _dataMap.isEmpty;

  setValue(String key, dynamic value) {
    _dataMap[key] = value;
  }

  contains(String key) {
    return _dataMap.containsKey(key);
  }

  dynamic operator [](String key) {
    final value = _dataMap[key] ?? '';

    return value;
    // return _dataMap.containsKey(key) ? _dataMap[key] : '';
  }

  dump() {
    zprint(jsonEncode(_dataMap));
  }
}

class LiWEAPIGateway extends GetConnect {
  _headers(headers) {
    headers ??= <String, String>{};

    if (appStore.token.isNotEmpty) {
      headers['Authorization'] = 'Bearer ${appStore.token}';
    }

    return headers;
  }

  _url(String url) {
    if (url.startsWith('http')) {
      return url;
    }

    // if url starts with /, remove it
    if (url.startsWith('/')) {
      url = url.substring(1);
    }

    return "${appStore.baseURL}/$url";
  }

  _refreshToken() async {
    // We don't want the old token to be present while refreshing
    appStore.token = '';

    zprint("==== REFRESH TOKEN");

    if (appStore.refreshToken.isEmpty) {
      return false;
    }

    var url = _url('/api/user/login/refresh');

    var res = await post(url, jsonEncode({"token": appStore.refreshToken}), headers: _headers(null));

    DataStore? resp = _checkResponse(res);

    if (resp == null) return false;
    if (resp.contains("error")) return false;

    appStore.saveTokens(resp['access_token'], resp['refresh_token']);
    return true;
  }

  _checkResponse(Response res) {
    // check if the response is valid
    if (res.statusCode == null) {
      // show an alert using GetX
      // showError("Error", "Wallet server unreachable", code: ERR_WALLET_SERVER_NOT_REACHABLE.toString());
      zprint("Error: Server unreachable");
      return null;
    }

    if (res.statusCode == 404) {
      String url = res.request?.url.toString() ?? '';

      // remove the base url from the url
      url = url.replaceAll(appStore.baseURL, '');

      // showError("Error", "Method not found: $url", code: "404");
      zprint("Error: Method not found: $url");
      return null;
    }

    // convert body to DataStore
    final ds = DataStore(res.body);

    if (res.statusCode! >= 300) {
      final err = ds['error'] ?? {"message": 'Unknown error'};
      // showError("Error from Server", err['message'], code: res.statusCode.toString());
      zprint("Error from Server: (${res.statusCode}) ${err['message']}");
      return ds;
    }

    return ds;
  }

  Future doPOST(String url, dynamic body, {Map<String, String>? headers}) async {
    headers = _headers(headers);
    url = _url(url);

    var res = await post(url, jsonEncode(body), headers: headers);

    if (res.statusCode == 401) {
      if (await _refreshToken()) {
        headers = _headers(headers);
        res = await post(url, jsonEncode(body), headers: headers);
      }
    }

    return _checkResponse(res);
  }

  Future doPATCH(String url, dynamic body, {Map<String, String>? headers}) async {
    headers = _headers(headers);
    url = _url(url);

    var res = await patch(url, jsonEncode(body), headers: headers);

    if (res.statusCode == 401) {
      if (await _refreshToken()) {
        headers = _headers(headers);
        res = await patch(url, jsonEncode(body), headers: headers);
      }
    }

    return _checkResponse(res);
  }

  Future doGET(String url, {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    headers = _headers(headers);
    url = _url(url);

    var res = await get(url, headers: headers, query: query);

    if (res.statusCode == 401) {
      if (await _refreshToken()) {
        headers = _headers(headers);
        res = await get(url, headers: headers, query: query);
      }
    }

    return _checkResponse(res);
  }
}
