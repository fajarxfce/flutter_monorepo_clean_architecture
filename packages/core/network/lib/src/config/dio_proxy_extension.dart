import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';

extension DioProxyExtension on Dio {
  void applyProxy({required bool isProxy, required String proxyUrl}) {
    if (isProxy && !kIsWeb) {
      httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();

          client.findProxy = (uri) {
            return 'PROXY $proxyUrl; DIRECT';
          };

          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;

          return client;
        },
      );
    }
  }
}
