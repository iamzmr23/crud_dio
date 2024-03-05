import 'package:repite_riverpod/src/data/entity/user_model.dart';

abstract class AppRepository {
  Future<void> getData() async {}

  Future<void> postData(UserModel data) async {}

  Future<void> putData(UserModel data, String id) async {}

  Future<void> deleteData(String id) async {}
}
