import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';
import 'edit_reminder_controller.dart';

class EditReminderPage extends GetView<EditReminderController> {
  const EditReminderPage({Key? key}) : super(key: key);

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
                      AvatarPicker(onChangedAvatar: controller.onChangedAvatar),
                      BaseTextField(
                        labelText: 'Tên lời nhắc',
                        controller: controller.nameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeName,
                        autofocus: !isEdit,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Tên không được để trống';
                          }
                          return null;
                        },
                      ),
                      BaseDateField(
                        labelText: 'Ngày tạo',
                        initDate: controller.data.createDate,
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeDateCreate,
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
