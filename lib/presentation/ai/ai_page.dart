import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/platform_widget.dart';

import '../../widgets/base/base_scafold_appbar.dart';
import 'ai_controller.dart';

class AiPage extends GetView<AiController> {
  const AiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final body = GetBuilder<AiController>(
      builder: (controller) {
        return Chat(
          messages: controller.messages,
          onSendPressed: controller.onSendPressed,
          onAttachmentPressed: controller.onAttachmentPressed,
          onMessageTap: controller.onMessageTap,
          user: controller.user,
          showUserNames: true,
        );
      },
    );
    return PlatformWidget(
      desktop: BaseScaffold(body: body),
      mobile: BaseScaffoldAppBar(
        body: body,
        title: 'Ai'.tr,
      ),
    );
  }
}
