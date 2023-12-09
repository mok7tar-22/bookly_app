import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../features/home/data/models/repos/home_repo_impl.dart';
import '../features/search/data/repos/search_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(
      Dio(BaseOptions(connectTimeout: Duration(milliseconds: 6000)))));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<ApiService>(),
  ));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
    getIt.get<ApiService>(),
  ));
}
