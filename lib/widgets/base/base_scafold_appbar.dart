import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/widgets/base/base_appbar.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    this.fab,
    this.backgroundColor,
    this.fabLocation,
    this.safeAreaBottom,
    this.safeAreaTop = true,
    this.onPopInvoked,
    this.onTappedScene,
    required this.body,
    this.appBar,
    this.extendBodyBehindAppBar = false,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.scaffoldKey,
  });
  final Key? scaffoldKey;

  final Widget body;
  final Widget? fab;
  final Color? backgroundColor;
  final FloatingActionButtonLocation? fabLocation;
  final bool? safeAreaBottom;
  final bool safeAreaTop;
  final Future<bool> Function()? onPopInvoked;
  final Function()? onTappedScene;
  final PreferredSizeWidget? appBar;
  final bool extendBodyBehindAppBar;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: PopScope(
        canPop: onPopInvoked == null,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          final bool shouldPop = await onPopInvoked!();
          if (context.mounted && shouldPop) {
            Navigator.pop(context);
          }
        },
        child: Scaffold(
          key: scaffoldKey,
          floatingActionButton: fab,
          floatingActionButtonLocation: fabLocation,
          backgroundColor: backgroundColor,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          appBar: appBar,
          bottomNavigationBar: bottomNavigationBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onTappedScene,
            child: SafeArea(
              top: safeAreaTop,
              child: body,
            ),
          ),
        ),
      ),
    );
  }
}

class BaseScaffoldAppBar extends StatelessWidget {
  const BaseScaffoldAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.tag,
    required this.body,
    this.fab,
    this.leading,
    this.showBackBtn = true,
    this.backgroundColor,
    this.appbarColor,
    this.fabLocation,
    this.elevation,
    this.safeAreaBottom,
    this.safeAreaTop = true,
    this.onPopInvoked,
    this.onTappedScene,
    this.systemOverlayStyle,
    this.extendBodyBehindAppBar = false,
    this.centerTitle,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.scaffoldKey,
  });
  final Key? scaffoldKey;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final String? tag;
  final Widget body;
  final Widget? fab;
  final Widget? leading;
  final bool showBackBtn;
  final Color? backgroundColor;
  final Color? appbarColor;
  final FloatingActionButtonLocation? fabLocation;
  final double? elevation;
  final bool? safeAreaBottom;
  final bool safeAreaTop;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Future<bool> Function()? onPopInvoked;
  final bool extendBodyBehindAppBar;
  final bool? centerTitle;
  final Function()? onTappedScene;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      scaffoldKey: scaffoldKey,
      backgroundColor: backgroundColor,
      fab: fab,
      onTappedScene: onTappedScene,
      fabLocation: fabLocation,
      onPopInvoked: onPopInvoked,
      safeAreaBottom: safeAreaBottom,
      safeAreaTop: safeAreaTop,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: isDesktop
          ? BaseDesktopAppbar(
              backgroundColor: appbarColor,
              elevation: elevation,
              actions: actions,
              centerTitle: centerTitle,
              leading: leading,
              title: Padding(
                padding: padSymHor08,
                child: titleWidget ?? Text(title ?? ''),
              ),
            )
          : AppBar(
              backgroundColor: appbarColor,
              elevation: elevation,
              actions: actions,
              centerTitle: centerTitle,
              automaticallyImplyLeading: showBackBtn,
              systemOverlayStyle: systemOverlayStyle,
              title: titleWidget ?? Text(title ?? ''),
            ),
    );
  }
}
