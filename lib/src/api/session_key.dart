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

import 'package:mpesa4dart/src/api/api.dart';
import 'package:mpesa4dart/src/constants/endpoints.dart';
import 'package:mpesa4dart/src/models/session_response.dart';
import 'package:mpesa4dart/src/utils/log.dart';
import 'package:mpesa4dart/src/utils/response.dart';

class SessionKey extends Api {
  Future<SessionResponse> generate() async {
    final response = Response<SessionResponse>(
      await http.get(Endpoints.getSession, encriptedKey),
      onTransform: (dynamic data, _) {
        return SessionResponse.fromJson(data)!;
      },
    );

    Log().debug('$runtimeType.fetch() -> Response', response);

    return response.data!;
  }
}
