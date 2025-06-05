import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/base/base_input.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:aio/widgets/base/base_select_field.dart';

import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';
import 'edit_reminder_controller.dart';

class EditReminderPage extends GetView<EditReminderController> {
  const EditReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScaffoldAppBar(
        title: isEdit ? "Edit reminder" : "Add reminder",
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
                  child: GetBuilder<EditReminderController>(builder: (_) {
                    final data = controller.data;
                    return Column(
                      children: [
                        AvatarPicker(
                            onChangedAvatar: controller.onChangedAvatar),
                        BaseTextField(
                          labelText: 'Label',
                          controller: controller.nameController,
                          textInputAction: TextInputAction.next,
                          onChanged: controller.onChangeName,
                          autofocus: !isEdit,
                          validator: (name) {
                            if (name == null || name.isEmpty) {
                              return 'Label can not be empty';
                            }
                            return null;
                          },
                        ),
                        BaseDateField(
                          labelText: 'Remind date',
                          initDate: data.remindDate,
                          timeFormat: DateFormater.ddMMYYYY,
                          onSelected: controller.onChangeRemindDate,
                        ),
                        BaseSelectField<RepeatType>(
                          key: UniqueKey(),
                          isMultiSelect: false,
                          labelText: 'Repeat',
                          options: RepeatType.values,
                          initValue: [data.repeat],
                          onSelected: controller.onSelectedRepeatType,
                          itemBuilder: (_, obj) => Padding(
                            padding: padAll16,
                            child: Text(
                              obj.name,
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
                                    obj.name,
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
                          valueBuilder: (values) {
                            if (values == null || values.isEmpty) {
                              return "";
                            }
                            return values.map((e) => e.name).join(", ");
                          },
                        ),
                        if (data.repeat != RepeatType.None)
                          BaseSelectField<int>(
                            key: UniqueKey(),
                            isMultiSelect: false,
                            labelText: 'Repeat interval',
                            options: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                            initValue: [data.interval],
                            onSelected: controller.onSelectInterval,
                            itemBuilder: (_, e) => Padding(
                              padding: padAll16,
                              child: Text(
                                controller.getIntervelName(e),
                                style: AppFonts.bMedium
                                    .copyWith(color: context.neutral800),
                              ),
                            ),
                            selectedBuilder: (_, e) => Padding(
                              padding: padAll16,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      controller.getIntervelName(e),
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
                            valueBuilder: (values) {
                              if (values == null || values.isEmpty) {
                                return "";
                              }
                              return values
                                  .map((e) => controller.getIntervelName(e))
                                  .join(", ");
                            },
                          ),
                        if (data.repeat != RepeatType.None)
                          BaseDateField(
                            mode: CupertinoDatePickerMode.time,
                            initDate: controller.getAlertTime(),
                            labelText: 'Remind time',
                            onSelected: controller.onSelectedAlertTime,
                            timeFormat: DateFormater.HHmm,
                          ),
                        if (data.repeat != RepeatType.None)
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
                              return values
                                  .map((e) => e.nameFormated)
                                  .join(", ");
                            },
                          ),
                      ],
                    );
                  }),
                ),
              ),
            ),
            BaseButton.fixBottom(
              title: isEdit ? "Update".tr : "Add".tr,
              onPressed: controller.onInsertOrUpdate,
            )
          ],
        ));
  }
}
