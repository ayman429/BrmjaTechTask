import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/login.dart';
import '../../../data/model/register.dart';
import '../../../data/model/verify.dart';
import '../../../data/repo/home_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final HomeRepo homeRepo;
  bool loginSuccess = false;
  bool sendCodeSuccess = false;
  AuthCubit(this.homeRepo) : super(AuthInitial());

  Future<void> login(Login login) async {
    emit(AuthLoading());
    var result = homeRepo.login(login: login);
    result.then((value) {
      value.fold(
        (failure) {
          emit(AuthFailure(failure.errMessage));
        },
        (success) {
          loginSuccess = true;
          emit(LoginSuccess(success));
        },
      );
    });
  }

  Future<void> register(Register register) async {
    emit(AuthLoading());
    var result = homeRepo.register(register: register);
    result.then((value) {
      value.fold(
        (failure) {
          emit(AuthFailure(failure.errMessage));
        },
        (success) {
          emit(SignUpSuccess(success));
        },
      );
    });
  }

  Future<void> sendCode(Verify verify) async {
    emit(AuthLoading());
    var result = homeRepo.sendCode(verify: verify);
    result.then((value) {
      value.fold(
        (failure) {
          emit(SendCodeFailure(failure.errMessage));
        },
        (success) {
          sendCodeSuccess = true;
          emit(SendCodeSuccess(success));
        },
      );
    });
  }

  Future<void> verifyCode(Verify verify) async {
    emit(AuthLoading());
    var result = homeRepo.verifyCode(verify: verify);
    result.then((value) {
      value.fold(
        (failure) {
          emit(AuthFailure(failure.errMessage));
        },
        (success) {
          emit(VerfiyCodeSuccess(success));
        },
      );
    });
  }
}
