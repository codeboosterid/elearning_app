import 'package:elearning_app/global.dart';
import 'package:elearning_app/pages/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/routes/routes.dart';
import 'pages/application/application.dart';
import 'pages/sign_up/sign_up.dart';
import 'pages/welcome/welcome.dart';

Future<void> main() async {
  await Global.init();
  runApp(const ProviderScope(child: MyApp()));
}

var routesMap = {
  "/": (context) => Welcome(),
  "/sign_in": (context) => const SignIn(),
  "/register": (context) => const SignUp(),
  "/application": (context) => const Application(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: AppPages.generateRouteSettings,
    );
  }
}
