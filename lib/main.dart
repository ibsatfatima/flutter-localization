import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit/utils/app_constants.dart';
import 'package:fruit/utils/messeges.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'controllers/language_controller.dart';
import 'screens/first_screen.dart';
import 'screens/second_screen.dart';
import 'utils/dependency_inj.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await dep.init();

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,),);
    return GetBuilder<LocalizationController>(builder: (localizationController)
    {
      return GetMaterialApp(
        title: 'Fruit cart app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        locale: localizationController.locale,
        translations: Messages(languages: languages),
        fallbackLocale: Locale(AppConstants.languages[0].languageCode,
            AppConstants.languages[0].countryCode),
        home: Screen(),
        getPages: [
          GetPage(name: '/', page: () => Screen()),
          GetPage(name: '/CartPage', page: () => CartScreen()),
        ],
      );
    });
  }
}

