import 'package:intl/intl.dart';

class Util{
  // Api key
  static String appId = "7a950043c98485406df7172ad9ae53d0";

  static String getFormattedDate(DateTime dateTime){
    return new DateFormat("EEE, MMM d, y").format(dateTime);
  }
}