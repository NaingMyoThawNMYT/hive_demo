import '../lib_exp.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HiveMyUserCtrl {
  static Box<MyUser> get _box => Hive.box<MyUser>(myUserBoxKey);

  static List<MyUser> get _myUsers => _box.values.toList().cast<MyUser>();

  static Future<void> add(
     final String name
  ) async {
    // if there is no old record then add as a new record
    final myUser = MyUser()
      ..id = _myUsers.length + 1
      ..name = name
      ..createdDate = DateTime.now();

    _box.add(myUser);

    return;
  }

  static Future<void> delete(final int id) async {
    MyUser? myUser;

    for (final u in _myUsers) {
      if (id == u.id) {
        myUser = u;

        break;
      }
    }

    // this case never should not happen
    if (myUser == null) return;

    await myUser.delete();
  }

  static ValueListenable<Box<MyUser>> get all => _box.listenable();
}
