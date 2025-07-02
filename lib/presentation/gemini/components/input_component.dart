import 'package:aio/core/utils/util.dart';
import 'package:aio/widgets/base/base_state_widget.dart';
import 'package:aio/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../gemini_controller.dart';
import 'attachment_builder.dart';

class InputComponent extends GetWidget<GeminiController> {
  const InputComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
          onPressed: controller.onTapImage,
          icon: const Icon(Icons.photo),
        ),
        sizedBoxW04,
        IconButton(
          onPressed: controller.onTapFile,
          icon: const Icon(Icons.file_present),
        ),
        sizedBoxW04,
        Expanded(
          child: ClipRRect(
            borderRadius: borRad24,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                borderRadius: borRad24,
                border: Border.all(color: context.dividerColor),
              ),
              child: Column(
                children: [
                  Obx(
                    () => ABWidget(
                      isShowA: controller.attachments.isNotEmpty,
                      widgetA: (context) => SizedBox(
                        height: 64,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                primary: true,
                                padding: padSymHor10,
                                separatorBuilder: (context, index) =>
                                    sizedBoxW04,
                                itemCount: controller.attachments.length,
                                itemBuilder: (context, index) {
                                  final data =
                                      controller.attachments.elementAt(index);
                                  return AttachmentBuilder(
                                    data: data,
                                    onRemove: controller.onRemoveAttachment,
                                  );
                                },
                              ),
                            ),
                            sizedBoxH04,
                            const CustomDivider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    autofocus: true,
                    focusNode: controller.focusNode,
                    controller: controller.mesController,
                    onSubmitted: (value) =>
                        controller.onSendMessage(msg: value),
                    onEditingComplete: () => controller.onSendMessage(),
                    textInputAction: TextInputAction.newline,
                    textCapitalization: TextCapitalization.sentences,
                    maxLines: 5,
                    minLines: 1,
                    decoration: const InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      fillColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Message',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        sizedBoxW04,
        IconButton(
          onPressed: () => controller.onSendMessage(),
          icon: const Icon(Icons.send),
        ),
        sizedBoxW12,
      ],
    );
  }
}
