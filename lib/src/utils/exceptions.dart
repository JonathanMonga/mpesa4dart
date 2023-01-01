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

import 'dart:io';

import 'package:mpesa4dart/src/constants/message.dart';

class RedirectException extends ResponseException {
  RedirectException(this.url, [String? message])
      : super(HttpStatus.temporaryRedirect, 'Temporary Redirect', message);

  final String url;

  @override
  String toString() => '$runtimeType($statusCode, $status, $message, $url)';
}

class ForbiddenException extends ResponseException {
  ForbiddenException(String status, [String? message])
      : super(HttpStatus.forbidden, status, message);
}

class TimeOutException extends ResponseException {
  TimeOutException()
      : super(
            HttpStatus.requestTimeout, 'UNKNOWN', Message.timeoutErrorMessage);
}

class BadRequestException extends ResponseException {
  BadRequestException(String status, [String? message])
      : super(HttpStatus.badRequest, status, message);
}

class UnAuthorisedException extends ResponseException {
  UnAuthorisedException(String status, [String? message])
      : super(HttpStatus.unauthorized, status, message);
}

class ResponseException implements Exception {
  ResponseException(this.statusCode, this.status, [this.message]);

  final int statusCode;
  final String status;
  final String? message;

  @override
  String toString() => '$runtimeType($statusCode, $status, $message)';
}
