import 'package:get/get.dart';

import '../screen/splash/splash_binding.dart';
import '../screen/splash/splash_screen.dart';
import 'app_router.dart';

class AppPage {
  static List<GetPage> pages = [
    GetPage(
      name: AppRouter.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
  ];
}
