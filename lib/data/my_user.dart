import 'package:hive/hive.dart';

part 'my_user.g.dart';

// run "flutter packages pub run build_runner build --delete-conflicting-outputs"

const myUserBoxKey = 'myUserBoxKey';

@HiveType(typeId: 0)
class MyUser extends HiveObject {
  @HiveField(0)
  late int id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late DateTime createdDate;
}
