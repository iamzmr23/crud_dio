// ignore_for_file: non_constant_identifier_names, unused_local_variable
import 'package:dio/dio.dart';
import 'package:repite_riverpod/src/data/entity/user_model.dart';

class NetworkService {
  static final Dio dio = Dio();
  static List<UserModel> users = [];
  static const baseUrl = "https://65dc9804e7edadead7ec7c5b.mockapi.io/api/note";
  static const api = "/users";

  static Future<void> GET() async {
    var result = await dio.get('$baseUrl$api');
    users = (result.data as List).map((e) => UserModel.fromJson(e)).toList();
  }

  static Future<void> POST(UserModel param) async {
    var result = await dio.post('$baseUrl$api', data: param.toJson());
  }

  static Future<void> DELETE({required String id}) async {
    var result = await dio.delete('$baseUrl$api/$id');
  }

  static Future<void> PUT(UserModel paramm, {required String id}) async {
    var result = await dio.put('$baseUrl$api/$id', data: paramm.toJson());
  }
}
