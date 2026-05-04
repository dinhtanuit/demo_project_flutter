import 'dart:convert';
import 'package:http/http.dart' as http;

/// Base API client cho toàn bộ app
class ApiClient {
  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  /// GET request
  Future<Map<String, dynamic>> get(String url) async {
    final response = await _client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'GET request failed: ${response.reasonPhrase}',
      );
    }
  }

  /// POST request
  Future<Map<String, dynamic>> post(
    String url, {
    Map<String, dynamic>? body,
  }) async {
    final response = await _client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: body != null ? jsonEncode(body) : null,
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw ApiException(
        statusCode: response.statusCode,
        message: 'POST request failed: ${response.reasonPhrase}',
      );
    }
  }

  void dispose() {
    _client.close();
  }
}

/// Custom exception cho API errors
class ApiException implements Exception {
  final int statusCode;
  final String message;

  const ApiException({required this.statusCode, required this.message});

  @override
  String toString() => 'ApiException($statusCode): $message';
}
