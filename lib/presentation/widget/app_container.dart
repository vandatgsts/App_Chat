import 'package:chat/presentation/theme/app_dimensions.dart';
import 'package:chat/utils/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_color.dart';

class AppContainer extends GetView {
  const AppContainer({
    Key? key,
    this.appBar,
    this.onWillPop,
    this.bottomNavigationBar,
    this.child,
    this.backgroundColor,
    this.coverScreenWidget,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.havePadding = true,
    this.canPop = false,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Future<bool> Function()? onWillPop;
  final Widget? bottomNavigationBar;
  final Widget? child;
  final Color? backgroundColor;
  final Widget? coverScreenWidget;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final bool havePadding;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPop) {
        if (didPop) {
          onWillPop?.call();
        } else {
          AppLog.error("Can't pop", tag: "AppContainer");
        }
      },
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              backgroundColor: backgroundColor ?? AppColor.backgroundColor,
              appBar: appBar,
              body: SizedBox(
                width: Get.width,
                height: Get.height,
                child: havePadding
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: AppDimensions.paddingSizeSmall,
                          right: AppDimensions.paddingSizeSmall,
                          bottom: MediaQuery.of(context).padding.bottom,
                        ),
                        child: child ?? const SizedBox.shrink(),
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).padding.bottom,
                        ),
                        child: child ?? const SizedBox.shrink(),
                      ),
              ),
              floatingActionButton: floatingActionButton,
              bottomNavigationBar: bottomNavigationBar,
            ),
          ),
          coverScreenWidget == null
              ? const SizedBox.shrink()
              : coverScreenWidget!,
        ],
      ),
    );
  }
}
