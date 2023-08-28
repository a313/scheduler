import 'dart:io';

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
        body: GetBuilder<OcrDetailController>(
          builder: (_) {
            return Column(children: [
              Image.file(
                File(controller.path),
              ),
              if (controller.qrPath != null)
                Image.file(
                  File(controller.qrPath!),
                  fit: BoxFit.none,
                ),

              // ...List.generate(controller.data.blocks.length, (index) {
              //   final block = controller.data.blocks[index];
              //   final box = block.boundingBox;
              //   final scale = controller.scale;
              //   final lines = block.lines;
              //   return Positioned(
            ]);
          },
        ) //       top: box.left * scale,
        //       right: box.top * scale,
        //       width: box.height * scale * 1.5,
        //       height: box.width * scale * 1.5,
        //       child: Container(
        //         color: const Color.fromARGB(207, 255, 255, 255),
        //         child: AutoSizeText(
        //           block.text,
        //           maxFontSize: 20,
        //           minFontSize: 4,
        //           maxLines: lines.length,
        //         ),
        //       ));
        // }),

        );
  }
}
