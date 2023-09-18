import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_button.dart';

import '../components/ekyc_view.dart';
import 'ocr_detail_controller.dart';

class OcrDetailPage extends StatelessWidget {
  const OcrDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OcrDetailController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(title: const Text('OCR Detail')),
              body: ui1(controller),
            ));
  }

  Widget ui1(OcrDetailController controller) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Image.file(controller.file),
              const Divider(),
              EkycView(ekyc: controller.current),
            ]),
          ),
        ),
        BaseButton.fixBottom2(
          leftTitle: 'Chụp lại',
          onLeftPressed: controller.onReTake,
          rightTitle: 'Tiếp tục',
          onRightPressed: controller.onNext,
        )
      ],
    );
  }

  // Widget ui2(OcrDetailController controller) {
  //   final tmp = controller.recognizedText?.blocks.map((e) => e.lines);

  //   List<TextLine> lines = [];
  //   tmp?.forEach((element) {
  //     lines.addAll(element);
  //   });

  //   return SafeArea(
  //     left: false,
  //     right: false,
  //     child: SingleChildScrollView(
  //       child: SingleChildScrollView(
  //         scrollDirection: Axis.horizontal,
  //         padding: const EdgeInsets.all(1),
  //         child: SizedBox(
  //           width: controller.util.imgWidth.toDouble(),
  //           height: controller.util.imgHeight.toDouble(),
  //           child: Stack(children: [
  //             Image.file(controller.file),
  //             ...List.generate(lines.length, (index) {
  //               final line = lines.elementAt(index);
  //               return Positioned.fromRect(
  //                 rect: line.boundingBox,
  //                 child: AutoSizeText(
  //                   '($index) ${line.text}',
  //                   minFontSize: 4,
  //                   style: AppFonts.bLarge,
  //                 ).coloredBox(color: line.text.nameToColor().withOpacity(0.4)),
  //               );
  //             }),
  //             ...List.generate(controller.util.offsets.length, (index) {
  //               final offset = controller.util.offsets.elementAt(index);
  //               return Positioned(
  //                   left: offset.dx - 10,
  //                   top: offset.dy - 10,
  //                   child: Container(
  //                     width: 20,
  //                     height: 20,
  //                     decoration: const BoxDecoration(
  //                       shape: BoxShape.circle,
  //                       color: Colors.yellow,
  //                     ),
  //                     child: AutoSizeText(
  //                       '$index',
  //                       minFontSize: 1,
  //                       style: AppFonts.bLarge,
  //                       textAlign: TextAlign.center,
  //                     ),
  //                   ));
  //             })
  //           ]),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
