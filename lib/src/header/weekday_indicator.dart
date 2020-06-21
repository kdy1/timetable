import 'package:black_hole_flutter/black_hole_flutter.dart';
import 'package:flutter/material.dart';
import 'package:time_machine/time_machine.dart';

import '../theme.dart';
import '../utils/utils.dart';
import 'date_indicator.dart';

class WeekdayIndicator extends StatelessWidget {
  const WeekdayIndicator(this.date, {Key key}) : super(key: key);

  final LocalDate date;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final timetableTheme = context.timetableTheme;

    final states = DateIndicator.statesFor(date);
    final decoration =
        timetableTheme?.weekDayIndicatorDecoration?.resolve(states) ??
            BoxDecoration();
    final textStyle =
        timetableTheme?.weekDayIndicatorTextStyle?.resolve(states) ??
            TextStyle(
              color: date.isToday
                  ? timetableTheme?.primaryColor ?? theme.primaryColor
                  : theme.highEmphasisOnBackground,
            );

    return DecoratedBox(
      decoration: decoration,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Text(_dayName(date), style: textStyle),
      ),
    );
  }
}

String _dayName(LocalDate d) {
  switch (d.dayOfWeek) {
    case DayOfWeek.monday:
      return '월';
    case DayOfWeek.tuesday:
      return '화';
    case DayOfWeek.wednesday:
      return '수';
    case DayOfWeek.thursday:
      return '목';
    case DayOfWeek.friday:
      return '금';
    case DayOfWeek.saturday:
      return '토';
    case DayOfWeek.sunday:
      return '일';
  }
  return '';
}
