import 'dart:convert';

import 'package:armazenamento_interno/http/interceptors/logging_interceptor.dart';
import 'package:armazenamento_interno/models/contact.dart';
import 'package:armazenamento_interno/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/http_interceptor.dart';

final Client client = InterceptedClient.build(
  interceptors: [LoggingInterceptor()],
);

const String baseUrl = '192.168.1.124:8080';
const String local = 'transactions';

