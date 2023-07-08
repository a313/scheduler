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

  late Event event;
  @override
  void initState() {
    //TODO BUG
    event = widget.event.copyWith();
    final allStudent = widget.allStudent;
    invited = allStudent.where((e) => event.invitedIds.contains(e.id)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        title: event.name,
        subTitle: CupertinoSwitch(
          activeColor: context.primaryDark,
          value: event.isActive,
          onChanged: (value) {
            setState(() {
              event.isActive = value;
            });
          },
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ConstrainedBox(
                constraints:
                    BoxConstraints(maxHeight: constraints.maxHeight - 75),
                child: CupertinoScrollbar(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: invited.length,
                    itemBuilder: (context, index) => SwitchStudentCell(
                      enable: event.isActive,
                      data: invited[index],
                      switchValue: event.joinedIds.contains(invited[index].id),
                      onChanged: (value) {
                        setState(() {
                          if (value) {
                            event.joinedIds.add(invited[index].id!);
                          } else {
                            event.joinedIds.remove(invited[index].id!);
                          }
                        });
                      },
                    ),
                    separatorBuilder: (context, index) => const CustomDivider(),
                  ),
                ),
              ),
              BaseButton.fixBottom(
                  title: 'Update',
                  onPressed: () {
                    Get.back(result: event);
                  })
            ],
          ),
        ));
  }
}
