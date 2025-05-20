import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtil {
  static final String baseURL = "http://192.168.1.61:8080";
  static final Map<String, String> _defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// GET request
  static Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.parse(baseURL + url),
      headers: headers ?? _defaultHeaders,
    );
    return _handleResponse(response);
  }

  /// POST request
  static Future<dynamic> post(String url,
      {dynamic body, Map<String, String>? headers}) async {
    final response = await http.post(
      Uri.parse(baseURL + url),
      headers: headers ?? _defaultHeaders,
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  /// PUT request
  static Future<dynamic> put(String url,
      {dynamic body, Map<String, String>? headers}) async {
    final response = await http.put(
      Uri.parse(baseURL + url),
      headers: headers ?? _defaultHeaders,
      body: jsonEncode(body),
    );
    return _handleResponse(response);
  }

  /// DELETE request
  static Future<dynamic> delete(String url,
      {dynamic body, Map<String, String>? headers}) async {
    final request = http.Request("DELETE", Uri.parse(baseURL + url));
    request.headers.addAll(headers ?? _defaultHeaders);
    if (body != null) {
      request.body = jsonEncode(body);
    }

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();
    return _handleRawResponse(response.statusCode, responseBody);
  }

  static Future<dynamic> putFormData(
    String url, {
    Map<String, String>? fields,
    List<http.MultipartFile>? files,
    Map<String, String>? headers,
  }) async {
    final request = http.MultipartRequest('PUT', Uri.parse(baseURL + url));
    request.headers.addAll(headers ?? {});
    if (fields != null) request.fields.addAll(fields);
    if (files != null) request.files.addAll(files);

    final streamedResponse = await request.send();
    final responseBody = await streamedResponse.stream.bytesToString();
    return _handleRawResponse(streamedResponse.statusCode, responseBody);
  }

  /// Handle response for GET/POST/PUT
  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception("HTTP Error ${response.statusCode}: ${response.body}");
    }
  }

  /// Handle raw response (DELETE)
  static dynamic _handleRawResponse(int statusCode, String body) {
    if (statusCode >= 200 && statusCode < 300) {
      return body.isNotEmpty ? jsonDecode(body) : null;
    } else {
      throw Exception("HTTP Error $statusCode: $body");
    }
  }

  static String mapUrl(String url) {
    if (!url.startsWith("/")) return "$baseURL/$url";
    return "$baseURL$url";
  }
}
