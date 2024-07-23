import 'package:asasiyat/app_routes.dart';
import 'package:asasiyat/constants/style.dart';
import 'package:asasiyat/controllers/asas_controller.dart';
import 'package:asasiyat/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  // Get.put(MenuControllerCustom.MenuController());
  WidgetsFlutterBinding.ensureInitialized();

  try {
    GetStorage storage = GetStorage('asasStorage');
    await GetStorage.init('asasStorage'); // initialize storage driver
  } catch (e) {
    debugPrint("$e");
  }
  try {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } catch (e) {
    debugPrint("$e");
  }

  runApp(MyApp());
}

/**
 * 
 */
// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  AsasController asasController =
      Get.put(AsasController(), tag: 'asasInstance', permanent: false);
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
            home: child,
          );
        },
        child: GetMaterialApp(
          locale: Locale('en', 'US'),
          fallbackLocale: Locale('en', 'US'),
          initialRoute: '/home',
          getPages: pagesRoute,
          debugShowCheckedModeBanner: false,
          //title: DataHelper.appTitle,
        ));
  }
}
