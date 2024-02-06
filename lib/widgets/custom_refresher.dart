import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CustomRefresher extends StatelessWidget {
  const CustomRefresher({
    super.key,
    required this.controller,
    required this.child,
    this.onRefresh,
    this.onLoading,
  });

  final RefreshController controller;
  final Widget child;

  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      enablePullDown: onRefresh != null,
      onRefresh: onRefresh,
      enablePullUp: onLoading != null,
      onLoading: onLoading,
      header: const ClassicHeader(
        refreshingIcon: Center(child: CupertinoActivityIndicator()),
        refreshingText: "",
        releaseText: "",
        completeText: "",
        idleText: "",
        textStyle: TextStyle(color: Colors.black),
        completeIcon: Center(child: CupertinoActivityIndicator()),
        releaseIcon: Center(child: CupertinoActivityIndicator()),
        idleIcon: Center(child: CupertinoActivityIndicator()),
        failedText: "Đã có lỗi xảy ra",
      ),
      footer: const ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        iconPos: IconPosition.top,
        idleIcon: null,
        idleText: "",
        loadingText: "",
        noDataText: "",
        canLoadingText: "",
        failedText: "Đã có lỗi xảy ra",
      ),
      child: child,
    );
  }
}
