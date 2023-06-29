import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/setting/components/setting_cell.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import '../../widgets/custom_card.dart';
import 'setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Setting',
        backgroundColor: context.neutral200,
        body: SingleChildScrollView(
          padding: padAll16,
          child: Column(
            children: [
              CustomCard(
                child: Column(
                  children: [
                    SettingCell(
                      prefix: SvgPicture.asset('assets/svg/Regular/Timer.svg'),
                      label: 'Schedule',
                      onTap: controller.onTapSchedule,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
