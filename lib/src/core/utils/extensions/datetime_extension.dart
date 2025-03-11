import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:kutim/src/core/utils/extensions/context_extension.dart';
import 'package:timeago/timeago.dart' as timeago;

extension DateTimeExtension on DateTime? {
  String hoursAndMinutes(
    BuildContext context,
  ) {
    // Example
    // 09:00
    if (this == null) {
      return '';
    } else {
      return DateFormat('HH:mm', context.currentLocale.countryCode).format(this!.toLocal());
    }
  }

  String dayWithMonthAndWeekDay(
    BuildContext context,
  ) {
    // Example
    // 17 мая, Cр
    if (this == null) {
      return '';
    } else {
      return DateFormat('d MMMM, EEE.', context.currentLocale.countryCode).format(this!);
    }
  }

  String weekNameWithDay(
    BuildContext context,
  ) {
    // Example
    // Понедельник, 17 мая
    if (this == null) {
      return '';
    } else {
      return DateFormat('EEEE, d MMMM', context.currentLocale.countryCode).format(this!);
    }
  }

  bool isSameDay(DateTime other) {
    if (this == null) {
      return false;
    }

    return this!.day == other.day && this!.month == other.month && this!.year == other.year;
  }

  bool isSameMonth(DateTime other) {
    if (this == null) {
      return false;
    }

    return this!.month == other.month && this!.year == other.year;
  }

  bool isSameYear(DateTime other) {
    if (this == null) {
      return false;
    }

    return this!.year == other.year;
  }

  String dayMonthName(
    BuildContext context,
  ) {
    // Example
    // 21 August
    if (this == null) {
      return '';
    } else {
      return DateFormat('d MMMM', context.currentLocale.countryCode).format(this!);
    }
  }

  String dayMonthNameWithYear(
    BuildContext context,
  ) {
    // Example
    // 21 August 2023
    if (this == null) {
      return '';
    } else {
      return DateFormat('d MMMM, y', context.currentLocale.countryCode).format(this!);
    }
  }

  String yearMonthDayWithDash(
    BuildContext context,
  ) {
    // Example
    // 2023-06-20
    if (this == null) {
      return '';
    } else {
      return DateFormat('y-MM-dd', context.currentLocale.countryCode).format(this!);
    }
  }

  String shortWeekDay(
    BuildContext context,
  ) {
    // Example
    // Mon
    if (this == null) {
      return '';
    } else {
      return DateFormat('EEE', context.currentLocale.countryCode).format(this!);
    }
  }

  String monthName(
    BuildContext context,
  ) {
    // Example
    // August
    if (this == null) {
      return '';
    } else {
      return DateFormat('MMMM', context.currentLocale.countryCode).format(this!);
    }
  }

  String shortMonthName(
    BuildContext context,
  ) {
    // Example (without dot)
    // AUG
    if (this == null) {
      return '';
    } else {
      return DateFormat('MMM', context.currentLocale.countryCode).format(this!).split('.').first;
    }
  }

  String timeAgo(BuildContext context) {
    if (this == null) {
      return '';
    }

    final timeDiffAgo = DateTime.now().subtract(
      Duration(minutes: DateTime.now().difference(this!).inMinutes),
    );

    return timeago.format(
      timeDiffAgo,
      locale: context.currentLocale.countryCode,
    );
  }

  String chatItemTime(BuildContext context) {
    if (this == null) {
      return '';
    }

    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(const Duration(days: 1));

    if (this!.day == today.day && this!.month == today.month && this!.year == today.year) {
      return DateFormat('HH:mm', context.currentLocale.countryCode).format(this!);
    } else if (this!.day == yesterday.day && this!.month == yesterday.month && this!.year == yesterday.year) {
      return 'context.localized.yesterday'.toLowerCase();
    } else {
      return DateFormat('d MMMM', context.currentLocale.countryCode).format(this!);
    }
  }

  String chatDetailTimeHeader(BuildContext context) {
    if (this == null) {
      return '';
    }

    final today = DateTime.now();
    final yesterday = DateTime.now().subtract(const Duration(days: 1));

    if (this!.day == today.day && this!.month == today.month && this!.year == today.year) {
      return 'context.localized.today';
    } else if (this!.day == yesterday.day && this!.month == yesterday.month && this!.year == yesterday.year) {
      return 'context.localized.yesterday';
    } else {
      return DateFormat.yMMMd(context.currentLocale.countryCode).format(this!);
    }
  }

  // String qrBusinessCardCreatedTime(BuildContext context) {
  //   /*
  //   Добавлено сегодня в 18:05

  //   Добавлено вчера в 18:05

  //   Добавлено 21.05.2024 в 18:05
  //   */
  //   if (this == null) {
  //     return '';
  //   }

  //   final today = DateTime.now();
  //   final yesterday = DateTime.now().subtract(const Duration(days: 1));

