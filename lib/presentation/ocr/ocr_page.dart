import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';

import '../../widgets/base/base_scafold_appbar.dart';
import 'ocr_controller.dart';

class OcrPage extends GetView<OcrController> {
  const OcrPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'OCR',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity),
          InkWell(
            onTap: controller.onTappedCCCD,
            child: const Text('Căn cước công dân'),
          ),
          sizedBoxH16,
          InkWell(
            onTap: controller.onTappedCMT,
            child: const Text('Chứng minh thư'),
          ),
          sizedBoxH16,
          // InkWell(
          //   onTap: controller.onTappedPassport,
          //   child: const Text('Hộ chiếu'),
          // ),
          // sizedBoxH16,
          // InkWell(
          //   onTap: controller.onTappedFreeStyle,
          //   child: const Text('Unknown'),
          // ),
        ],
      ),
    );
  }
}
