import 'dart:convert';

import 'package:dicoding_pertama_membuat_aplikasi_flutter/models/model_posts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Apiservice {
  final HOST = "jsonplaceholder.typicode.com";

  Uri _getURI(String path, {Map<String, String>? params}) {
    print("REQ $HOST$path $params");
    print("debugPrint Url : ${Uri.https(HOST, path, params)}");
    return Uri.https(HOST, path, params);
  }

  Future<List<dynamic>> getPosts() async {
    final url = "/posts";
    var uri = _getURI(url);
    print("debugPrint _getURI : ${uri}");
    var response = await http.get(uri);
    print("debugPrint response : ${response.body}");
    List<dynamic> data = (json.decode(response.body));

    print(data);
    return data;
  }
}
