import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/constant/app_string.dart';
import '../../../core/utils/service_locator.dart';
import '../../data/model/login.dart';
import '../../data/model/register.dart';
import '../../data/model/verify.dart';
import '../../data/repo/home_repo_impl.dart';
import '../home_page.dart';
import '../manger/auth cubit/auth_cubit.dart';
import '../otp.dart';
import '../sign_in.dart';
import 'custom_button.dart';

class CustomButtonAuth extends StatelessWidget {
  const CustomButtonAuth({
    super.key,
    this.formKey,
    this.nameController,
    this.phoneController,
    this.passwordController,
    required this.type,
    this.typeController,
    this.otpController1,
    this.otpController2,
    this.otpController3,
    this.otpController4,
  });

  final GlobalKey<FormState>? formKey;
  final TextEditingController? nameController;
  final TextEditingController? typeController;
  final TextEditingController? phoneController;
  final TextEditingController? passwordController;
  final TextEditingController? otpController1,
      otpController2,
      otpController3,
      otpController4;
  final String type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<HomeRepoImpl>()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(child: Text(state.errorMessage)),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is SignUpSuccess) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignIn()));
          } else if (context.read<AuthCubit>().sendCodeSuccess &&
              context.read<AuthCubit>().loginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Otp(phoneController: phoneController!),
              ),
            );
          } else if (state is VerfiyCodeSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        builder: (context, state) {
          return CustomButton(
            text: type == AppString.signUp
                ? AppString.signUp
                : type == AppString.otp
                    ? AppString.verify
                    : AppString.signIn,
            isloading: state is AuthLoading ? true : false,
            onPressed: () async {
              if (type != AppString.otp) {
                if (formKey!.currentState!.validate()) {
                  if (type == AppString.signUp) {
                    context.read<AuthCubit>().register(Register(
                          name: nameController!.text,
                          type: typeController!.text,
                          phone: phoneController!.text,
                          password: passwordController!.text,
                        ));
                  } else if (type == AppString.signIn) {
                    context.read<AuthCubit>().login(Login(
                          phone: phoneController!.text,
                          password: passwordController!.text,
                        ));
                    context.read<AuthCubit>().sendCode(Verify(
                          phone: phoneController!.text,
                        ));
                  }
                }
              }
              if (type == AppString.otp) {
                context.read<AuthCubit>().verifyCode(
                      Verify(
                        phone: phoneController!.text,
                        code: otpController1!.text +
                            otpController2!.text +
                            otpController3!.text +
                            otpController4!.text,
                      ),
                    );
              }
            },
          );
        },
      ),
    );
  }
}
