import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  // Private constructor
  HttpService._privateConstructor();

  // The single instance
  static final HttpService _instance = HttpService._privateConstructor();

  // Factory constructor returns the same instance
  factory HttpService() {
    return _instance;
  }

  final String _baseUrl = 'https://freefakeapi.io/authapi';

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed GET: ${response.statusCode}');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$_baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed POST: ${response.statusCode}');
    }
  }
}
