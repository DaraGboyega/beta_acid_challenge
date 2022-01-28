import 'package:beta_acid_challenge/remote/app_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appDioProvider = Provider<Dio>((_) => AppDio.getInstance());
