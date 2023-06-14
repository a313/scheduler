import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/class_room/edit_class_room/edit_class_room_controller.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/add_cell.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';
import '../components/timetable_cell.dart';

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
                          GetBuilder<EditClassRoomController>(
                            builder: (controller) => Column(
                              children: List.generate(
                                  controller.data.timetables.length,
                                  (index) => TimetableCell(
                                        data: controller.data.timetables[index],
                                        onTapped: controller.onEditTimetable,
                                        onRemove: controller.onRemove,
                                      ))
                                ..add(
                                  AddCell(
                                      title: 'Thêm lịch học',
                                      onTapped: controller.onAddTimetable),
                                ),
                            ),
                          )
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
