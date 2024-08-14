import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/vpn_info.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'vpn_controller.dart';

class VpnPage extends GetView<VpnController> {
  const VpnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
        title: 'VPN'.tr,
        body: controller.obx(
          (state) => ListView.separated(
            padding: padAll16,
            itemCount: state!.length,
            separatorBuilder: (context, index) => sizedBoxH02,
            itemBuilder: (context, index) {
              final item = state[index];
              return VpnItem(item: item);
            },
          ),
        ));
  }
}

class VpnItem extends StatelessWidget {
  const VpnItem({
    super.key,
    required this.item,
  });

  final VpnInfo item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.wifi_outlined,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(item.CountryLong), Text(item.Speed.toBytes())],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(item.TotalUsers.toString()),
            Text(item.Ping.toString())
          ],
        ),
      ],
    );
  }
}
