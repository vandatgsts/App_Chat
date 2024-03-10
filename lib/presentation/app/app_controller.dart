import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../utils/app_log.dart';
import '../../utils/app_utils.dart';

class AppController extends SuperController {
  @override
  void onDetached() {
    AppLog.debug("onDetached");
  }

  @override
  void onHidden() {
    AppLog.debug("onHidden");
  }

  @override
  void onInactive() {
    AppLog.debug("onInactive");
  }

  @override
  void onPaused() {
    AppLog.debug("onPaused");
  }

  @override
  void onResumed() {
    AppLog.debug("onResumed");
  }

  @override
  void onReady() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        showToast("No internet connection");
      }
    });

    super.onReady();
  }
}
