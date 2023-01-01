// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:mpesa4dart/src/api/session_key.dart';
import 'package:mpesa4dart/src/mpesa4dart.dart';

void main() async {
  final publicKey = await File('test/public.pem').readAsString();
  final apiKey = await File('test/api_key.pem').readAsString();

  MPesa4Dart.init(publicKey: publicKey, apiKey: apiKey, production: false);

  SessionKey().generate().then((value) {
    print(value.outputSessionID);
  });
}
