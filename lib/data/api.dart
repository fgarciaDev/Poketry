import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> fetchData(
    String base, String? path, Map<String, dynamic>? queryParams) async {
  var url = Uri.https(base, path ?? '', queryParams);
  final response = await http.get(url);

  if (response.statusCode != 200) {
    debugPrint('Error [$base$path]: statusCode: ${response.statusCode}');
  }
  return response;
}
