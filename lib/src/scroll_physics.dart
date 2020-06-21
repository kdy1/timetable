// Inspired by [PageScrollPhysics]
import 'package:flutter/widgets.dart';

import 'controller.dart';

class TimetableScrollPhysics extends NeverScrollableScrollPhysics {
  TimetableScrollPhysics(this.controller, {ScrollPhysics parent})
      : assert(controller != null),
        super(parent: NeverScrollableScrollPhysics());

  final TimetableController controller;
}
