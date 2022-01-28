import 'package:beta_acid_challenge/provider/album_source_provider.dart';
import 'package:beta_acid_challenge/repository/album_repository.dart';
import 'package:beta_acid_challenge/repository/album_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumRepositoryProvider = Provider<AlbumRepository>(
    (ref) => AlbumRepositoryImpl(ref.read(albumSourceProvider)));
