import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_color.dart';
import '../theme/app_dimensions.dart';
import '../theme/app_text_theme.dart';
import 'app_touchable.dart';

class AppHeader extends StatelessWidget {
  final String? title;
  final String? hintContent;
  final String? hintTitle;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final Widget? middleWidget;
  final Widget? extendWidget;
  final CrossAxisAlignment? crossAxisAlignmentMainRow;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final double? radius;
  final double? paddingBottom;
  final List<BoxShadow>? shadowHeader;
  final Function()? onPressBack;

  const AppHeader({
    Key? key,
    this.title,
    this.leftWidget,
    this.rightWidget,
    this.middleWidget,
    this.extendWidget,
    this.crossAxisAlignmentMainRow,
    this.hintContent,
    this.hintTitle,
    this.onPressBack,
    this.titleTextStyle,
    this.backgroundColor,
    this.radius,
    this.paddingBottom,
    this.shadowHeader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        0.0,
        MediaQuery.of(context).padding.top,
        0.0,
        paddingBottom ?? AppDimensions.paddingSizeSmall,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColor.backgroundColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(
            radius ?? AppDimensions.radiusSmall,
          ),
          bottomLeft: Radius.circular(
            radius ?? AppDimensions.radiusSmall,
          ),
        ),
        boxShadow: shadowHeader,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment:
                crossAxisAlignmentMainRow ?? CrossAxisAlignment.center,
            children: [
              leftWidget ??
                  AppTouchable(
                    width: 40.0,
                    height: 40.0,
                    padding: const EdgeInsets.all(
                      AppDimensions.paddingSizeSmall,
                    ),
                    onPressed: onPressBack ?? Get.back,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 20.0,
                      color: AppColor.textColor,
                    ),
                  ),
              Expanded(
                child: middleWidget ??
                    Text(
                      title ?? '',
                      textAlign: TextAlign.center,
                      style: titleTextStyle ??
                          AppTextTheme.titleLarge(AppColor.textColor)?.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: AppDimensions.fontSizeDefault,
                          ),
                    ),
              ),
              rightWidget ??
                  const SizedBox(
                    width: 40.0,
                  ),
            ],
          ),
          extendWidget ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
