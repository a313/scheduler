import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/presentation/class_room/components/class_room_item.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';

import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';
import 'edit_student_controller.dart';

class EditStudentPage extends GetView<EditStudentController> {
  const EditStudentPage({Key? key}) : super(key: key);

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
                  child: Column(
                    children: [
                      AvatarPicker(onChangedAvatar: controller.onChangedAvatar),
                      BaseTextField(
                        labelText: 'Tên Học Sinh',
                        controller: controller.nameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeName,
                      ),
                      BaseSearchField<ClassRoom>(
                        onSelected: controller.onSelectedClass,
                        searchBy: (c, search) =>
                            c.name.toLowerCase().contains(search.toLowerCase()),
                        itemBuilder: (_, obj) => ClassRoomItem(data: obj),
                        selectedBuilder: (_, obj) =>
                            ClassRoomItem(data: obj, isSelected: true),
                        isMultiSelect: true,
                        labelText: 'Lớp Học',
                        options: controller.allClassRoom,
                      ),
                      BaseSwitchField(
                        labelText: 'Đang theo học?',
                        initState: controller.data.isFollow,
                        onChanged: controller.onChangeAttendance,
                      ),
                      BaseSwitchField(
                        labelText: 'Học phí riêng?',
                        initState: controller.data.isSpecial,
                        onChanged: controller.onChangeIsSpecial,
                      ),
                      Obx(() => ABWidget(
                          isShowA: controller.shouldShowFee.value,
                          widgetA: (_) => BaseTextField(
                                controller: controller.feeController,
                                keyboardType: TextInputType.number,
                                labelText: "Học phí",
                                onChanged: controller.onChangedFee,
                                textInputAction: TextInputAction.next,
                              ))),
                      BaseDateField(
                        labelText: 'Ngày đăng ký',
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeBeginStudy,
                      ),
                      BaseTextField(
                        labelText: 'Số điện thoại',
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangedPhone,
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
