import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/widgets/base/base_button.dart';

import '../../../data/models/event.dart';
import '../../../widgets/base/base_bottom_sheet.dart';
import '../../../widgets/custom_divider.dart';
import '../../students/components/switch_student_cell.dart';

class EventBottomSheet extends StatefulWidget {
  const EventBottomSheet({
    super.key,
    required this.event,
    required this.allStudent,
  });
  final Event event;
  final List<Student> allStudent;

  @override
  State<EventBottomSheet> createState() => _EventBottomSheetState();
}

class _EventBottomSheetState extends State<EventBottomSheet> {
  late List<Student> invited;
  late List<Student> joined;
  late Event event;
  @override
  void initState() {
    event = widget.event;
    joined = widget.allStudent
        .where((e) => widget.event.joinedIds.contains(e.id))
        .toList();
    invited = widget.allStudent
        .where((e) => widget.event.invitedIds.contains(e.id))
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        title: '${widget.event.name} State',
        subTitle: CupertinoSwitch(
          activeColor: context.primaryDark,
          value: event.isActive,
          onChanged: (value) {
            setState(() {
              event.isActive = value;
            });
          },
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: invited.length,
                itemBuilder: (context, index) => SwitchStudentCell(
                  enable: event.isActive,
                  data: invited[index],
                  switchValue: joined.contains(invited[index]),
                  onChanged: (value) {
                    setState(() {
                      if (value) {
                        joined.add(invited[index]);
                        event.joinedIds.add(invited[index].id!);
                      } else {
                        joined.remove(invited[index]);
                        event.joinedIds.remove(invited[index].id!);
                      }
                    });
                  },
                ),
                separatorBuilder: (context, index) => const CustomDivider(),
              ),
            ),
            BaseButton.fixBottom(
                title: 'Cập nhật',
                onPressed: () {
                  Get.back(result: event);
                })
          ],
        ));
  }
}
