import 'package:flutter/material.dart';

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
    return '${time.day > 10 ? time.day.toString() : '0${time.day}'}/${time.month > 10 ? time.month.toString() : '0${time.month}'}/${time.year}';
  }

  static String simpleTimeFormat(TimeOfDay time) {
    return '${time.hour > 10 ? time.hour.toString() : '0${time.hour}'}:${time.minute > 10 ? time.minute.toString() : '0${time.minute}'}';
  }
}