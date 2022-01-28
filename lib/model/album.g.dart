// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) => Album(
      collectionName: json['collectionName'] as String,
      artworkUrl60: json['artworkUrl60'] as String,
      collectionPrice: json['collectionPrice'] as num?,
      releaseDate: json['releaseDate'] == null
          ? null
          : DateTime.parse(json['releaseDate'] as String),
    );

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'collectionName': instance.collectionName,
      'artworkUrl60': instance.artworkUrl60,
      'collectionPrice': instance.collectionPrice,
      'releaseDate': instance.releaseDate?.toIso8601String(),
    };
