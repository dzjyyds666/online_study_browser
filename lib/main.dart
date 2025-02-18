import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_study_browser/page/login.dart';
import 'package:online_study_browser/utils/shared_preference_clien.dart';
import 'package:online_study_browser/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();

  final token = await Utils.getUserToken();

  if (token == null) {
    runApp(MyApp(isLogin: false));
  } else {
    runApp(MyApp(isLogin: true));
  }
}

class MyApp extends StatelessWidget {
  bool isLogin;

  MyApp({super.key, required this.isLogin});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true, // 是否根据设计稿的最小宽度适配，默认为false
      splitScreenMode: true, // 是否根据设计稿的最大宽度适配，默认为false
      builder: (_, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: isLogin
                ? const Center(
                    child: Text('Hello World'),
                  )
                : LoginPage());
      },
    );
  }
}
