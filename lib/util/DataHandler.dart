// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';

class Data {
  static final Data _data = Data._internal();
  factory Data() {
    return _data;
  }
  Data._internal();

  late SharedPreferences sp;

  Future<bool> init() async {
    sp = await SharedPreferences.getInstance();
    return true;
  }

  SharedPreferences getSP() {
    return sp;
  }
}
