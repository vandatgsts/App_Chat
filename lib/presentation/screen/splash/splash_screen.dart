import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_constant.dart';
import '../../base/base_screen.dart';
import '../../widget/app_container.dart';
import 'splash_controller.dart';

class SplashScreen extends BaseScreen<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget buildWidgets() {
    return AppContainer(
      havePadding: false,
      child: Center(
        child: Image.asset(
          AppConstant.splashPath,
          width: Get.width,
          height: Get.height,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
