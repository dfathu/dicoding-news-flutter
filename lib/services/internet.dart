import 'dart:convert';

import 'package:dicoding_pertama_membuat_aplikasi_flutter/models/model_albums.dart';
import 'package:dicoding_pertama_membuat_aplikasi_flutter/models/model_posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Apiservice {
  // ignore: non_constant_identifier_names
  final HOST = "jsonplaceholder.typicode.com";

  Uri _getURI(String path, {Map<String, String>? params}) {
    debugPrint("REQ $HOST$path $params");
    debugPrint("debugPrint Url : ${Uri.https(HOST, path, params)}");
    return Uri.https(HOST, path, params);
  }

  Future<List<ModelPost>> getPosts() async {
    const url = "/posts";
    var uri = _getURI(url);
    debugPrint("debugPrint _getURI : $uri");
    var response = await http.get(uri);
    List<dynamic> data = (json.decode(response.body));
    List<ModelPost> list = data.map((val) => ModelPost.fromJson(val)).toList();
    for (var element in list) {
      debugPrint(
          "debugPrint response convert list element: ${element.toJson()}");
    }
    return list;
  }

  Future<List<ModelPhotos>> getPhotos() async {
    const url = "/albums/1/photos";
    var uri = _getURI(url);
    debugPrint("debugPrint _getURI : $uri");
    var response = await http.get(uri);
    List<dynamic> data = (json.decode(response.body));
    List<ModelPhotos> list =
        data.map((val) => ModelPhotos.fromJson(val)).toList();
    for (var element in list) {
      debugPrint(
          "debugPrint response convert list element: ${element.toJson()}");
    }
    return list;
  }
}
