import 'package:json_annotation/json_annotation.dart';

part 'album.g.dart';

@JsonSerializable()
class Album {
  final String collectionName;
  final String artworkUrl60;
  final num? collectionPrice;
  final DateTime? releaseDate;
  bool like = false;

  Album(
      {required this.collectionName,
      required this.artworkUrl60,
      required this.collectionPrice,
      required this.releaseDate});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  void likeCallback() {
    like = !like;
  }
}
