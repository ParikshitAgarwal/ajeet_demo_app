import 'package:demoproject_moneylans/models/user_detail_model.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Boxes {
  static Box<UserDetail> getUserDetails() =>
      Hive.box<UserDetail>('userDetails');
}
