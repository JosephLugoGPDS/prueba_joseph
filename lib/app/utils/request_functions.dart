import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class RequestFunctions {

    static Future<http.Response> postFunction(
        String path, Map<String, dynamic> body, Map<String, String> headers) async {
      http.Response response = await http.post(
        Uri.parse(path),
        body: json.encode(body),
        headers: headers,
        ).timeout(
          const Duration(milliseconds: 30000),
          onTimeout: () => http.Response('[TIMEOUT EXCEPTION]', 408),
        );
      return response;
    }

    static Future<http.Response> getFunction(
        String path, Map<String, String> headers) async {
      http.Response response = await http.get(
        Uri.parse(path),
        headers: headers,
        ).timeout(
          const Duration(milliseconds: 30000),
          onTimeout: () => http.Response('[TIMEOUT EXCEPTION]', 408),
        );
      return response;
    }

    static Future<http.Response> putFunction(
        String path, Map<String, dynamic> body, Map<String, String> headers) async {
      http.Response response = await http.put(
        Uri.parse(path),
        body: json.encode(body),
        headers: headers,
        ).timeout(
          const Duration(milliseconds: 30000),
          onTimeout: () => http.Response('[TIMEOUT EXCEPTION]', 408),
        );
      return response;
    }

    static Future<http.Response> deleteFunction(
        String path, Map<String, String> headers) async {
      http.Response response = await http.delete(
        Uri.parse(path),
        headers: headers,
        ).timeout(
          const Duration(milliseconds: 30000),
          onTimeout: () => http.Response('[TIMEOUT EXCEPTION]', 408),
        );
      return response;
    }
}



