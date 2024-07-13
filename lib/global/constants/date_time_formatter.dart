import 'package:intl/intl.dart';

class DateTimeFormatter {
  /// [to view only || converting from database format]
  static DateFormat showDateOnly = DateFormat("yyyy-MM-dd");
  static DateFormat showDateOnlyYear = DateFormat("yyyy-MM-dd");
  static DateFormat showTimeOnly = DateFormat("hh:mm a");
  static DateFormat showDateTime = DateFormat("dd/MM/yyyy hh:mm a");
  static DateFormat showDateTimeWithMonth = DateFormat("dd MMM yyyy hh:mm a"); // e.g: 12 Sep 2023 12:30 PM
  static DateFormat parsedTime = DateFormat.yMd();

  /// Database formats
  static DateFormat dbFormatDateOnly = DateFormat("yyyy-MM-dd");
  static DateFormat dbFormatDateTime = DateFormat("yyyy-MM-dd hh:mm");

  /// Method to format timestamp
  static String formatTimestamp(String timestamp, DateFormat format) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch((timestamp * 1000) as int);
    return format.format(date);
  }

  static String convertToBengaliNumerals(String input) {
    const englishToBengaliDigits = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
    };
    const englishToBengaliAMPM = {
      'AM': 'মি.',
      'PM': 'মি.',
    };
    String output = input.split('').map((char) {
      return englishToBengaliDigits[char] ?? char;
    }).join('');
    // Replace AM/PM
    englishToBengaliAMPM.forEach((key, value) {
      output = output.replaceAll(key, value);
    });
    return output;
  }
  static String convertToBengaliTime(DateTime dateTime) {
    String hour = convertToBengaliNumerals(DateFormat('hh').format(dateTime));
    String minute = convertToBengaliNumerals(DateFormat('mm').format(dateTime));
    String period = dateTime.hour < 12 ? 'সকাল' : 'দুপুর';
    return '$period \n$hour:$minute মি.';
  }
}

