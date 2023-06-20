import 'package:flutter/cupertino.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/components/student_item.dart';

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
        Expanded(child: StudentItem(data: data)),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IgnorePointer(
              ignoring: !enable,
              child: CupertinoSwitch(
                activeColor:
                    enable ? context.primaryDark : context.disableColor,
                value: switchValue,
                onChanged: onChanged,
              )),
        ),
      ],
    );
  }
}
