import 'package:aio/core/utils/util.dart';
import 'package:aio/theme/app_dark_colors.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/base/base_scafold_appbar.dart';
import 'package:flutter/material.dart';
import 'package:full_calender/enums/branch.dart';
import 'package:full_calender/enums/language_name.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'components/default_day_cell.dart';
import 'components/selected_day_cell.dart';
import 'components/today_day_cell.dart';
import 'lunar_controller.dart';

class LunarPage extends GetView<LunarController> {
  const LunarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
      title: 'Lunar Calendar'.tr,
      body: Column(
        children: [
          Obx(() {
            final lunar =
                controller.getLunarDate(controller.selectedDate.value);
            final lstLuckyHour = lunar.listLuckyHours;
            final lstHour = lunar.listStemBranchOfHour;
            var str = '';
            for (int i = 0; i < lstLuckyHour.length; i++) {
              if (lstLuckyHour[i] == true) {
                str +=
                    '${lstHour[i].name(LanguageName.vietNam)} (${lstHour[i].branch.hourRange[0]}-${lstHour[i].branch.hourRange[1]}); ';
              }
            }
            return Column(
              children: [
                sizedBoxH28,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        'THÁNG ${lunar.month}',
                        style:
                            AppFonts.h500.copyWith(color: context.primaryLight),
                      ),
                      Text(
                        lunar.day.toString(),
                        style: TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.w700,
                        ).copyWith(color: AppDarkColors.funcCornflowerBlue),
                      ),
                      Text(
                        'NĂM ${lunar.stemBranchOfYear.name(LanguageName.vietNam).toUpperCase()}',
                        style:
                            AppFonts.h500.copyWith(color: context.primaryLight),
                      ),
                      sizedBoxH24,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GIỜ HOÀNG ĐẠO:',
                            style: AppFonts.h200
                                .copyWith(color: context.neutral800),
                          ),
                          sizedBoxH08,
                          Text(
                            str,
                            style: AppFonts.h300
                                .copyWith(color: context.neutral800),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                sizedBoxH32,
              ],
            );
          }),
          Obx(() => TableCalendar(
                locale: Get.locale?.toString(),
                focusedDay: controller.selectedDate.value,
                firstDay: DateTime(2000),
                lastDay: DateTime(2100),
                startingDayOfWeek: StartingDayOfWeek.monday,
                calendarFormat: CalendarFormat.month,
                currentDay: DateTime.now(),
                headerVisible: false,
                selectedDayPredicate: (day) =>
                    isSameDay(controller.selectedDate.value, day),
                onDaySelected: controller.onDaySelected,
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, _) {
                    final lunarDetail = controller.getLunarDate(date);
                    return DefaultDayCell(date: date, lunarDetail: lunarDetail);
                  },
                  selectedBuilder: (context, date, _) {
                    final lunarDetail = controller.getLunarDate(date);
                    return SelectedDayCell(
                        date: date, lunarDetail: lunarDetail);
                  },
                  todayBuilder: (context, date, _) {
                    final lunarDetail = controller.getLunarDate(date);
                    return TodayDayCell(date: date, lunarDetail: lunarDetail);
                  },
                ),
                calendarStyle: CalendarStyle(
                  defaultTextStyle: AppFonts.bMedium,
                  selectedTextStyle:
                      AppFonts.bMedium.copyWith(color: context.neutral100),
                  selectedDecoration: BoxDecoration(
                      color: context.primaryDark, shape: BoxShape.circle),
                  todayTextStyle: AppFonts.bMedium,
                  todayDecoration: BoxDecoration(
                      color: context.neutral300, shape: BoxShape.circle),
                ),
              )),
        ],
      ),
    );
  }
}
