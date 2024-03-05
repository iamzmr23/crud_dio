import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repite_riverpod/src/common/services/network_service_dio.dart';
import 'package:repite_riverpod/src/data/entity/user_model.dart';
import 'package:repite_riverpod/src/data/repository/app_repository_impl.dart';
import 'package:repite_riverpod/src/features/home/controller/home_controller.dart';

class WListBulder extends StatelessWidget {
  final HomeController homCtr;
  final AppRepositoryImpl con;

  const WListBulder({
    super.key,
    required this.con,
    required this.homCtr,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        itemCount: NetworkService.users.length,
        itemBuilder: (context, index) {
          var net = NetworkService.users[index];
          return Card(
            child: ListTile(
              title: Text(
                net.title,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                net.subtitle,
                style: const TextStyle(fontSize: 18),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.delete, size: 20),
                    onPressed: () {
                      final id = NetworkService.users[index].id;
                      con.deleteData(id);
                    },
                  ),
                  CupertinoButton(
                    child: const Icon(CupertinoIcons.pen, size: 20),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextField(
                                    controller: homCtr.upTitleController,
                                    decoration: const InputDecoration(hintText: 'Title', border: OutlineInputBorder())),
                                const SizedBox(height: 16),
                                TextField(
                                    controller: homCtr.upSubtitleController,
                                    decoration: const InputDecoration(hintText: 'Subtitle', border: OutlineInputBorder())),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                                        child: const Text("close")),
                                    const SizedBox(width: 16),
                                    ElevatedButton(
                                        onPressed: () {
                                          final net = NetworkService.users[index];
                                          UserModel userModel = UserModel(
                                            title: homCtr.upTitleController.text,
                                            subtitle: homCtr.upSubtitleController.text,
                                            id: '',
                                          );
                                          if (homCtr.upTitleController.text.isNotEmpty && homCtr.upSubtitleController.text.isNotEmpty) {
                                            con.putData(userModel, net.id);
                                          } else {
                                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill the fields')));
                                          }
                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                                        child: const Text("update")),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
