import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/domain/entities/feature.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';

import '../../../widgets/custom_divider.dart';

class ReorderFeaturePage extends StatefulWidget {
  const ReorderFeaturePage({super.key, required this.pin, required this.other});
  final List<Feature> pin;
  final List<Feature> other;

  @override
  State<ReorderFeaturePage> createState() => _ReorderFeaturePageState();
}

class _ReorderFeaturePageState extends State<ReorderFeaturePage> {
  late List<Feature> items;
  late int pinCount;

  @override
  void initState() {
    items = List.from(widget.pin);
    items.addAll(widget.other);

    pinCount = widget.pin.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget proxyDecorator(
        Widget child, int index, Animation<double> animation) {
      return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          final double animValue = Curves.easeInOut.transform(animation.value);
          final double elevation = lerpDouble(0, 6, animValue)!;
          return Material(
            elevation: elevation,
            color: context.neutral200,
            shadowColor: context.neutral1000,
            child: child,
          );
        },
        child: child,
      );
    }

    return BaseScaffoldAppBar(
      title: 'Reorder Features'.tr,
      onPopInvoked: () async {
        Get.back(result: [
          items.take(pinCount).toList(),
          items.sublist(pinCount),
        ]);
        return false;
      },
      body: ReorderableListView.builder(
        header: const _Header(),
        footer: Container(color: context.neutral200, padding: padAll12),
        shrinkWrap: true,
        proxyDecorator: proxyDecorator,
        itemBuilder: (context, index) {
          if (index == pinCount) {
            return const _MoreDivider(Key('more'));
          }
          var realIndex = index;
          if (index > pinCount) realIndex = index - 1;
          final obj = items[realIndex];
          final label = obj.label;
          final icon = obj.icon;
          final isPin = index < pinCount;
          if (isPin && pinCount == 1) {
            return AloneItem(
                key: Key(label), label: label, icon: icon, canReorder: false);
          }
          return BottomItem(
              key: Key(label), label: label, icon: icon, canReorder: true);
        },
        itemCount: items.length + 1,
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            if (newIndex > pinCount) {
              newIndex -= 1;
            }
            if (oldIndex > pinCount) {
              oldIndex -= 1;
            }
            if (oldIndex >= pinCount && newIndex <= pinCount) {
              if (pinCount < 6) {
                pinCount += 1;
              }
            } else if (oldIndex < pinCount && newIndex >= pinCount) {
              pinCount -= 1;
              newIndex -= 1;
            }

            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}

class TopItem extends StatelessWidget {
  const TopItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.canReorder});

  final String label;
  final Widget icon;
  final bool canReorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        _Item(label: label, icon: icon, canReorder: canReorder),
        const Padding(
          padding: EdgeInsets.only(left: 48.0),
          child: CustomDivider(),
        ),
      ],
    );
  }
}

class BottomItem extends StatelessWidget {
  const BottomItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.canReorder});

  final String label;
  final Widget icon;
  final bool canReorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Item(label: label, icon: icon, canReorder: canReorder),
        const CustomDivider(),
      ],
    );
  }
}

class MiddleItem extends StatelessWidget {
  const MiddleItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.canReorder});

  final String label;
  final Widget icon;
  final bool canReorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Item(label: label, icon: icon, canReorder: canReorder),
        const Padding(
          padding: EdgeInsets.only(left: 48.0),
          child: CustomDivider(),
        ),
      ],
    );
  }
}

class AloneItem extends StatelessWidget {
  const AloneItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.canReorder});

  final String label;
  final Widget icon;
  final bool canReorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomDivider(),
        _Item(label: label, icon: icon, canReorder: canReorder),
        const CustomDivider(),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.label,
    required this.icon,
    this.canReorder = true,
  });

  final String label;
  final Widget icon;
  final bool canReorder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padSymHor14Ver08,
      child: Row(
        children: [
          icon,
          sizedBoxW08,
          Expanded(
              child: Text(
            label,
            style: AppFonts.h200.copyWith(color: context.neutral600),
          )),
          if (canReorder)
            Icon(
              Icons.menu,
              color: context.neutral600,
            )
        ],
      ),
    );
  }
}

class _MoreDivider extends StatelessWidget {
  const _MoreDivider(Key? key) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: Container(
        color: context.neutral200,
        padding: padAll12,
        child: Text(
          'More features'.tr,
          style: AppFonts.bSmall.copyWith(color: context.neutral900),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.neutral200,
      padding: padAll12,
      child: Text(
        'Pin to the bottom'.tr,
        style: AppFonts.bSmall.copyWith(color: context.neutral900),
      ),
    );
  }
}
