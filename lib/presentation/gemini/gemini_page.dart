import 'package:aio/core/utils/util.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/input_component.dart';
import 'components/messages_builder.dart';
import 'gemini_controller.dart';

class GeminiPage extends GetView<GeminiController> {
  const GeminiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
      title: 'Gemini',
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<GeminiController>(
              builder: (_) {
                return ListView.separated(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: padAll16,
                  reverse: true,
                  primary: true,
                  itemCount: _.messages.length,
                  separatorBuilder: (context, index) => sizedBoxH12,
                  itemBuilder: (context, index) {
                    final message = _.messages[index];
                    return MessagesBuilder(data: message);
                  },
                );
              },
            ),
          ),
          sizedBoxH06,
          const InputComponent(),
          sizedBoxH06,
        ],
      ),
    );
  }
}
