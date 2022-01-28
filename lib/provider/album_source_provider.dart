import 'package:beta_acid_challenge/provider/app_dio_provider.dart';
import 'package:beta_acid_challenge/remote/album_source.dart';
import 'package:beta_acid_challenge/remote/album_source_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumSourceProvider = Provider<AlbumSource>(
    (ref) => AlbumSourceImpl(dio: ref.read(appDioProvider)));
