import 'dart:convert';

import 'package:http/http.dart' as http;

interface class IRestClient {
  Future<String> get<T>({required String url, Map<String, http.Response>? queryParameters}) async => "";
  Future<String> post<T>({
    required String url,
    required dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async =>
      "";
}

class RestClient implements IRestClient {
  @override
  Future<String> get<T>({required String url, Map<String, dynamic>? queryParameters}) async {
    final Uri uri = Uri.parse(url);
    final http.Response response = await http.get(uri);
    return response.body;
  }

  @override
  Future<String> post<T>({
    required String url,
    required dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    final Uri uri = Uri.parse(url);
    final http.Response response = await http.post(uri, body: json.encode(body), headers: headers);
    return response.body;
  }
}
