import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/model.dart';

class HomeRepository {
  Future<List<Datum>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    return compute(parseData, response.body);
  }

  List<Datum> parseData(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Datum>((json) => Datum.fromJson(json)).toList();
  }
}
