import 'package:elearning_app/features/sign_in/controller/sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/global_loader/global_loader.dart';
import '../../../common/utils/app_colors.dart';
import '../../../common/utils/image_res.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfield.dart';
import '../../../common/widgets/button_widgets.dart';
import '../../../common/widgets/text_widgets.dart';
import '../provider/sign_in_notifier.dart';
import 'widgets/sign_in_widgets.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void didChangeDependencies() {
    _controller = SignInController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppbar(),
          backgroundColor: Colors.white,
          body: loader == false
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      thirtPartyLogin(),
                      const Center(
                        child: Text14Normal(
                            text: "Or use your email account to login"),
                      ),
                      const SizedBox(height: 50),
                      appTextField(
                        controller: _controller.emailController,
                        text: "Email",
                        iconName: ImageRes.user,
                        hintText: "Enter your email address",
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserEmailChange(value),
                      ),
                      const SizedBox(height: 20),
                      appTextField(
                        controller: _controller.passwordController,
                        text: "Password",
                        iconName: ImageRes.lock,
                        hintText: "Enter your password",
                        obscureText: true,
                        func: (value) => ref
                            .read(signInNotifierProvider.notifier)
                            .onUserPasswordChange(value),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 25),
                        child: textUnderline(text: "Forgot password?"),
                      ),
                      const SizedBox(height: 100),
                      Center(
                        child: appButton(
                          buttonName: "Login",
                          func: () => _controller.handleSignIn(ref),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: appButton(
                          buttonName: "Register",
                          isLogin: false,
                          context: context,
                          func: () => Navigator.pushNamed(context, "/register"),
                        ),
                      )
                    ],
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    color: AppColors.primaryElement,
                  ),
                ),
        ),
      ),
    );
  }
}
