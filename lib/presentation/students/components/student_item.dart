import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/student.dart';
import 'package:aio/theme/app_fonts.dart';
import 'package:aio/widgets/local_avatar.dart';

class StudentItem extends StatelessWidget {
  const StudentItem({
    super.key,
    required this.data,
  });
  final Student data;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: data.isFollow ? 1 : 0.3,
      child: Padding(
        padding: padSymHor12Ver06,
        child: Row(
          children: [
            LocalAvatar(
              path: data.image,
              size: 40,
              name: data.name,
            ),
            sizedBoxW12,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        data.name,
                        style: AppFonts.h400,
                      ),
                      sizedBoxW06,
                      Expanded(
                        child: Text(
                          'Last charge'.tr,
                          style: AppFonts.bMedium,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: _PhoneWidget(data: data),
                      ),
                      sizedBoxW06,
                      _ChargeWidget(lastCharge: data.lastCharge),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneWidget extends StatelessWidget {
  const _PhoneWidget({
    required this.data,
  });

  final Student data;

  @override
  Widget build(BuildContext context) {
    var phone = data.phones.join(',');
    if (!phone.hasText) {
      phone = EMPTY_FIELD;
    }
    return Text('${'Phone'.tr}:$phone',
        style: AppFonts.bMedium.copyWith(color: context.neutral700));
  }
}

class _ChargeWidget extends StatelessWidget {
  const _ChargeWidget({
    required this.lastCharge,
  });

  final DateTime? lastCharge;

  @override
  Widget build(BuildContext context) {
    if (lastCharge == null) {
      return const Text(EMPTY_FIELD, style: AppFonts.bMedium);
    }
    final dif = DateTime.now().difference(lastCharge!).inDays;
    final shouldWarning = dif > 30;

    return Text(
      lastCharge!.toStringFormat(DateFormater.ddMMYYYY),
      style: AppFonts.bMedium.copyWith(
          color: shouldWarning
              ? context.funcRadicalRed
              : context.funcCornflowerBlue),
      textAlign: TextAlign.right,
    );
  }
}
