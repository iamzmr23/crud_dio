import 'package:flutter/material.dart';
import 'package:repite_riverpod/src/data/entity/user_model.dart';
import 'package:repite_riverpod/src/data/repository/app_repository_impl.dart';
import 'package:repite_riverpod/src/features/home/controller/home_controller.dart';

class WfloatingActionButton extends StatelessWidget {
  const WfloatingActionButton({
    super.key,
    required this.homeCtr,
    required this.con,
  });

  final HomeController homeCtr;
  final AppRepositoryImpl con;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                        controller: homeCtr.titleController, decoration: const InputDecoration(hintText: 'Title', border: OutlineInputBorder())),
                    const SizedBox(height: 16),
                    TextField(
                        controller: homeCtr.subtitleController,
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
                              UserModel userModel = UserModel(title: homeCtr.titleController.text, subtitle: homeCtr.subtitleController.text, id: '');
                              if (homeCtr.titleController.text.isNotEmpty && homeCtr.subtitleController.text.isNotEmpty) {
                                con.postData(userModel);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill the fields')));
                              }
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent, foregroundColor: Colors.white),
                            child: const Text("create")),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, size: 28));
  }
}
