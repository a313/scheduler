import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/util.dart';
import '../../../theme/app_fonts.dart';
import '../../../widgets/base/base_button.dart';
import '../../../widgets/base/base_input.dart';
import '../../../widgets/base/base_scafold_appbar.dart';
import 'edit_schedule_controller.dart';

class EditSchedulePage extends GetView<EditScheduleController> {
  const EditSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    final data = controller.data;
    return BaseScafoldAppBar(
        title: isEdit ? 'Edit Schedule'.tr : 'Add Schedule'.tr,
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: padAll16,
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseTextField(
                      labelText: 'Schedule name'.tr,
                      autofocus: true,
                      controller: controller.nameController,
                      textInputAction: TextInputAction.next,
                      onChanged: controller.onChangeName,
                      validator: (name) {
                        if (name == null || name.isEmpty) {
                          return 'Schedule name can not be empty'.tr;
                        }
                        return null;
                      },
                    ),
                    Text('Time Range'.tr, style: AppFonts.bLarge),
                    sizedBoxH16,
                    SizedBox(
                      key: UniqueKey(),
                      height: 150,
                      child: Row(
                        children: [
                          Expanded(
                            child: CupertinoDatePicker(
                              use24hFormat: true,
                              initialDateTime: DateTime(2020, 1, 1,
                                  data.begin.hour, data.begin.minute),
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: controller.onChangedBegin,
                            ),
                          ),
                          Text('to'.tr),
                          Expanded(
                            child: CupertinoDatePicker(
                              use24hFormat: true,
                              initialDateTime: DateTime(
                                  2020, 1, 1, data.end.hour, data.end.minute),
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: controller.onChangedEnd,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BaseButton.fixBottom(
            title: isEdit ? "Update".tr : "Add".tr,
            onPressed: controller.onInsertOrUpdate,
          )
        ]));
  }
}
