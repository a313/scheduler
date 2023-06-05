import 'dart:ui';

extension ColorExtension on Color {
  ColorFilter get filterSrcIn => ColorFilter.mode(this, BlendMode.srcIn);
}
