import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/class_room.dart';
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
        title: isEdit ? "Edit Student" : "Add Student",
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
                        labelText: 'Name',
                        controller: controller.nameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeName,
                      ),
                      BaseSearchField<ClassRoom>(
                        onSelected: controller.onSelectedClass,
                        searchBy: (c, search) =>
                            c.name.toLowerCase().contains(search.toLowerCase()),
                        itemBuilder: (_, obj) => ClassRoomComponent(data: obj),
                        selectedBuilder: (_, obj) =>
                            ClassRoomComponent(data: obj, isSelected: true),
                        isMultiSelect: true,
                        labelText: 'Class Room',
                        options: controller.allClassRoom,
                      ),
                      BaseSwitchField(
                        labelText: 'Attendance',
                        initState: controller.data.isFollow,
                        onChanged: controller.onChangeAttendance,
                      ),
                      BaseSwitchField(
                        labelText: 'Is Special',
                        initState: controller.data.isSpecial,
                        onChanged: controller.onChangeIsSpecial,
                      ),
                      Obx(() => ABWidget(
                          isShowA: controller.shouldShowFee.value,
                          widgetA: (_) => BaseTextField(
                                controller: controller.feeController,
                                labelText: "Fee",
                                onChanged: controller.onChangedFee,
                                textInputAction: TextInputAction.next,
                              ))),
                      BaseDateField(
                        labelText: 'Register Date',
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeBeginStudy,
                      ),
                      BaseTextField(
                        labelText: 'Phone',
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
                title: isEdit ? "Update" : "Add",
                onPressed: controller.onInsertOrUpdate,
              ),
            )
          ],
        ));
  }
}

class ClassRoomComponent extends StatelessWidget {
  const ClassRoomComponent({
    super.key,
    this.isSelected = false,
    required this.data,
  });
  final bool isSelected;
  final ClassRoom data;

  @override
  Widget build(BuildContext context) {
    return Text(data.name);
  }
}
