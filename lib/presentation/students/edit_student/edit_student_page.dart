import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/formater.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/presentation/class_room/components/class_room_item.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/base/base_state_widget.dart';

import '../../../theme/app_fonts.dart';
import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';
import 'edit_student_controller.dart';

class EditStudentPage extends GetView<EditStudentController> {
  const EditStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScafoldAppBar(
        onTappedScene: controller.hideKeyboard,
        onWillPop: controller.onWillPop,
        title: isEdit ? "Edit student" : "Add student",
        actions: isEdit
            ? [
                TextButton(
                  onPressed: controller.onDeleteStudent,
                  child: Text('Delete'.tr,
                      style: AppFonts.bSmall
                          .copyWith(color: context.funcRadicalRed)),
                )
              ]
            : [],
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: padAll16,
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      AvatarPicker(onChangedAvatar: controller.onChangedAvatar),
                      BaseTextField(
                        labelText: 'Name',
                        controller: controller.nameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeName,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Name can not be empty';
                          }
                          return null;
                        },
                      ),
                      Obx(() => BaseSearchField<ClassRoom>(
                            key: UniqueKey(),
                            onSelected: controller.onSelectedClass,
                            searchBy: (c, search) => c.name
                                .toLowerCase()
                                .contains(search.toLowerCase()),
                            itemBuilder: (_, obj) => ClassRoomItem(data: obj),
                            selectedBuilder: (_, obj) =>
                                ClassRoomItem(data: obj, isSelected: true),
                            isMultiSelect: true,
                            labelText: 'Class room',
                            options: controller.allClassRoom,
                            initValue: controller.selectedClassRoom.value,
                            valueBuilder: (values) {
                              if (values == null || values.isEmpty) {
                                return "Not in class";
                              }
                              return values.map((e) => e.name).join(", ");
                            },
                          )),
                      BaseDateField(
                        initDate: DateTime.now(),
                        labelText: 'Last charge'.tr,
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeLastCharge,
                      ),
                      BaseSwitchField(
                        labelText: 'Attendance?',
                        initState: controller.data.isFollow,
                        onChanged: controller.onChangeAttendance,
                      ),
                      BaseSwitchField(
                        labelText: 'Special case?',
                        initState: controller.data.isSpecial,
                        onChanged: controller.onChangeIsSpecial,
                      ),
                      Obx(() => ABWidget(
                          isShowA: controller.shouldShowFee.value,
                          widgetA: (_) => BaseTextField(
                                controller: controller.feeController,
                                keyboardType: TextInputType.number,
                                formaters: [CurrencyInputFormatter()],
                                labelText: "Fee",
                                onChanged: controller.onChangedFee,
                                textInputAction: TextInputAction.next,
                              ))),
                      BaseDateField(
                        labelText: 'Register date',
                        initDate: controller.data.beginStudy,
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeBeginStudy,
                      ),
                      BaseTextField(
                        labelText: 'Phone',
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
                title: isEdit ? "Update" : "Add",
                onPressed: controller.onInsertOrUpdate,
              ),
            )
          ],
        ));
  }
}
