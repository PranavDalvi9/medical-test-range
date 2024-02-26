import 'dart:ui';

class MetaDataResponse {
  final int rangeStart;
  final int rangeEnd;
  final String meaning;
  final Color color;

  MetaDataResponse({
    required this.rangeStart,
    required this.rangeEnd,
    required this.meaning,
    required this.color,
  });
}
