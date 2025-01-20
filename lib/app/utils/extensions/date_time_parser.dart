import 'package:get/get.dart';
import 'package:intl/intl.dart';

extension DateFormatter on DateTime? {
  DateTime? get date => this?.toLocal();

  String getDay() => date == null ? "-" : DateFormat("dd").format(date!);

  String getDate() =>
      date == null ? "-" : "${DateFormat("dd").format(date!)}/${DateFormat("MM").format(date!)}/${DateFormat("y").format(date!)}";

  String getCompleteDate() => date == null
      ? "-"
      : "${DateFormat(DateFormat.WEEKDAY, "pt-br").format(date!).capitalizeFirst}, ${DateFormat("dd", "pt-br").format(date!)} de ${DateFormat("MMMM", "pt-br").format(date!)} de ${DateFormat("y", "pt-br").format(date!)}";

  String getDateWithWeekday() =>
      date == null ? "-" : "${DateFormat(DateFormat.WEEKDAY, "pt-br").format(date!).capitalizeFirst}, ${date.getDate()}";
}
