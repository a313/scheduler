import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler/widgets/base/base_scafold_appbar.dart';

import 'note_controller.dart';

class NotePage extends GetView<NoteController> {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffoldAppBar(
        title: 'Note',
        body: Column(
          children: [],
        ));
  }
}
