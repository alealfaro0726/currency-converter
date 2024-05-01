import 'package:current_convert/api/cRemote.dart';
import 'package:current_convert/api/convert.dart';
import 'package:current_convert/api/crypto.dart';

class Config {
  static bool loading = true;

  static var btcIndex = 0;
  static var ethIndex = 0;
  static var ltcIndex = 0;
  static var dgIndex = 0;

  static Btc? crypto;
  static ConvertC? vals;
  static String to = "";
  
  static String amount = "";

  static double amout = 23;
}
