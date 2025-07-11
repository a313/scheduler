import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/presentation/class_room/edit_class_room/edit_class_room_controller.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/add_cell.dart';
import 'package:aio/widgets/base/base_input.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/base/base_select_field.dart';
import 'package:aio/widgets/text_field_formater/numberic_formater.dart';

import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';
import '../components/timetable_cell.dart';

class EditClassRoomPage extends GetView<EditClassRoomController> {
  const EditClassRoomPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScaffoldAppBar(
        title: isEdit ? 'Edit class'.tr : 'Add class'.tr,
        onTappedScene: controller.hideKeyboard,
        onPopInvoked: controller.onWillPop,
        actions: isEdit
            ? [
                TextButton(
                  onPressed: controller.onDeleteClass,
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
                      AvatarPicker(onChangedAvatar: controller.onChangedImage),
                      BaseTextField(
                        labelText: 'Class name'.tr,
                        controller: controller.classNameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeClassName,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Class name can not be empty'.tr;
                          }
                          return null;
                        },
                      ),
                      BaseTextField(
                        labelText: 'Location'.tr,
                        controller: controller.locationController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeLocation,
                      ),
                      BaseTextField(
                        labelText: 'Tuition'.tr,
                        keyboardType: TextInputType.number,
                        controller: controller.tuitionController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeTuition,
                        formaters: [NumbericInputFormatter()],
                      ),
                      BaseSelectField<AlertType>(
                        onSelected: controller.onSelectedAlertType,
                        itemBuilder: (_, obj) => Padding(
                          padding: padAll16,
                          child: Text(
                            obj.nameFormated,
                            style: AppFonts.bMedium
                                .copyWith(color: context.neutral800),
                          ),
                        ),
                        selectedBuilder: (_, obj) => Padding(
                          padding: padAll16,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  obj.nameFormated,
                                  style: AppFonts.bMedium
                                      .copyWith(color: context.neutral1100),
                                ),
                              ),
                              Icon(
                                Icons.check,
                                color: context.primaryDark,
                                size: 16,
                              )
                            ],
                          ),
                        ),
                        isMultiSelect: false,
                        labelText: 'Remind me'.tr,
                        options: AlertType.values,
                        initValue: [controller.data.alert],
                        valueBuilder: (values) {
                          if (values == null || values.isEmpty) {
                            return "";
                          }
                          return values.map((e) => e.nameFormated).join(", ");
                        },
                      ),
                      BaseDateField(
                        labelText: 'Open date'.tr,
                        initDate: controller.data.openDate,
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeOpenDate,
                      ),
                      BaseSwitchField(
                        labelText: 'Active?'.tr,
                        initState: controller.data.isOpen,
                        onChanged: controller.onChangedOpen,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Schedule'.tr,
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
                                      title: 'Add schedule'.tr,
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
            BaseButton.fixBottom(
              title: isEdit ? 'Update'.tr : 'Add'.tr,
              onPressed: controller.onInsertOrUpdate,
            ),
          ],
        ));
  }
}
