import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repite_riverpod/src/data/repository/app_repository_impl.dart';
import 'package:repite_riverpod/src/features/home/controller/home_controller.dart';
import 'package:repite_riverpod/src/features/home/presentation/widgets/home_body.dart';
import 'package:repite_riverpod/src/features/home/presentation/widgets/wfloatingbutton.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeController homeCtr = HomeController();
    ref.watch(crudController);
    final con = ref.read(crudController);
    return Scaffold(
      appBar: AppBar(title: const Text("Crud Dio"), centerTitle: true),
      body: WListBulder(con: con, homCtr: homeCtr),
      floatingActionButton: WfloatingActionButton(homeCtr: homeCtr, con: con),
    );
  }
}
