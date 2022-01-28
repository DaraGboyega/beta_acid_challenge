import 'package:beta_acid_challenge/model/album.dart';

abstract class AlbumSource {
  Future<List<Album>> getAlbumList();
}
