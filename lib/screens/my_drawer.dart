import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_bloc_pattern_tasks_app/screens/tasks_screen.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
              color: Colors.grey,
              child: Text("Task App",
                  style: Theme.of(context).textTheme.headline5),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: (() => Navigator.pushNamed(context, TasksScreen.id)),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text("My Tasks"),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, RecycleBin.id),
                  child:  ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text("Recycle Bin"),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
