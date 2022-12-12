import 'package:intl/intl.dart';

abstract class DateFormatsToView {
  // 
  static String dateHourWithMeridian(DateTime date, String locale) {
  final DateFormat _dateFormatHour = DateFormat("hh:mm a", locale);
    return _dateFormatHour.format(date);
  }
}