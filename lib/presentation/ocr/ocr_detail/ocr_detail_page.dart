import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'ocr_detail_controller.dart';

class OcrDetailPage extends GetView<OcrDetailController> {
  const OcrDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'OCR Detail',
        body: controller.obx(
          (state) => Stack(children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.memory(state!),
            ),
            ...List.generate(controller.data.blocks.length, (index) {
              final block = controller.data.blocks[index];
              final box = block.boundingBox;
              final scale = controller.scale;
              final lines = block.lines;
              return Positioned(
                  top: box.left * scale,
                  right: box.top * scale,
                  width: box.height * scale,
                  height: box.width * scale,
                  child: Container(
                    color: const Color.fromARGB(207, 255, 255, 255),
                    child: AutoSizeText(
                      block.text,
                      minFontSize: 4,
                      maxLines: lines.length,
                    ),
                  ));
            }),
          ]),
        ));
  }
}
