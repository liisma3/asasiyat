import 'package:asasiyat/app_routes.dart';
import 'package:asasiyat/asas_module/asas_viewer_binding.dart';
import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/controllers/stage_controller.dart';
import 'package:asasiyat/firebase_options.dart';
import 'package:country_picker/country_picker.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  // Get.put(MenuControllerCustom.MenuController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  /**
  FirebaseUIAuth.configureProviders([
    PhoneAuthProvider(),
    EmailAuthProvider(),
    // ... other providers
  ]);
   * 
   */
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  try {
    GetStorage storage = GetStorage('asasStorage');
    await GetStorage.init('asasStorage'); // initialize storage driver
  } catch (e) {
    debugPrint("$e");
  }

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  AsasController asasController =
      Get.put(AsasController(), tag: 'asasInstance', permanent: false);
  StageController stageController =
      Get.put(StageController(), tag: 'stageInstance', permanent: false);
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
        designSize: const Size(375, 825),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'asasiyat',
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white10,
              iconTheme: IconThemeData(color: AsasStyle.asasColor),
              primarySwatch: Colors.deepOrange,
              textTheme: GoogleFonts.montserratTextTheme()
                  .apply(bodyColor: Colors.black45),
              //fontFamily: 'Montserra',
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
                TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              }),
              primaryColor: Colors.deepOrange.shade300,
              brightness: Brightness.light,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              //titleText: Colors.blue.shade400,
              useMaterial3: true,
            ),
            // App
            home: child,
          );
        },
        child: GetMaterialApp(
          supportedLocales: [
            const Locale('en'),
            const Locale('ar'),
            const Locale('es'),
            const Locale('de'),
            const Locale('fr'),
            const Locale('el'),
            const Locale('et'),
            const Locale('nb'),
            const Locale('nn'),
            const Locale('pl'),
            const Locale('pt'),
            const Locale('ru'),
            const Locale('hi'),
            const Locale('ne'),
            const Locale('uk'),
            const Locale('hr'),
            const Locale('tr'),
            const Locale('lv'),
            const Locale('lt'),
            const Locale('ku'),
            const Locale('nl'),
            const Locale('it'),
            const Locale('ko'),
            const Locale('ja'),
            const Locale('id'),
            const Locale('cs'),
            const Locale('ht'),
            const Locale('sk'),
            const Locale('ro'),
            const Locale('bg'),
            const Locale('ca'),
            const Locale('he'),
            const Locale.fromSubtags(
                languageCode: 'zh',
                scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
            const Locale.fromSubtags(
                languageCode: 'zh',
                scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
          ],
          localizationsDelegates: [
            CountryLocalizations.delegate,
            // GlobalMaterialLocalizations.delegate,
            //    GlobalCupertinoLocalizations.delegate,
            //  GlobalWidgetsLocalizations.delegate,
          ],
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          initialRoute: '/home', //'/stages/3', //
          initialBinding: AsasBinding(),
          getPages: pagesRoute,
          debugShowCheckedModeBanner: false,
          //title: DataHelper.appTitle,
        ));
  }
}

class GlobalWidgetsLocalizations {}

class GlobalCupertinoLocalizations {}

class GlobalMaterialLocalizations {}
