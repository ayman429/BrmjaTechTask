import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/errors/failures.dart';
import '../../../core/utils/constant/api_string.dart';
import '../../../core/utils/constant/app_string.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../core/utils/network/auth_api_service.dart';
import '../../../core/utils/network/internet_connection.dart';
import '../model/login.dart';
import '../model/register.dart';
import '../model/verify.dart';
import 'home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  AuthDioFactory apiService;
  HomeRepoImpl(
    this.apiService,
  );
  @override
  Future<Either<Failure, String>> login({required Login login}) async {
    bool hasInternet = await checkUserConnection();
    if (hasInternet) {
      try {
        var data = await apiService.post(
          endPoint: ApiString.login,
          data: login.toJson(),
        );
        await storage.write(
            key: AppString.tokenKey, value: data["result"]["access_token"]);

        if (data["status"] == "failed") {
          return left(
            ServerFailure(
              data["message"],
            ),
          );
        } else {
          return right(data["message"]);
        }
      } catch (e) {
        if (e is DioException) {
          return left(
            ServerFailure.fromDioError(e),
          );
        }
        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    } else {
      return left(
        ServerFailure(
          AppString.noInternet,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> register({required Register register}) async {
    bool hasInternet = await checkUserConnection();
    if (hasInternet) {
      try {
        var data = await apiService.post(
          endPoint: ApiString.register,
          data: register.toJson(),
        );
        return right(data["message"]);
      } catch (e) {
        if (e is DioException) {
          return left(
            ServerFailure.fromDioError(e),
          );
        }

        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    } else {
      return left(
        ServerFailure(
          AppString.noInternet,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> sendCode({required Verify verify}) async {
    bool hasInternet = await checkUserConnection();
    if (hasInternet) {
      try {
        var data = await apiService.post(
          endPoint: ApiString.sendCode,
          data: verify.toJson(),
        );
        return right(data["message"]);
      } catch (e) {
        if (e is DioException) {
          return left(
            ServerFailure.fromDioError(e),
          );
        }

        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    } else {
      return left(
        ServerFailure(
          AppString.noInternet,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> verifyCode({required Verify verify}) async {
    bool hasInternet = await checkUserConnection();
    if (hasInternet) {
      try {
        var data = await apiService.post(
          endPoint: ApiString.verifyCode,
          data: verify.toJson(),
        );
        await storage.write(key: AppString.verifyKey, value: "True");
        return right(data["message"]);
      } catch (e) {
        if (e is DioException) {
          return left(
            ServerFailure.fromDioError(e),
          );
        }

        return left(
          ServerFailure(
            e.toString(),
          ),
        );
      }
    } else {
      return left(
        ServerFailure(
          AppString.noInternet,
        ),
      );
    }
  }
}
