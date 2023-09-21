import 'dart:ui';

extension ColorStringExtension on String {
  // ignore: unnecessary_this
  Color get toColor => Color(int.parse(this.replaceAll('#', '0xFF')));
}
