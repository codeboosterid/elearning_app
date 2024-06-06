import 'package:elearning_app/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/routes/routes.dart';
import 'common/services/http_util.dart';
// import 'common/services/http_util.dart';

Future<void> main() async {
  await Global.init();

  // await HttpUtil().post("api/login", queryParameters: {
  //   "name": "faizalharwin",
  //   "email": "faizalharwin@gmail.com",
  //   "type": 3,
  //   "open_id": "123",
  //   "phone": "123",
  //   "avatar": "photo.png",
  // });

  runApp(const ProviderScope(child: MyApp()));
}

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        navigatorKey: navKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppPages.generateRouteSettings,
      ),
    );
  }
}
