import 'package:hive/hive.dart';
part 'user_detail_model.g.dart';

@HiveType(typeId: 0)
class UserDetail extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String atype;
  @HiveField(3)
  String? age;
  @HiveField(4)
  String? gender;
  @HiveField(5)
  bool isLoggedIn;
  UserDetail({
    required this.id,
    required this.atype,
    required this.name,
    this.age,
    this.gender,
    this.isLoggedIn = false,
  });
}
