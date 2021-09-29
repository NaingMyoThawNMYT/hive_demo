import '../lib_exp.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HiveUtil {
  static Future<void> initHive() async {
    await Hive.initFlutter();

    _registerHiveAdapters();

    await _openHiveBoxes();
  }

  static void _registerHiveAdapters() {
    Hive.registerAdapter(MyUserAdapter());
  }

  static Future<void> _openHiveBoxes() async {
    await Hive.openBox<MyUser>(myUserBoxKey);
  }

  static Future<void> closeHive() async {
    await Hive.close();
  }
}
