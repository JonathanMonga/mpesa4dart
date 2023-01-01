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

// ignore_for_file: depend_on_referenced_packages

import 'package:encrypt/encrypt.dart';
import 'package:basic_utils/basic_utils.dart';

class Encryption {
  const Encryption({required this.publicKey});

  static const String _begin = X509Utils.BEGIN_PKCS7;
  static const String _end = X509Utils.END_PKCS7;

  final String publicKey;

  String encrypt(String key) {
    var formatedKey = X509Utils.formatKeyString(publicKey, _begin, _end);
    var rsaPublicKey = CryptoUtils.rsaPublicKeyFromPem(formatedKey);
    Encrypter encrypter;
    Encrypted encrypted;

    encrypter = Encrypter(RSA(publicKey: rsaPublicKey));
    encrypted = encrypter.encrypt(key);

    return encrypted.base64;
  }
}
