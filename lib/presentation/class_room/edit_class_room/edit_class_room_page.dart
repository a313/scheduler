import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/class_room/edit_class_room/edit_class_room_controller.dart';
import 'package:scheduler/theme/app_fonts.dart';
import 'package:scheduler/widgets/add_cell.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';
import 'package:scheduler/widgets/base/base_select_field.dart';

import '../../../widgets/avatar_picker.dart';
import '../../../widgets/base/base_button.dart';
import '../components/timetable_cell.dart';

class EditClassRoomPage extends GetView<EditClassRoomController> {
  const EditClassRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEdit = controller.initData != null;
    return BaseScafoldAppBar(
        title: isEdit ? "Edit class" : "Add class",
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
                        labelText: 'Class name',
                        controller: controller.classNameController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeClassName,
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return 'Class name can not be empty';
                          }
                          return null;
                        },
                      ),
                      BaseTextField(
                        labelText: 'Location',
                        controller: controller.locationController,
                        textInputAction: TextInputAction.next,
                        onChanged: controller.onChangeLocation,
                      ),
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
                        labelText: 'Remind Me',
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
                        labelText: 'Create date',
                        initDate: controller.data.createDate,
                        timeFormat: DateFormater.ddMMYYYY,
                        onSelected: controller.onChangeCreateDate,
                      ),
                      BaseSwitchField(
                        labelText: 'Active?',
                        initState: controller.data.isOpen,
                        onChanged: controller.onChangedOpen,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Schedule',
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
                                      title: 'Add schedule',
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
              title: isEdit ? "Update" : "Add",
              onPressed: controller.onInsertOrUpdate,
            ),
          ],
        ));
  }
}
