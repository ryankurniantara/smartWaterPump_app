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

  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) => ProfilePage(
    //         user: user,
    //       ),
    //     ),
    //   );
    // }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: (BuildContext context, Widget? widget) {
        // use LazyUi.builder to wrap your widget
        // so that you can use LzToast and setting maxScalingFontSize
        return LazyUi.builder(context, widget!, maxScalingFontSize: 1.1);
      },
    );
  }
}
