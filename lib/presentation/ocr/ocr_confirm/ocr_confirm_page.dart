import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/widgets/base/base_button.dart';
import 'package:aio/widgets/base/base_input.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';

import '../../../widgets/base/base_date_picker.dart';
import '../components/ekyc_images_component.dart';
import 'components/gender_picker.dart';
import 'ocr_confirm_controller.dart';

class OcrConfirmPage extends GetView<OcrConfirmController> {
  const OcrConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
        title: 'Cập nhật thông tin danh tính',
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<OcrConfirmController>(builder: (controller) {
                final ekyc = controller.current;
                return Form(
                  key: controller.formKey,
                  child: ListView(
                    padding: padAll16,
                    children: [
                      EkycImagesComponent(ekyc: controller.current),
                      sizedBoxH24,
                      BaseTextField(
                        labelText: 'Số CMND/CCCD',
                        validMode: AutovalidateMode.always,
                        initialValue: ekyc.identifyNumber,
                        onChanged: controller.onChangeCCCD,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (!value.hasText) {
                            return 'Số CCCD không được để trống';
                          }
                          final length = value?.length ?? 0;
                          const min = 8, max = 12;
                          if (length < min || length > max) {
                            return "Vui lòng nhập đủ $min tới $max ký tự";
                          }
                          return null;
                        },
                      ),
                      sizedBoxH16,
                      BaseTextField(
                        labelText: 'Họ và tên',
                        validMode: AutovalidateMode.always,
                        initialValue: ekyc.fullName,
                        onChanged: controller.onChangeName,
                        maxLength: 75,
                        validator: (value) {
                          if (!value.hasText) {
                            return 'Họ và tên không được để trống';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH16,
                      BaseDatePicker(
                        title: 'Ngày/tháng/năm sinh',
                        isRequired: true,
                        maxDate: DateTime.now().add(const Duration(hours: 2)),
                        validMode: AutovalidateMode.always,
                        onSelected: controller.onChangeBirthday,
                        initDate: ekyc.doB,
                        validator: (date) {
                          if (date == null) {
                            return 'Ngày/tháng/năm sinh không được để trống';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH16,
                      GenderPicker(
                        isRequired: false,
                        option: const ['Chọn giới tính', 'Nam', 'Nữ', 'Khác'],
                        title: 'Giới tính',
                        initIndex: convertGenderToIndex(ekyc.sex),
                        onChanged: controller.onChangeGender,
                      ),
                      sizedBoxH16,
                      BaseTextField(
                        labelText: 'Quốc tịch',
                        onChanged: controller.onChangeNation,
                        initialValue: ekyc.nationality,
                        maxLength: 255,
                      ),
                      sizedBoxH16,
                      BaseTextField(
                        labelText: 'Nơi cấp',
                        onChanged: controller.onChangeIssueLoc,
                        validMode: AutovalidateMode.always,
                        initialValue: ekyc.issueLoc,
                        maxLength: 512,
                        maxLines: null,
                        validator: (value) {
                          if (!value.hasText) {
                            return 'Nơi cấp không được để trống';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH16,
                      BaseDatePicker(
                        title: 'Ngày cấp',
                        isRequired: true,
                        initDate: controller.current.doI,
                        maxDate: DateTime.now().add(const Duration(hours: 1)),
                        onSelected: controller.onChangeIssueDate,
                        validMode: AutovalidateMode.always,
                        validator: (date) {
                          if (date == null) {
                            return 'Ngày cấp không được để trống';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH16,
                      BaseDatePicker(
                        title: 'Ngày hết hạn',
                        isRequired: false,
                        onSelected: controller.onChangeDateOfExpired,
                        validMode: AutovalidateMode.always,
                        minDate: ekyc.doI,
                        initDate: ekyc.doE,
                        canReturnNull: true,
                        validator: (date) {
                          if (date == null) {
                            return 'Ngày hết hạn không được để trống';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH16,
                      BaseTextField(
                        labelText: 'Quê quán',
                        onChanged: controller.onChangePoO,
                        validMode: AutovalidateMode.always,
                        initialValue: ekyc.placeOfOrigin,
                        maxLength: 512,
                        maxLines: null,
                        validator: (value) {
                          if (!value.hasText) {
                            return 'Quê quán không được để trống';
                          }
                          return null;
                        },
                      ),
                      sizedBoxH16,
                      BaseTextField(
                        labelText: 'Địa chỉ thường trú',
                        onChanged: controller.onChangePoR,
                        validMode: AutovalidateMode.always,
                        initialValue: ekyc.placeOfResidence,
                        maxLength: 512,
                        maxLines: null,
                        validator: (value) {
                          if (!value.hasText) {
                            return 'Địa chỉ thường trú không được để trống';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
            BaseButton.fixBottom2(
                leftTitle: 'Chụp lại',
                onLeftPressed: controller.onReTake,
                rightTitle: 'Hoàn tất',
                onRightPressed: controller.onSubmit)
          ],
        ));
  }

  int convertGenderToIndex(String? sex) {
    if (!sex.hasText) return 0;
    if (sex == 'Nam') return 1;
    if (sex == 'Nữ') return 2;
    return 3;
  }
}
