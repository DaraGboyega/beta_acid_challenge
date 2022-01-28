import 'dart:convert';

import 'package:beta_acid_challenge/model/album.dart';
import 'package:beta_acid_challenge/remote/album_source.dart';
import 'package:dio/dio.dart';

class AlbumSourceImpl implements AlbumSource {
  AlbumSourceImpl({required Dio? dio}) : _dio = dio!;

  final Dio _dio;

  @override
  Future<List<Album>> getAlbumList() async {
    return _dio.get("/lookup",
        queryParameters: {"id": 909253, "entity": "album"}).then((response) {
      final responseJson = json.decode(response.data);
      List jsonList = responseJson["results"];
      jsonList.removeAt(0);
      return jsonList.map((json) => Album.fromJson(json)).toList();
    });
  }
}
