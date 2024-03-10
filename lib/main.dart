import 'package:chat/presentation/router/app_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'localization/app_string.dart';
import 'presentation/app/app_binding.dart';
import 'presentation/router/app_router.dart';
import 'presentation/theme/app_theme.dart';
import 'utils/app_constant.dart';
import 'utils/share_preference_utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );

  await PreferenceUtils.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          title: AppConstant.appName,
          debugShowCheckedModeBanner: false,
          navigatorKey: Get.key,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(
            milliseconds: 300,
          ),
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
            },
          ),
          initialBinding: AppBinding(),
          initialRoute: AppRouter.splashScreen,
          getPages: AppPage.pages,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          translations: AppString(),
          supportedLocales: AppConstant.availableLocales,
          locale: AppConstant.availableLocales[0],
          fallbackLocale: AppConstant.availableLocales[0],
          builder: (BuildContext context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1),
              ),
              child: widget ?? const SizedBox.shrink(),
            );
          },
        );
      },
    ),
  );
}
