import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';
import 'package:scheduler/widgets/custom_divider.dart';
import 'package:scheduler/widgets/local_avatar.dart';

import '../../../data/models/event.dart';
import 'time_const_component.dart';

class EventItem extends StatelessWidget {
  const EventItem({
    super.key,
    required this.data,
    this.onTapped,
    this.onTappedEdit,
  });

  final Event data;
  final Function(Event data)? onTapped;
  final Function(Event data)? onTappedEdit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onTapped?.call(data),
      child: Padding(
        padding: padSymVer08,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TimeConstComponent(data: data),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          data.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.bMedium,
                        ),
                      ),
                      sizedBoxW08,
                      GestureDetector(
                        onTap: () => onTappedEdit?.call(data),
                        child: SvgPicture.asset(
                          'assets/svg/Regular/PencilSimpleLine.svg',
                          width: 24,
                          height: 24,
                        ),
                      )
                    ],
                  ),
                  sizedBoxH04,
                  const CustomDivider(),
                  Padding(
                    padding: padSymVer08,
                    child: ABWidget(
                      isShowA: data.students.isNotEmpty,
                      widgetA: (c) {
                        final w = min(context.width, context.height) - 140;
                        final count = w ~/ 28;
                        final more = data.students.length - count;
                        List<Widget> child = List.generate(
                            min(data.students.length, count), (index) {
                          final obj = data.students[index];
                          final isJoin = data.joinedIds.contains(obj.id);
                          return Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 3.0, right: 4.0),
                                child: LocalAvatar(
                                  path: obj.image,
                                  name: obj.name,
                                  size: 24,
                                ),
                              ),
                              if (data.isActive)
                                Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: isJoin
                                      ? const Icon(Icons.check_circle,
                                          color: Colors.green, size: 12)
                                      : const Icon(Icons.cancel,
                                          color: Colors.red, size: 12),
                                )
                            ],
                          );
                        });
                        if (more > 0) {
                          child.add(Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: context.neutral400,
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: const Offset(0.5, 0.5),
                                ),
                              ],
                              color: Colors.white,
                            ),
                            child: Center(
                                child: Text(
                              '+$more',
                              style: AppFonts.h200
                                  .copyWith(color: context.neutral700),
                            )),
                          ));
                        }

                        return Row(children: child);
                      },
                      widgetB: (c) => Text(
                        'No student included',
                        style:
                            AppFonts.bSmall.copyWith(color: context.neutral600),
                      ),
                    ),
                  ),
                  if (data.location.hasText)
                    Padding(
                      padding: padSymVer04,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Regular/MapPin.svg',
                            width: 16,
                            height: 16,
                            colorFilter: context.neutral900.filterSrcIn,
                          ),
                          sizedBoxW02,
                          Text(
                            data.location!,
                            style: AppFonts.bSmall
                                .copyWith(color: context.neutral900),
                          ),
                        ],
                      ),
                    ),
                  if (data.note.hasText)
                    Padding(
                      padding: padSymVer04,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/Regular/ChatTeardropDots.svg',
                            width: 16,
                            height: 16,
                            colorFilter: context.neutral900.filterSrcIn,
                          ),
                          sizedBoxW02,
                          Text(
                            data.note!,
                            style: AppFonts.bSmall
                                .copyWith(color: context.neutral900),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            sizedBoxW14,
          ],
        ),
      ).disable(isDisable: !data.isActive),
    );
  }
}
