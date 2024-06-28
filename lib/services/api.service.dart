import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class Apiservice {
  Future get(String url);
  Future post(String url, Map body);
}

class ApiserviceImpl implements Apiservice {
  final Map<String, String> _headers = {};

  @override
  Future get(String url) async {
    try {
      final uri = Uri.parse(url);

      _headers['Content-Type'] = 'application/json';

      final response = await http.get(uri, headers: _headers);
      if (response.statusCode != 200) throw response.statusCode;
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future post(String url, Map body) async {
    try {
      final uri = Uri.parse(url);
      final request = jsonEncode(body);

      _headers['Content-Type'] = 'application/json';

      final response = await http.post(uri, body: request, headers: _headers);
      if (response.statusCode != 200) throw response.statusCode;
      final data = jsonDecode(response.body);

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
