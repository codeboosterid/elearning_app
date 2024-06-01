import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/global_loader/global_loader.dart';
import '../../common/utils/popup_message.dart';
import 'notifier/register_notifier.dart';

class SignUpController {
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;

    String password = state.password;
    String rePassword = state.rePassword;

    if (state.userName.isEmpty || name.isEmpty) {
      toastInfo("Your name is empty");
      return;
    }

    if (state.userName.length < 6 || name.length < 6) {
      toastInfo("Your name is too short");
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }

    if ((state.password.isEmpty ||
        state.rePassword.isEmpty ||
        password.isEmpty != rePassword.isEmpty)) {
      toastInfo("Your password is empty");
      return;
    }

    if ((state.password != state.rePassword) || password != rePassword) {
      toastInfo("Your password did not match");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);

    var context = Navigator.of(ref.context);

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (kDebugMode) {
        print(credential);
      }

      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(name);
        toastInfo(
            "asn email has been to verify your account. Please open that email and Confirm your identity");
        context.pop();
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      ref.read(appLoaderProvider.notifier).setLoaderValue(false);
    }
  }
}
