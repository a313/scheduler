import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/student.dart';
import 'package:flutter/cupertino.dart';

import '../../../theme/app_fonts.dart';
import '../../../widgets/local_avatar.dart';

class SwitchStudentCell extends StatelessWidget {
  const SwitchStudentCell(
      {super.key,
      required this.data,
      required this.switchValue,
      this.onChanged,
      this.enable = true});

  final Student data;
  final bool switchValue;
  final bool enable;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _StudentItem(data: data)),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IgnorePointer(
              ignoring: !enable,
              child: Transform.scale(
                transformHitTests: false,
                scale: .85,
                child: CupertinoSwitch(
                  activeTrackColor:
                      enable ? context.primaryDark : context.disableColor,
                  value: switchValue,
                  onChanged: onChanged,
                ),
              )),
        ),
      ],
    );
  }
}

class _StudentItem extends StatelessWidget {
  const _StudentItem({
    required this.data,
  });
  final Student data;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: data.isFollow ? 1 : 0.3,
      child: Padding(
        padding: padSymHor12Ver06,
        child: Row(
          children: [
            LocalAvatar(
              path: data.image,
              size: 32,
              name: data.name,
            ),
            sizedBoxW12,
            Text(
              data.name,
              style: AppFonts.h400,
            ),
          ],
        ),
      ),
    );
  }
}
