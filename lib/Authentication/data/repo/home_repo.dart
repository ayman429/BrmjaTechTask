import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../model/login.dart';
import '../model/register.dart';
import '../model/verify.dart';

abstract class HomeRepo {
  Future<Either<Failure, String>> register({required Register register});
  Future<Either<Failure, String>> login({required Login login});
  Future<Either<Failure, String>> sendCode({required Verify verify});
  Future<Either<Failure, String>> verifyCode({required Verify verify});
}
