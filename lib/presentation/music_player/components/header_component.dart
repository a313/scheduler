import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/constants/sized_boxs.dart';
import 'package:aio/presentation/music_player/music_player_controller.dart';
import 'package:aio/widgets/base/base_button.dart';
import 'package:aio/widgets/base/search_field.dart';

class HeaderComponent extends GetWidget<MusicPlayerController> {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(hintText: 'Find song', onChanged: controller.onFilter),
        sizedBoxH08,
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: BaseButton.mediumPrimary(
                    title: 'Play', onPressed: controller.onPlay)),
            sizedBoxW16,
            Expanded(
              child: BaseButton.mediumPrimary(
                  title: 'Shuffle', onPressed: controller.onShuffle),
            ),
          ],
        ),
      ],
    );
  }
}
