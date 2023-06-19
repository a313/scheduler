import 'dart:ui';

extension ColorExtension on Color {
  ColorFilter get filterSrcIn => ColorFilter.mode(this, BlendMode.srcIn);
  Color get invertColor =>
      Color.fromARGB(alpha, 255 - red, 255 - green, 255 - blue);
}
