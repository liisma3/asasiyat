/* import 'package:asas/auth/auth_form.dart';
import 'package:asas/screens/al_asas_screen%20.dart';
import 'package:asas/screens/asas_screen.dart';
import 'package:asas/screens/asasna_screen.dart';
import 'package:asas/screens/asasto_screen.dart';
import 'package:asas/screens/guests_tabs_screen.dart';
import 'package:asas/screens/sprints_screen.dart';
import 'package:asas/screens/stages_screen.dart';
import 'package:asas/stage-module/asas_tabs_viewer.dart';
 */
import 'package:asasiyat/auth/auth_form.dart';
import 'package:asasiyat/screens/al_asas_screen.dart';
import 'package:asasiyat/screens/app_screen.dart';
import 'package:asasiyat/screens/asas_screen.dart';
import 'package:asasiyat/screens/asas_to_screen.dart';
import 'package:asasiyat/screens/guests_tabs_screen.dart';
import 'package:asasiyat/screens/sprints_screen.dart';
import 'package:asasiyat/screens/stage_screen.dart';
import 'package:asasiyat/screens/stages_screen.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
//import 'package:get/get_navigation/src/routes/transitions_type.dart';

const OverviewPageRoute = "Overview";
const LoginPageRoute = "Login";
const AsasPageRoute = "Asas";
const AlAsasPageRoute = "AlAsas";
const AsastoPageRoute = "Asasto";
const AsasnaPageRoute = "Asasna";
const StagesPageRoute = "Stages";
const SprintsPageRoute = "Sprints";
const GuestsPageRoute = "Guests";
const HostsPageRoute = "Hosts";
List drawerMenuNames = [
  OverviewPageRoute,
  LoginPageRoute,
  AsasPageRoute,
  AlAsasPageRoute,
  AsastoPageRoute,
  AsasnaPageRoute,
  StagesPageRoute,
  SprintsPageRoute,
  GuestsPageRoute,
  HostsPageRoute,
];
List<GetPage<dynamic>> pagesRoute = [
  GetPage(
      name: '/home',
      page: () => AppScreen()), //AppScreen()), //AsasScreen()), //
  GetPage(
      name: '/', page: () => AppScreen()), //AppScreen()), //AsasScreen()), //

  GetPage(name: '/asas', page: () => AsasScreen()),
  GetPage(name: '/alasas', page: () => AlAsasScreen()),
  GetPage(name: '/asasto', page: () => AsasToScreen()),
  GetPage(
    name: '/guests',
    page: () => GuestsTabsViewer(),
  ),
  GetPage(name: '/login', page: () => AuthForm()),
  GetPage(name: '/sign-in', page: () => SignInScreen()),
  GetPage(name: '/profile/:id', page: () => ProfileScreen()),
  GetPage(
      name: '/sprints', page: () => SprintsView(), transition: Transition.zoom),
  GetPage(
      name: '/stages/:grid',
      page: () => StagesScreen(),
      transition: Transition.zoom),
  GetPage(
      name: '/stage/:souraNb',
      page: () => StageScreen(),
      transition: Transition.zoom),
];
