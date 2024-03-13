import 'package:connectivity_wrapper/connectivity_wrapper.dart';
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

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConnectivityAppWrapper(
      app: GetMaterialApp(
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
          return LazyUi.builder(
              context,
              ConnectivityWidgetWrapper(
                child: widget!,
                disableInteraction: true,
                height: 80,
              ),
              maxScalingFontSize: 1.1);
        },
      ),
    );
  }
}
