/*
 * Created on Sun Jan 01 2023
 *
 * The MIT License (MIT)
 * Copyright (c) 2023 Jonathan Monga jmonga98@gmail.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 * and associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial
 * portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
 * TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mpesa4dart/src/utils/exceptions.dart';
import 'package:mpesa4dart/src/utils/log.dart';

class HttpWrapper {
  HttpWrapper({required this.baseUrl});

  final String baseUrl;

  Future<http.Response> get(String url, String encriptedKey) {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Origin': '*',
      'Authorization': 'Bearer $encriptedKey'
    };
    try {
      Log().debug('HttpWrapper.get() -> $url');
      return http.get(Uri.parse(baseUrl + url), headers: headers);
    } on TimeoutException {
      throw TimeOutException();
    }
  }

  Future<http.Response> post(
      String url, String encriptedKey, Map<String, dynamic> data) {
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Origin': '*',
      'Authorization': 'Bearer $encriptedKey'
    };

    try {
      final body = json.encode(data);
      Log().debug('HttpWrapper.post() -> $url', body);
      return http.post(Uri.parse(baseUrl + url), headers: headers, body: body);
    } on TimeoutException {
      throw TimeOutException();
    }
  }
}
