import 'package:beta_acid_challenge/model/album.dart';
import 'package:beta_acid_challenge/model/result.dart';

abstract class AlbumRepository {
  Future<Result<List<Album>>> getAlbumList();
}
