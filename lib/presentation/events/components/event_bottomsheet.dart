import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
  late List<int> joinIds;
  late List<int> invIds;
  late bool isActive;

  @override
  void initState() {
    isActive = widget.event.isActive;
    invIds = List<int>.from(widget.event.invitedIds);
    joinIds = List<int>.from(widget.event.joinedIds);
    invited = widget.allStudent.where((e) => invIds.contains(e.id)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
        title: widget.event.name,
        subTitle: CupertinoSwitch(
          activeColor: context.primaryDark,
          value: isActive,
          onChanged: (value) {
            setState(() {
              isActive = value;
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
                      enable: isActive,
                      data: invited[index],
                      switchValue: joinIds.contains(invited[index].id),
                      onChanged: (value) {
                        setState(() {
                          if (value) {
                            joinIds.add(invited[index].id!);
                          } else {
                            joinIds.remove(invited[index].id!);
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
                    if (isActive == widget.event.isActive &&
                        listEquals(joinIds, widget.event.joinedIds)) {
                      Get.back();
                    } else {
                      widget.event.isActive = isActive;
                      widget.event.joinedIds = joinIds;
                      Get.back(result: widget.event);
                    }
                  })
            ],
          ),
        ));
  }
}
