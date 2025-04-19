import 'package:get_it/get_it.dart';

import '../../Authentication/data/repo/home_repo_impl.dart';
import 'network/auth_api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<AuthDioFactory>(AuthDioFactory());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<AuthDioFactory>(),
  ));
}
