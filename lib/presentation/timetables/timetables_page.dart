import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/extensions/build_context.dart';
import 'package:scheduler/core/utils/extensions/nums.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'timetables_controller.dart';

class TimetablesPage extends GetView<TimetablesController> {
  const TimetablesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        backgroundColor: context.neutral200,
        title: 'Timetable',
        body: const Column(
          children: [
            Header(),
          ],
        ));
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text('')),
        Expanded(child: Text(1.getDayOfWeek)),
        Expanded(child: Text(2.getDayOfWeek)),
        Expanded(child: Text(3.getDayOfWeek)),
        Expanded(child: Text(4.getDayOfWeek)),
        Expanded(child: Text(5.getDayOfWeek)),
        Expanded(child: Text(6.getDayOfWeek)),
        Expanded(child: Text(7.getDayOfWeek)),
      ],
    );
  }
}
