import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/presentation/music_downloader/components/mini_player.dart';
import 'package:scheduler/theme/app_fonts.dart';

import '../../widgets/base/base_scafold_appbar.dart';
import 'music_player_controller.dart';

class MusicPlayerPage extends GetView<MusicPlayerController> {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScafoldAppBar(
      title: 'Music'.tr,
      body: GetBuilder<MusicPlayerController>(
        builder: (_) {
          final musics = _.musics;
          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemBuilder: (context, index) {
                  final music = musics.elementAt(index);
                  final thumb = _.thumbnails[music.fileName];
                  return MusicItem(
                    file: music,
                    thumbnail: thumb,
                    onTap: controller.onTapMusic,
                  );
                },
                separatorBuilder: (context, index) => sizedBoxH04,
                itemCount: musics.length,
              )),
              const MiniPlayer(),
            ],
          );
        },
      ),
    );
  }
}

class MusicItem extends StatelessWidget {
  const MusicItem({
    Key? key,
    required this.file,
    this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  final File file;
  final File? thumbnail;
  final Function(File file) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(file),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            child: thumbnail != null
                ? ClipRRect(
                    borderRadius: borRad08,
                    child: Image.file(
                      thumbnail!,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                : SvgPicture.asset('assets/svg/Regular/MusicNotes.svg'),
          ),
          sizedBoxW06,
          Expanded(
              child: Text(
            file.fileName,
            style: AppFonts.bMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }
}
