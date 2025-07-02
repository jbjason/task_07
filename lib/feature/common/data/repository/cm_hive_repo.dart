import 'package:logger/logger.dart';
import 'package:task_07/core/util/my_string.dart';
import 'package:task_07/feature/common/data/model/login_info.dart';
import 'package:hive/hive.dart';

class CmHiveRepo {
 static Future<LoginInfo?> getHiveBoxInfo() async {
    final info = await Hive.box(MyString.boxName).get(1);
    Logger().i(info);
    return info == null ? null : LoginInfo.fromJson(info);
  }

  Future<void> addHiveBoxInfo(LoginInfo info) async {
    try {
      await Hive.box(MyString.boxName).put(2, info.toJson());
      Logger().i('Successful');
    } catch (e) {
      Logger().i('Hive Error: $e');
    }
  }

  Future<void> get deleteHiveBoxInfo async {
    try {
      await Hive.box(MyString.boxName).delete(1);
      Logger().i('Successful');
    } catch (e) {
      Logger().i('Hive Error: $e');
    }
  }
}
