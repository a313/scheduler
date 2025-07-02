import 'package:aio/core/utils/constants/sized_boxs.dart';
import 'package:aio/core/utils/util.dart';
import 'package:aio/data/models/chat_message.dart';
import 'package:aio/presentation/gemini/components/author_avatar.dart';
import 'package:aio/widgets/base/base_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TextMessageWidget extends StatelessWidget {
  const TextMessageWidget({super.key, required this.data});
  final TextMessage data;

  @override
  Widget build(BuildContext context) {
    return ABWidget(
      isShowA: data.author.isGemini,
      widgetA:
          (_) => Padding(
            padding: const EdgeInsets.only(right: 64.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (data.author.isGemini) AuthorAvatar(author: data.author),
                    sizedBoxW12,
                    Expanded(
                      child: SelectableText.rich(
                        TextSpan(children: _getSpans(context, data.message)),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    sizedBoxW24,
                    IconButton(
                      iconSize: 16,
                      onPressed: () {
                        // Get.find<SpeechUsecases>().speak(data.message);
                      },
                      tooltip: 'Read Aloud',
                      icon: const Icon(Icons.volume_up),
                    ),
                    IconButton(
                      iconSize: 16,
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: data.message));
                      },
                      tooltip: 'Copy',
                      icon: const Icon(Icons.copy_rounded),
                    ),
                    IconButton(
                      iconSize: 16,
                      onPressed: () {
                        //TODO
                      },
                      tooltip: 'Storage',
                      icon: const Icon(Icons.save_alt),
                    ),
                  ],
                ),
              ],
            ),
          ),
      widgetB:
          (_) => Padding(
            padding: const EdgeInsets.only(left: 64.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Container(
                    padding: padAll12,
                    decoration: BoxDecoration(
                      borderRadius: borRad08,
                      color: context.surfaceSchemeColor,
                    ),
                    child: SelectableText(data.message),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  List<InlineSpan> _getSpans(BuildContext context, String text) {
    List<InlineSpan> spans = [];
    final regex = RegExp(r'(\*\*[\s\S]*?\*\*|```[\s\S]*?```|[^\*\`\n]+|\n)');
    final matches = regex.allMatches(text);
    for (var match in matches) {
      final matchText = match.group(0)!;

      if (matchText.startsWith('**') && matchText.endsWith('**')) {
        spans.add(
          boldText(context, matchText.substring(2, matchText.length - 2)),
        );
      } else if (matchText.startsWith('```') && matchText.endsWith('```')) {
        final content = matchText.substring(3, matchText.length - 3);
        final language = content.split('\n').first;
        final code = content.substring(language.length);
        spans.add(codeText(context, language, code));
      } else {
        spans.add(normalText(context, matchText));
      }
    }

    return spans;
  }

  List<TextSpan> _getHighlightSpans(BuildContext context, String text) {
    final RegExp regex = RegExp(r'`(.*?)`');
    final List<TextSpan> spans = [];
    int start = 0;

    for (final Match match in regex.allMatches(text)) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      spans.add(
        TextSpan(
          text: match.group(1),
          style: TextStyle(color: context.secondarySchemeColor),
        ),
      );
      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return spans;
  }

  InlineSpan normalText(BuildContext context, String content) =>
      TextSpan(children: _getHighlightSpans(context, content));
  InlineSpan boldText(BuildContext context, String content) {
    return TextSpan(
      style: const TextStyle(fontWeight: FontWeight.bold),
      children: _getHighlightSpans(context, content),
    );
  }

  InlineSpan codeText(BuildContext context, String language, String content) =>
      WidgetSpan(
        child: Builder(
          builder: (context) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: borRad08,
                border: Border.all(color: context.dividerColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(7.0),
                        topRight: Radius.circular(7.0),
                      ),
                      color: context.dividerColor,
                    ),
                    child: Row(
                      children: [
                        sizedBoxW08,
                        Expanded(child: Text(language.capitalize!)),
                        TextButton.icon(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: content));
                          },
                          icon: const Icon(Icons.copy, size: 18),
                          label: const Text('Copy'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      content,
                      style: GoogleFonts.robotoMono(fontSize: 14),
                    ),
                  ),
                  sizedBoxH08,
                ],
              ),
            );
          },
        ),
      );
}
