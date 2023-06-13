import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/class_room/edit_class_room/edit_class_room_controller.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../../data/models/timetable.dart';
import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';

class EditClassRoomPage extends GetView<EditClassRoomController> {
  const EditClassRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScafoldAppBar(
        title: isEdit ? "Sửa thông tin" : "Thêm mới",
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: padAll16,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AvatarPicker(onChangedAvatar: controller.onChangedImage),
                      BaseTextField(
                        labelText: 'Tên lớp',
                        controller: controller.classNameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeClassName,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Tên không được để trống';
                          }
                          return null;
                        },
                      ),
                      BaseDateField(
                        labelText: 'Ngày mở lớp',
                        initDate: controller.data.createDate,
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeCreateDate,
                      ),
                      BaseSwitchField(
                        labelText: 'Đang hoạt động?',
                        initState: controller.data.isOpen,
                        onChanged: controller.onChangedOpen,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thời khóa biểu',
                            style: AppFonts.bMedium
                                .copyWith(color: context.primaryDark),
                          ),
                          controller.obx(
                              (state) => Column(
                                    children: List.generate(
                                        state!.length,
                                        (index) => TimetableCell(
                                              data: state[index],
                                              onTapped:
                                                  controller.onEditTimetable,
                                            ))
                                      ..add(
                                        AddTimetableCell(
                                            onTapped:
                                                controller.onAddTimetable),
                                      ),
                                  ),
                              onEmpty: AddTimetableCell(
                                  onTapped: controller.onAddTimetable)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: padAll16,
              child: BaseButton.largePrimary(
                title: isEdit ? "Cập nhật" : "Thêm mới",
                onPressed: controller.onInsertOrUpdate,
              ),
            )
          ],
        ));
  }
}

class TimetableCell extends StatelessWidget {
  const TimetableCell({
    Key? key,
    required this.data,
    this.onTapped,
  }) : super(key: key);

  final Timetable data;
  final Function(Timetable data)? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapped?.call(data),
      child: Row(
        children: [
          Icon(
            Icons.remove,
            color: context.funcRadicalRed,
          ),
          sizedBoxW04,
          Text('${data.begin}-${data.end}'),
        ],
      ),
    );
  }
}

class AddTimetableCell extends StatelessWidget {
  const AddTimetableCell({
    super.key,
    required this.onTapped,
  });
  final Function() onTapped;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: const Padding(
        padding: padSymHor08Ver06,
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.green,
            ),
            sizedBoxW04,
            Text('Thêm khoảng thời gian'),
          ],
        ),
      ),
    );
  }
}
