import 'package:beta_acid_challenge/model/album.dart';
import 'package:beta_acid_challenge/model/result.dart';
import 'package:beta_acid_challenge/remote/album_source.dart';
import 'package:beta_acid_challenge/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  AlbumRepositoryImpl(this._albumSource);

  final AlbumSource _albumSource;

  @override
  Future<Result<List<Album>>> getAlbumList() {
    return Result.guardFuture(_albumSource.getAlbumList);
  }
}