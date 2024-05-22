import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazyui/lazyui.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase
  await Firebase.initializeApp();
  // call LazyUi.config() before runApp()
  // to set your own default values, such as: theme, font, spacing, etc.
  LazyUi.config(
    theme: AppTheme.light,
    font: Gfont.black.copyWith(
        fontSize: 20,
        color: Colors.black,
        height: 1.5,
        fontStyle: FontStyle.normal),
  );

  Errors.config(
    chatId: '-1002119874421',
    botToken: '6200050719:AAHJ_MIpGRC_uzDnwjqDA_YSTVta_F8V28c',
    useBot: true,
    useList: true,
  );
  User? user = FirebaseAuth.instance.currentUser;

  bool isLoggedIn = user != null;
  runApp(
    MyApp(
      isLoggedIn: isLoggedIn,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: isLoggedIn ? AppPages.INITIAL : Routes.LOGIN,
      getPages: AppPages.routes,
      builder: (BuildContext context, Widget? widget) {
        // use LazyUi.builder to wrap your widget
        // so that you can use LzToast and setting maxScalingFontSize
        return LazyUi.builder(context, widget!, maxScalingFontSize: 1.1);
      },
    );
  }
}
