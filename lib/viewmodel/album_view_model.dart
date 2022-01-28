import 'package:beta_acid_challenge/model/album.dart';
import 'package:beta_acid_challenge/provider/album_repository_provider.dart';
import 'package:beta_acid_challenge/repository/album_repository.dart';
import 'package:beta_acid_challenge/viewmodel/base_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumViewModel = ChangeNotifierProvider(
    (ref) => AlbumViewModel(ref.read(albumRepositoryProvider)));

class AlbumViewModel extends BaseViewModel {
  AlbumViewModel(this._repository);

  final AlbumRepository _repository;

  List<Album> albumList = [];
  num likedAlbums = 0;

  Future<void> init() async {
    whileLoading(() => loadData());
  }

  Future<void> loadData() async {
    return _repository.getAlbumList().then((result) {
      result.ifSuccess((data) {
        albumList = data;
      });

      result.ifFailure((e) {
        callSnackbar(e.message!);
        return;
      });
    });
  }

  void getLikedAlbumTotal() {
    likedAlbums = 0;
    for (var element in albumList) {
      if (element.like == true) {
        likedAlbums++;
      }
    }
    notifyListeners();
  }
}
