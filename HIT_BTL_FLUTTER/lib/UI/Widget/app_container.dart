import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_color.dart';




class AppContainer extends StatefulWidget {
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
    this.showBanner = true,
    this.isCollapsibleBanner = true,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Future<bool> Function()? onWillPop;
  final Widget? bottomNavigationBar;
  final Widget? child;
  final Color? backgroundColor;
  final Widget? coverScreenWidget;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;
  final bool showBanner;
  final bool isCollapsibleBanner;

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  Map bannerAdMap = {};

  @override
  void initState() {


    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: widget.onWillPop ??
          () async {
            return false;
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
              resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
              backgroundColor: widget.backgroundColor ?? AppColor.whiteBG,
              appBar: widget.appBar,
              body: SizedBox(
                width: Get.width,
                height: Get.height,
                child: widget.child ?? const SizedBox.shrink(),
              ),
              floatingActionButton: widget.floatingActionButton,
              bottomNavigationBar: widget.bottomNavigationBar,
            ),
          ),
          widget.coverScreenWidget ?? const SizedBox.shrink(),
          widget.showBanner
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: bannerAdMap['widget'] ?? const SizedBox.shrink(),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
