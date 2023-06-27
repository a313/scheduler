import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/widgets/base/base_input.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'components/report_component.dart';
import 'report_controller.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
        title: 'Report',
        body: GetBuilder<ReportController>(
          init: ReportController(),
          builder: (_) {
            return Column(
              children: [
                Padding(
                  padding: padSymHor16,
                  child: Row(
                    children: [
                      Expanded(
                        child: BaseDateField(
                            labelText: 'Start',
                            initDate: _.startDate,
                            onSelected: _.onChangeStart,
                            timeFormat: DateFormater.ddMMYYYY),
                      ),
                      sizedBoxW12,
                      Expanded(
                        child: BaseDateField(
                            labelText: 'End',
                            initDate: _.endDate,
                            onSelected: _.onChangeStart,
                            timeFormat: DateFormater.ddMMYYYY),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: CustomScrollView(
                        slivers:
                            List.generate(_.formatedData.keys.length, (index) {
                  final key = _.formatedData.keys.elementAt(index);
                  final events = _.formatedData[key]!;
                  return ReportComponent(
                    classRoom: key,
                    data: events,
                  );
                })))
              ],
            );
          },
        ));
  }
}
