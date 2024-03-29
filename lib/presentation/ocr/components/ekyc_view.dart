import 'package:flutter/material.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../../domain/entities/ekyc.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Loại thẻ: ${k.cardType?.name}', style: AppFonts.h300),
          const Divider(),
          const Text('Mặt trước', style: AppFonts.h300),
          Text('Số: ${k.identifyNumber}'),
          Text('Họ và Tên: ${k.fullName}'),
          Text('Ngày sinh: ${k.dateOfBirth}'),
          Text('Giới tính: ${k.sex}'),
          Text('Quốc tịch: ${k.nationality}'),
          Text('Quê quán: ${k.placeOfOrigin}'),
          Text('Nơi thường chú: ${k.placeOfResidence}'),
          Text('Có giá trị đến: ${k.dateOfExpiry}'),
          const Divider(),
          const Text('Mặt sau', style: AppFonts.h300),
          Text('Ngày cấp: ${k.issueDate}'),
          Text('Nơi cấp: ${k.issueLoc}'),
        ],
      ),
    );
  }
}
