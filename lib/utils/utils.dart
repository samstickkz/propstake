import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

mixin Utils {

  static String toDateTime(DateTime dateTime) {
    // Format: Day Month Year at h:mma (e.g., 12 June 2024 at 12:30pm)
    final DateFormat formatter = DateFormat("d MMMM yyyy 'at' h:mma");
    return formatter.format(dateTime).toLowerCase();
  }

  static String toDateTimeAt(DateTime dateTime) {
    // Format: Day Month Year at h:mma (e.g., 12 June 2024 at 12:30pm)
    final DateFormat formatter = DateFormat("dd/MM/yy 'at' hh:mm a");
    return formatter.format(dateTime).toLowerCase();
  }

  static String toDate(DateTime dateTime){
    final date =DateFormat.yMMMEd().format(dateTime);

    return date;
  }
  static String toDates(DateTime dateTime){
    final date =DateFormat.yMMMMd().format(dateTime);

    return date;
  }
  static String toTime(DateTime dateTime){
    final time =DateFormat.Hm().format(dateTime);

    return time;
  }

  static String formatDate(DateTime dateTime) {
    // Format the DateTime object to "10/03/24" format
    return DateFormat('dd/MM/yy').format(dateTime);
  }

  static num dateTimeToUtcTimestamp(DateTime dateTime) {
    return dateTime.toUtc().millisecondsSinceEpoch;
  }

  /// Converts a UTC timestamp in seconds to a DateTime object.

  static DateTime utcTimestampToDateTime(num utcTimestamp) {
    return DateTime.fromMillisecondsSinceEpoch(utcTimestamp.toInt(), isUtc: true);
  }

  static DateTime removeTime(DateTime dateTime)=>
      DateTime(dateTime.year, dateTime.month, dateTime.day);

  static String formatDayMonth(DateTime dateTime) {
    // Define a list of month names
    List<String> monthNames = [
      "January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];

    // Get the month and day from the DateTime object
    int month = dateTime.month;
    int day = dateTime.day;

    // Get the month name from the month number
    String monthName = monthNames[month - 1]; // Adjust index since months are 1-indexed

    // Format the date string
    String dateString = '$monthName $day';

    return dateString;
  }

}