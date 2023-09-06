import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/ekyc.dart';

import '../../../theme/app_fonts.dart';
import 'ocr_detail_controller.dart';

class OcrDetailPage extends GetView<OcrDetailController> {
  const OcrDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('OCR Detail')),
        floatingActionButton: FloatingActionButton.small(
            onPressed: () => controller.analyzeData(Ekyc())),
        body: GetBuilder<OcrDetailController>(
          builder: (_) {
            return ui1();
          },
        ));
  }

  Widget ui1() {
    return SingleChildScrollView(
      child: Column(children: [
        Image.memory(
          key: UniqueKey(),
          controller.imageData,
        ),
        const Divider(),
        EkycView(
          ekyc: controller.ekyc,
          key: UniqueKey(),
        ),
      ]),
    );
  }

  Widget ui2() {
    final tmp = controller.recognizedText?.blocks.map((e) => e.lines);

    List<TextLine> lines = [];
    tmp?.forEach((element) {
      lines.addAll(element);
    });

    return SafeArea(
      left: false,
      right: false,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(1),
        child: SizedBox(
          width: controller.imgWidth.toDouble(),
          height: controller.imgHeight.toDouble(),
          child: Stack(children: [
            Image.memory(
              key: UniqueKey(),
              controller.imageData,
              width: controller.imgWidth.toDouble(),
              height: controller.imgHeight.toDouble(),
            ).debugSize(),
            ...List.generate(lines.length, (index) {
              final line = lines.elementAt(index);
              return Positioned.fromRect(
                rect: line.boundingBox,
                child: AutoSizeText(
                  '($index) ${line.text}',
                  minFontSize: 4,
                  style: AppFonts.bLarge,
                ).coloredBox(color: line.text.nameToColor().withOpacity(0.4)),
              );
            }),
            ...List.generate(controller.offsets.length, (index) {
              final offset = controller.offsets.elementAt(index);
              return Positioned(
                  left: offset.dx - 10,
                  top: offset.dy - 10,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.yellow,
                    ),
                    child: AutoSizeText(
                      '$index',
                      minFontSize: 1,
                      style: AppFonts.bLarge,
                      textAlign: TextAlign.center,
                    ),
                  ));
            })
          ]),
        ),
      ),
    );
  }
}

class EkycView extends StatelessWidget {
  const EkycView({
    super.key,
    this.ekyc,
  });
  final Ekyc? ekyc;
  @override
  Widget build(BuildContext context) {
    final k = ekyc;
    if (k == null) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Loại thẻ: ${k.cardType?.name}'),
        Text('Số: ${k.identifyNumber}'),
        Text('Họ và Tên: ${k.fullName}'),
        Text('Ngày sinh: ${k.dateOfBirth}'),
        Text('Giới tính: ${k.sex}'),
        Text('Quốc tịch: ${k.nationality}'),
        Text('Quê quán: ${k.placeOfOrigin}'),
        Text('Nơi thường chú: ${k.placeOfResidence}'),
        Text('Có giá trị đến: ${k.dateOfExpiry}'),
      ],
    );
  }
}
