class DateTimeHandle {
  static Map<int, String> convert = {
    1:'Jan',
    2:'Feb',
    3:'Mar',
    4:'Apr',
    5:'May',
    6:'Jun',
    7:'Jul',
    8:'Aug',
    9:'Sep',
    10:'Otc',
    11:'Nov',
    12:'Dec'
};

  static String toAppBarTitle(DateTime dateTime) {
    return '${convert[dateTime.month]}, ${dateTime.year}';
  }

  static String simpleDateFormat(DateTime time) {
    final localTime = time.toLocal();
    return '${localTime.day}/${localTime.month}/${localTime.year}';
  }
}