  //   if (this!.day == today.day && this!.month == today.month && this!.year == today.year) {
  //     return context.currentLocale.whenByValue(
  //       kk: 'Бүгін сағат ${hoursAndMinutes(context)} қосылды',
  //       ru: 'Добавлено сегодня в ${hoursAndMinutes(context)}',
  //       en: 'Added today at ${hoursAndMinutes(context)}',
  //     );
  //   } else if (this!.day == yesterday.day && this!.month == yesterday.month && this!.year == yesterday.year) {
  //     return context.currentLocale.whenByValue(
  //       kk: 'Кеше сағат ${hoursAndMinutes(context)} қосылды',
  //       ru: 'Добавлено вчера в ${hoursAndMinutes(context)}',
  //       en: 'Added yesterday at ${hoursAndMinutes(context)}',
  //     );
  //   } else {
  //     return context.currentLocale.whenByValue(
  //       kk: '''${DateFormat('dd.MM.yyyy', context.currentLocale.countryCode).format(this!)} күні қосылды''',
  //       ru: '''Добавлено ${DateFormat('dd.MM.yyyy', context.currentLocale.countryCode).format(this!)}''',
  //       en: '''Added ${DateFormat('dd.MM.yyyy', context.currentLocale.countryCode).format(this!)}''',
  //     );
  //   }
  // }

//   String vacancyCardTime(BuildContext context) {
//     /*
//     3 часа назад

//     вчера в 18:05

//     28 ноя в 18:05
//     */

//     if (this == null) {
//       return '';
//     }

//     final today = DateTime.now();
//     final yesterday = DateTime.now().subtract(const Duration(days: 1));

//     if (this!.day == today.day && this!.month == today.month && this!.year == today.year) {
//       return timeAgo(context);
//     } else if (this!.day == yesterday.day && this!.month == yesterday.month && this!.year == yesterday.year) {
//       return context.currentLocale.whenByValue(
//         kk: 'кеше сағат ${hoursAndMinutes(context)}',
//         ru: 'вчера в ${hoursAndMinutes(context)}',
//         en: 'yesterday at ${hoursAndMinutes(context)}',
//       );
//     } else {
//       return '''
// ${this!.year != today.year ? '${this!.year}, ' : ''}${context.currentLocale.whenByValue(
//         kk: '${DateFormat('d MMMM', context.currentLocale.countryCode).format(this!)} күні ${hoursAndMinutes(context)}',
//         ru: '${DateFormat('d MMMM', context.currentLocale.countryCode).format(this!)} в ${hoursAndMinutes(context)}',
//         en: '${DateFormat('d MMMM', context.currentLocale.countryCode).format(this!)} at ${hoursAndMinutes(context)}',
//       )}''';
//     }
//   }

  String range(BuildContext context, {required DateTime? end}) {
    if (end == null) {
      return '';
    } else if (isSameDay(end)) {
      // Example
      // 21 August, 09:00 - 18:00
      return '''${dayMonthName(context)}, ${hoursAndMinutes(context)} - ${end.hoursAndMinutes(context)}''';
    } else if (isSameMonth(end)) {
      // Example
      // 21 - 22 August, 09:00 - 18:00
      return '''${this?.day} - ${end.dayMonthName(context)}, ${hoursAndMinutes(context)} - ${end.hoursAndMinutes(context)}''';
    } else if (isSameYear(end) && (!isSameMonth(end))) {
      // Example
      // 21 August - 22 September, 09:00 - 18:00
      return '''${dayMonthName(context)} - ${end.dayMonthName(context)}, ${hoursAndMinutes(context)} - ${end.hoursAndMinutes(context)}''';
    } else {
      // Example
      // 21 August 2023 - 22 September 2024, 09:00 - 18:00
      return '''${dayMonthNameWithYear(context)} - ${end.dayMonthNameWithYear(context)}, ${hoursAndMinutes(context)} - ${end.hoursAndMinutes(context)}''';
    }
  }

  String rangeDay(BuildContext context, {required DateTime? end}) {
    if (end == null) {
      return '';
    } else if (isSameDay(end)) {
      // Example
      // 21
      return '${this?.day}';
    } else {
      // Example
      // 21 - 22
      return '${this?.day}-${end.day}';
    }
  }

  DateTime firstDayOfWeek() {
    final initialDate = this;
    var daysToMonday = initialDate!.weekday - DateTime.monday;

    if (daysToMonday < 0) {
      daysToMonday += 7;
    }

    final result = initialDate.subtract(Duration(days: daysToMonday));
    return DateTime(result.year, result.month, result.day);
  }

  DateTime? firstDayOfMonth() => this != null ? DateTime(this!.year, this!.month) : null;

  DateTime? lastDayOfMonth() => this != null ? DateTime(this!.year, this!.month + 1) : null;

  DateTime? lastDayOfWeek() {
    if (this == null) {
      return null;
    } else {
      final initialDate = DateTime(this!.year, this!.month, this!.day);
      var daysToSunday = DateTime.sunday - initialDate.weekday;

      if (initialDate.weekday == DateTime.sunday) {
        daysToSunday = 0;
      }
      final result = this!.add(Duration(days: daysToSunday));
      return DateTime(result.year, result.month, result.day, 23, 59, 59);
    }
  }

  DateTime? withoutTime() {
    if (this == null) {
      return null;
    } else {
      return DateTime(this!.year, this!.month, this!.day);
    }
  }

  DateTime? changedTime(DateTime dateTime) {
    if (this == null) {
      return null;
    } else {
      return this!.copyWith(
        hour: dateTime.hour,
        minute: dateTime.minute,
        second: dateTime.second,
        millisecond: dateTime.millisecond,
        microsecond: dateTime.microsecond,
      );
    }
  }
}
