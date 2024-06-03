import 'dart:convert';

import 'package:elearning_app/common/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/global_loader/global_loader.dart';
import '../../../common/utils/constants.dart';
import '../../../common/utils/popup_message.dart';
import '../../../global.dart';
import '../../../main.dart';
import '../provider/sign_in_notifier.dart';
import '../repo/sign_in_repo.dart';

class SignInController {
  SignInController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleSignIn(WidgetRef ref) async {
    var state = ref.read(signInNotifierProvider);

    String email = state.email;
    String password = state.password;

    emailController.text = email;
    passwordController.text = password;

    if (state.email.isEmpty || email.isEmpty) {
      toastInfo("Your email is empty");
      return;
    }
    if ((state.password.isEmpty) || password.isEmpty) {
      toastInfo("Your password is empty");
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoaderValue(true);
    try {
      final credential = await SignInRepo.firebaseSignIn(email, password);
      if (credential.user == null) {
        toastInfo("User not found");
        return;
      }
      if (!credential.user!.emailVerified) {
        toastInfo("You must verify your email address first !");
        return;
      }

      var user = credential.user;

      if (user != null) {
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;
        asyncPostAllData(loginRequestEntity);
      } else {
        toastInfo("Login error!!");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toastInfo("User not found");
      } else if (e.code == 'wrong-password') {
        toastInfo("Your password is wrong");
      } else if (e.code == 'invalid-credential') {
        toastInfo("Wrong credentials");
      }
    } catch (e) {
      if (kDebugMode) {
        // print(e.toString());
      }
    }
    ref.read(appLoaderProvider.notifier).setLoaderValue(false);
  }

  void asyncPostAllData(LoginRequestEntity loginRequestEntity) {
    // we need to task to server
    // have a local storage
    try {
      Global.storageService.setString(
        AppConstants.STORAGE_USER_PROFILE_KEY,
        jsonEncode(
          {
            'name': 'Haura Hanania',
            'email': 'haura@gmail.com',
          },
        ),
      );

      Global.storageService
          .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");

      // navigator.pushNamed("/application");
      navKey.currentState
          ?.pushNamedAndRemoveUntil("/application", (route) => false);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    // redirect to new page
  }
}
