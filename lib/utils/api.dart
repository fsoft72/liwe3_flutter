// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../stores/app.dart';
import 'debug.dart';

class DataStore {
  Map<String, dynamic> _dataMap = {};

  DataStore(Object dataObject) {
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
}

class ApiService extends GetConnect {
  _headers(headers) {
    headers ??= {};
    headers['Authorization'] = 'Bearer ${appStore.token}';

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

    if (res.statusCode! >= 300) {
      final err = res.body['error'] ?? {'message': 'Unknown error'};
      // showError("Error from Server", err['message'], code: res.statusCode.toString());
      zprint("Error from Server: ${err['message']}");
      return null;
    }

    return DataStore(res.body);
  }

  Future doPOST(String url, dynamic body, {Map<String, String>? headers}) async {
    headers = _headers(headers);
    url = _url(url);

    final res = await post('${appStore.baseURL}$url', body, headers: headers);

    return _checkResponse(res);
  }

  Future doPATCH(String url, dynamic body, {Map<String, String>? headers}) async {
    headers = _headers(headers);
    url = _url(url);

    final res = await patch('${appStore.baseURL}$url', body, headers: headers);

    return _checkResponse(res);
  }

  Future doGET(String url, {Map<String, String>? headers, Map<String, dynamic>? query}) async {
    headers = _headers(headers);
    url = _url(url);

    final res = await get('${appStore.baseURL}$url', headers: headers, query: query);

    return _checkResponse(res);
  }
}
