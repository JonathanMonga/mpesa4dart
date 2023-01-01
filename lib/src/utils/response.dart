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

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mpesa4dart/src/constants/api_params.dart';
import 'package:mpesa4dart/src/constants/message.dart';
import 'package:mpesa4dart/src/constants/response_code.dart';
import 'package:mpesa4dart/src/mpesa4dart.dart';
import 'package:mpesa4dart/src/utils/exceptions.dart';
import 'package:mpesa4dart/src/utils/log.dart';
import 'package:mpesa4dart/src/utils/response_status.dart';

typedef TransformFunction<T> = T Function(dynamic data);

class Response<T> {
  factory Response(http.Response response,
      {TransformFunction<T>? onTransform, bool shouldThrow = true}) {
    final reponseStatus = Status(response.statusCode);
    try {
      final dynamic jsonResponse = json.decode(response.body);

      if (jsonResponse == null ||
          (jsonResponse is! Map && jsonResponse is! List)) {
        throw ResponseException(reponseStatus.code, response.reasonPhrase!);
      }

      final String responseCode = jsonResponse is Map &&
              jsonResponse.containsKey(ApiParams.OutputResponseCode) &&
              reponseStatus.isOk
          ? jsonResponse[ApiParams.OutputResponseCode]
          : ResponseCode.INS_989;

      final String message = ResponseStatus(code: responseCode).message!;

      if (reponseStatus.isNotOk) {
        throw ResponseException(reponseStatus.code, responseCode, message);
      }

      return Response._(
        status: reponseStatus,
        message: message,
        data: onTransform != null ? onTransform(jsonResponse) : null,
      );
    } catch (e) {
      Log().error('Response.catch', e);
      final message = reponseStatus.code == HttpStatus.badGateway &&
              MPesa4Dart().production!
          ? Message.errorMessage
          : e.toString();

      if (shouldThrow) {
        if (reponseStatus.isForbidden) {
          throw ForbiddenException(message);
        }

        if (reponseStatus.isNotAuthorized) {
          throw UnAuthorisedException(message);
        }

        if (reponseStatus.isBadRequest) {
          throw BadRequestException(message);
        }

        throw ResponseException(reponseStatus.code, message);
      }

      return Response._(status: reponseStatus, message: message);
    }
  }

  Response._({required this.status, required this.message, this.data});

  final Status status;
  final String message;
  final T? data;

  @override
  String toString() => ({
        'status': status.code,
        'message': message,
        'data': data?.toString()
      }).toString();
}

class Status {
  Status(this.code);

  final int code;

  bool get isOk => code >= HttpStatus.ok && code < HttpStatus.multipleChoices;

  bool get isNotOk => !isOk;

  bool get isBadRequest => code == HttpStatus.badRequest;

  bool get isNotFound => code == HttpStatus.notFound;

  bool get isNotAuthorized => code == HttpStatus.unauthorized;

  bool get isForbidden => code == HttpStatus.forbidden;
}
