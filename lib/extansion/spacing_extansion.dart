import 'package:flutter/widgets.dart';

extension SpacingExtension on num {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}
