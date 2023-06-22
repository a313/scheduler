extension DurationExtension on Duration {
  String formatHHMMSS() {
    return '$this'.split('.')[0].padLeft(8, '0');
  }

  String formatMMSS() {
    final p = '$this'.split('.')[0].padLeft(8, '0').split(':');
    return "${p[1]}:${p[2]}";
  }

  String formatInDuration() {
    if (inDays > 0) return '${inDays}d';
    if (inHours > 0) return '${inHours}h';
    if (inMinutes > 0) return '${inMinutes}m';
    if (inSeconds > 0) return '${inSeconds}s';
    return '';
  }
}
