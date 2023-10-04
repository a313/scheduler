import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:scheduler/presentation/music_downloader/music_downloader_controller.dart';

class DownloadingPage extends StatelessWidget {
  const DownloadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MusicDownloaderController>(
      builder: (_) {
        return Column(
          children: [
            CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: _.totalPercent,
              center: Text("${_.totalPercent}%"),
            )
          ],
        );
      },
    );
  }
}
