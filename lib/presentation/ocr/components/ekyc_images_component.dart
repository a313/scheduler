import 'dart:io';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:photo_view/photo_view_gallery.dart';
import 'package:scheduler/core/utils/util.dart';
import 'package:scheduler/domain/entities/ekyc.dart';

class EkycImagesComponent extends StatelessWidget {
  const EkycImagesComponent({super.key, required this.ekyc});
  final Ekyc ekyc;

  @override
  Widget build(BuildContext context) {
    List<String> images = [];
    final face = ekyc.faceImage;
    final front = ekyc.frontIdentifyImage;
    final back = ekyc.backIdentifyImage;
    if (face.hasText) images.add(face!);
    if (front.hasText) images.add(front!);
    if (back.hasText) images.add(back!);
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          if (face.hasText)
            Expanded(
              flex: 72,
              child: GestureDetector(
                onTap: () => showPopup(context, images, face),
                child: ClipOval(
                  child: Image.file(File(face!), fit: BoxFit.cover),
                ),
              ),
            ),
          if (face.hasText) sizedBoxW16,
          if (front.hasText)
            Expanded(
              flex: 120,
              child: GestureDetector(
                onTap: () => showPopup(context, images, front),
                child: ClipRRect(
                  borderRadius: borRad08,
                  child: Image.file(File(front!)),
                ),
              ),
            ),
          if (front.hasText) sizedBoxW16,
          if (back.hasText)
            Expanded(
              flex: 120,
              child: GestureDetector(
                onTap: () => showPopup(context, images, back),
                child: ClipRRect(
                  borderRadius: borRad08,
                  child: Image.file(File(back!)),
                ),
              ),
            ),
        ],
      ),
    );
  }

  showPopup(BuildContext context, List<String> images, String image) {
    showDialog(
      barrierColor: Colors.black,
      context: context,
      builder: (context) {
        return GalleryPreView(
          imagePath: images,
          initIndex: images.indexOf(image),
        );
      },
    );
  }
}

class GalleryPreView extends StatelessWidget {
  const GalleryPreView({super.key, required this.imagePath, this.initIndex = 0});

  final List<String> imagePath;
  final int initIndex;

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initIndex);

    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              itemCount: imagePath.length,
              pageController: controller,
              builder: (context, index) => PhotoViewGalleryPageOptions(
                  imageProvider: FileImage(File(imagePath[index]))),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close_outlined,
                  color: context.neutral100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
