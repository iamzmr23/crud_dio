import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repite_riverpod/src/common/services/network_service_dio.dart';
import 'package:repite_riverpod/src/data/entity/user_model.dart';
import 'app_repository.dart';

final crudController = ChangeNotifierProvider.autoDispose((ref) => AppRepositoryImpl());

class AppRepositoryImpl with ChangeNotifier implements AppRepository {
  AppRepositoryImpl() {
    getData();
  }
  @override
  Future<void> deleteData(String id) async {
    await NetworkService.DELETE(id: id);
    notifyListeners();
    throw UnimplementedError();
  }

  @override
  Future<void> getData() async {
    await NetworkService.GET();
    notifyListeners();
    throw UnimplementedError();
  }

  @override
  Future<void> postData(UserModel data) async {
    await NetworkService.POST(data);
    notifyListeners();
    throw UnimplementedError();
  }

  @override
  Future<void> putData(UserModel data, String id) async {
    await NetworkService.PUT(data, id: id);
    notifyListeners();
    throw UnimplementedError();
  }
}
