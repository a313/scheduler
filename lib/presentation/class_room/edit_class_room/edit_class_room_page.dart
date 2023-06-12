import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/class_room/edit_class_room/edit_class_room_controller.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

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
                  child: Column(
                    children: [
                      AvatarPicker(onChangedAvatar: controller.onChangedImage),
                      BaseTextField(
                        labelText: 'Tên Lớp',
                        controller: controller.classNameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeClassName,
                      ),
                      BaseDateField(
                        labelText: 'Ngày mở lớp',
                        initDate: controller.data.createDate,
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeCreateDate,
                      ),
                      BaseSwitchField(
                        labelText: 'Hoạt động',
                        initState: controller.data.isOpen,
                        onChanged: controller.onChangedOpen,
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
