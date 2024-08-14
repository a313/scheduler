import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../widgets/base/base_scafold_appbar.dart';
import 'note_edit_controller.dart';

class NoteEditPage extends GetView<NoteEditController> {
  const NoteEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffoldAppBar(
        title: 'Note',
        actions: [
          QuillToolbar.simple(
            configurations: QuillSimpleToolbarConfigurations(
              controller: controller.quill,
              showFontSize: false,
              showBoldButton: false,
              showBackgroundColorButton: false,
              showCenterAlignment: false,
              showClearFormat: false,
              showDividers: true,
              showSearchButton: false,
              showInlineCode: false,
              showItalicButton: false,
              showUnderLineButton: false,
              showJustifyAlignment: false,
              showLink: false,
              showLeftAlignment: false,
              showSmallButton: false,
              showStrikeThrough: false,
              showSubscript: false,
              showSuperscript: false,
              showListBullets: false,
              showListCheck: false,
              showListNumbers: false,
              showRightAlignment: false,
              showIndent: false,
              showQuote: false,
              showCodeBlock: false,
              showDirection: false,
              showAlignmentButtons: false,
              showFontFamily: false,
              showColorButton: false,
              showHeaderStyle: false,
            ),
          ),
        ],
        body: Column(
          children: [
            Expanded(
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: controller.quill,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: controller.onTapCamera,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      child: SvgPicture.asset(
                        'assets/svg/Regular/Camera.svg',
                        width: 26,
                      ),
                    ),
                  ),
                  QuillToolbar.simple(
                    configurations: QuillSimpleToolbarConfigurations(
                      controller: controller.quill,
                      showFontSize: false,
                      showBoldButton: false,
                      showBackgroundColorButton: false,
                      showClearFormat: false,
                      showDividers: false,
                      showSearchButton: false,
                      showInlineCode: false,
                      showItalicButton: false,
                      showUnderLineButton: false,
                      showLink: false,
                      showStrikeThrough: false,
                      showSubscript: false,
                      showSuperscript: false,
                      showUndo: false,
                      showRedo: false,
                      showQuote: false,
                      showCodeBlock: false,
                      showFontFamily: false,
                      showColorButton: false,
                      showHeaderStyle: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
