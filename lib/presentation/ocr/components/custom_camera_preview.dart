// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A widget showing a live camera preview.
class CustomCameraPreview extends StatelessWidget {
  /// Creates a preview widget for the given camera controller.
  const CustomCameraPreview(this.controller,
      {super.key, this.child, this.cameraKey});

  /// The controller for the camera that the preview is shown for.
  final CameraController controller;

  /// A widget to overlay on top of the camera preview
  final Widget? child;
  final Key? cameraKey;

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
            Center(
              child: AspectRatio(
                key: cameraKey,
                aspectRatio: 1 / controller.value.aspectRatio,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _wrapInRotatedBox(child: controller.buildPreview()),
                  ],
                ),
              ),
            ),
            if (child != null) child!,
          ])
        : const SizedBox();
  }

  Widget _wrapInRotatedBox({required Widget child}) {
    if (defaultTargetPlatform != TargetPlatform.android) {
      return child;
    }

    return RotatedBox(
      quarterTurns: 0,
      child: child,
    );
  }
}
