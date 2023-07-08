import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/data/models/class_room.dart';
import 'package:scheduler/data/models/student.dart';
import 'package:scheduler/presentation/students/components/multi_select_student_cell.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/base/base_button.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/base/base_select_field.dart';

import '../../../core/utils/util.dart';
import '../../../widgets/base/base_input.dart';
import '../../class_room/components/class_room_item.dart';
import 'edit_event_controller.dart';

class EditEventPage extends GetView<EditEventController> {
  const EditEventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScafoldAppBar(
        title: isEdit ? 'Edit event'.tr : 'New event'.tr,
        onTappedScene: controller.hideKeyboard,
        onWillPop: controller.onWillPop,
        actions: isEdit
            ? [
                TextButton(
                  onPressed: controller.onDeleteEvent,
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
                      BaseTextField(
                        labelText: 'Tittle'.tr,
                        controller: controller.nameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeTitle,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Title cannot be empty'.tr;
                          }
                          return null;
                        },
                      ),
                      BaseDateField(
                        labelText: 'Start time'.tr,
                        initDate: controller.data.startTime,
                        onSelected: controller.onSelectStartTime,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        timeFormat: DateFormater.MMddyyyyHHmm,
                      ),
                      BaseDateField(
                        labelText: 'End time'.tr,
                        initDate: controller.data.endTime,
                        onSelected: controller.onSelectEndTime,
                        mode: CupertinoDatePickerMode.dateAndTime,
                        timeFormat: DateFormater.MMddyyyyHHmm,
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
                            labelText: 'Class room'.tr,
                            options: controller.allClassRoom,
                            initValue:
                                controller.selectedClassRoom.value == null
                                    ? []
                                    : [controller.selectedClassRoom.value!],
                            valueBuilder: (values) {
                              if (values == null || values.isEmpty) return "";
                              return values.map((e) => e.name).join(", ");
                            },
                          )),
                      Obx(() => BaseSearchField<Student>(
                            key: UniqueKey(),
                            onSelected: controller.onSelectedStudent,
                            searchBy: (c, search) => c.name
                                .toLowerCase()
                                .contains(search.toLowerCase()),
                            itemBuilder: (_, obj) => MultiSelectStudentCell(
                                data: obj, didSelect: false),
                            selectedBuilder: (_, obj) => MultiSelectStudentCell(
                                data: obj, didSelect: true),
                            isMultiSelect: true,
                            labelText: 'Student'.tr,
                            options: controller.allStudent,
                            initValue: controller.selectedStudent.value,
                            valueBuilder: (values) {
                              if (values == null || values.isEmpty) {
                                return "";
                              }
                              return values.map((e) => e.name).join(", ");
                            },
                          )),
                      BaseSelectField<AlertType>(
                        key: UniqueKey(),
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
                      // BaseSelectField<RepeatType>(
                      //   key: UniqueKey(),
                      //   onSelected: controller.onSelectedRepeatType,
                      //   itemBuilder: (_, obj) => Padding(
                      //     padding: padAll16,
                      //     child: Text(
                      //       obj.name,
                      //       style: AppFonts.bMedium
                      //           .copyWith(color: context.neutral800),
                      //     ),
                      //   ),
                      //   selectedBuilder: (_, obj) => Padding(
                      //     padding: padAll16,
                      //     child: Row(
                      //       children: [
                      //         Expanded(
                      //           child: Text(
                      //             obj.name,
                      //             style: AppFonts.bMedium
                      //                 .copyWith(color: context.neutral1100),
                      //           ),
                      //         ),
                      //         Icon(
                      //           Icons.check,
                      //           color: context.primaryDark,
                      //           size: 16,
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      //   isMultiSelect: false,
                      //   labelText: 'Repeat',
                      //   options: RepeatType.values,
                      //   initValue: [controller.data.repeat],
                      //   valueBuilder: (values) {
                      //     if (values == null || values.isEmpty) {
                      //       return "";
                      //     }
                      //     return values.map((e) => e.name).join(", ");
                      //   },
                      // ),
                      BaseTextField(
                        labelText: 'Location'.tr,
                        controller: controller.locationController,
                        onChanged: controller.onChangeLocation,
                      ),
                      BaseTextField(
                        labelText: 'Note'.tr,
                        controller: controller.noteController,
                        textInputAction: TextInputAction.done,
                        onChanged: controller.onChangeNote,
                        onSubmitted: (p1) => controller.onInsertOrUpdate(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BaseButton.fixBottom(
              title: isEdit ? 'Update'.tr : 'Add'.tr,
              onPressed: controller.onInsertOrUpdate,
            )
          ],
        ));
  }
}
