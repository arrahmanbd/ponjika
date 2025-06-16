/// A utility class for converting Gregorian dates to the Bangla calendar (Bengali).
/// It supports formatting Bangla dates with customizable options and provides features like
/// showing the Bangla season and weekdays.
class Ponjika {
  // The names of the months in the Bangla calendar.
  static const List<String> _banglaMonths = [
    'বৈশাখ',
    'জ্যৈষ্ঠ',
    'আষাঢ়',
    'শ্রাবণ',
    'ভাদ্র',
    'আশ্বিন',
    'কার্তিক',
    'অগ্রহায়ণ',
    'পৌষ',
    'মাঘ',
    'ফাল্গুন',
    'চৈত্র',
  ];

  // The names of the weekdays in Bangla.
  static const List<String> _weekDays = [
    'রবিবার',
    'সোমবার',
    'মঙ্গলবার',
    'বুধবার',
    'বৃহস্পতিবার',
    'শুক্রবার',
    'শনিবার',
  ];

  // The names of the seasons in the Bangla calendar.
  static const List<String> _banglaSeasons = [
    'গ্রীষ্ম',
    'বর্ষা',
    'শরৎ',
    'হেমন্ত',
    'শীত',
    'বসন্ত',
  ];

  // The default number of days in each month (non-leap year).
  static const List<int> _defaultMonthDays = [
    31,
    31,
    31,
    31,
    31,
    30,
    30,
    30,
    30,
    30,
    30,
    30,
  ];

  /// Formats the provided [date] into the Bangla calendar format.
  /// Allows custom options like the format, weekday display, and season display.
  ///
  /// Parameters:
  /// - [date]: The DateTime object to be converted.
  /// - [displayLanguage]: The language for the display. Defaults to "bangla".
  /// - [dayStartsAt]: The time when the day starts (e.g., "sunrise").
  /// - [showSeason]: Whether to include the season name in the output.
  /// - [showWeekDays]: Whether to include the weekday name in the output.
  /// - [format]: The format string for the output (e.g., "DD MM, YY").
  ///
  /// Returns:
  /// A string representing the date in the Bangla calendar.
  static String format({
    DateTime? date,
    String displayLanguage = "bangla",
    String dayStartsAt = "sunrise",
    bool showSeason = false,
    bool showWeekDays = false,
    String format = "DD MM, YY",
  }) {
    final DateTime now =
        date?.subtract(const Duration(hours: 6)) ??
        DateTime.now().subtract(const Duration(hours: 6));
    int gregDay = now.weekday % 7;

    List<int> monthDays = List.from(_defaultMonthDays);
    if (_isLeapYear(now.year)) {
      monthDays[10] = 31; // Adjust for leap year in Falgun
    }

    int adjustedYear =
        (now.month < 4 || (now.month == 4 && now.day < 14))
            ? now.year - 1
            : now.year;
    DateTime epoch = DateTime(adjustedYear, 4, 13);
    int banglaYear = adjustedYear - 593;
    int daysPassed = now.difference(epoch).inDays;

    // Calculate the Bangla month index and date
    int banglaMonthIndex = 0;
    for (int i = 0; i < monthDays.length; i++) {
      if (daysPassed < monthDays[i]) {
        banglaMonthIndex = i;
        break;
      }
      daysPassed -= monthDays[i];
    }

    int banglaDate = daysPassed;
    String month = _banglaMonths[banglaMonthIndex];
    String season = _banglaSeasons[(banglaMonthIndex / 2).floor()];
    String day = _weekDays[gregDay];

    String result = format
        .replaceAll(RegExp(r'DD', caseSensitive: false), banglaDate.toString())
        .replaceAll(RegExp(r'MM', caseSensitive: false), month)
        .replaceAll(RegExp(r'YY', caseSensitive: false), banglaYear.toString());

    if (showWeekDays) {
      result = result.replaceAll(RegExp(r'WW', caseSensitive: false), day);
    }

    if (showSeason) {
      result = result.replaceAll(RegExp(r'SS', caseSensitive: false), season);
    }

    return _convertDigitsToBangla(result);
  }

  /// Checks if the given year is a leap year.
  static bool _isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  /// Converts digits in a string to their corresponding Bangla digits.
  static String _convertDigitsToBangla(String input) {
    const Map<String, String> digitMap = {
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
    return input.replaceAllMapped(RegExp(r'\d'), (match) {
      return digitMap[match.group(0)!]!;
    });
  }

  /// Returns the emoji for the current Bangla season.
  ///
  /// Parameters:
  /// - [date]: The DateTime object for which to get the season emoji. Defaults to current date.
  /// - [showName]: If true, the returned string includes both the season emoji and name.
  ///
  /// Returns:
  /// A string containing the season emoji, and optionally the season name.
  static String getSeasonEmoji(DateTime? date, {bool showName = false}) {
    final season = Ponjika.format(
      date: date ?? DateTime.now(),
      format: "SS",
      showSeason: true,
    );
    final emoji = _getSeasonEmoji(season);
    return showName ? '$emoji $season' : emoji;
  }

  /// Maps Bangla season names to their corresponding emojis.
  static String _getSeasonEmoji(String season) {
    switch (season) {
      case 'গ্রীষ্ম':
        return '☀️'; // Summer
      case 'বর্ষা':
        return '🌧️'; // Monsoon
      case 'শরৎ':
        return '🍃'; // Autumn
      case 'হেমন্ত':
        return '🍂'; // Fall
      case 'শীত':
        return '❄️'; // Winter
      case 'বসন্ত':
        return '🌸'; // Spring
      default:
        return '';
    }
  }
}
