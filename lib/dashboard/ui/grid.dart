import 'package:egs/core/const.dart';
import 'package:egs/dashboard/domain/task_provider.dart';
import 'package:egs/dashboard/ui/task_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskInfoGridView extends ConsumerStatefulWidget {
  const TaskInfoGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  TaskInfoGridViewState createState() => TaskInfoGridViewState();
}

class TaskInfoGridViewState extends ConsumerState<TaskInfoGridView> {
  @override
  void initState() {
    super.initState();
    ref.read(taskProvider.notifier).updateTasks();
  }

  @override
  Widget build(BuildContext context) {
    final task = ref.watch(taskProvider);
    final taskNotifier = ref.read(taskProvider.notifier);
    final tasks = task.sortedTasks;
    final selectedTypeParameter = task.selectedTypeParameter;
    final selectedTypeParameterName = task.selectedTypeParameterName;

    if (tasks.isEmpty && task.tasks.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  borderRadius: BorderRadius.circular(12),
                  value: selectedTypeParameter,
                  onChanged: (String? newValue) {
                    taskNotifier.setSelectedTypeParameter(newValue!);
                    taskNotifier.sortTasks();
                  },
                  items: <String>['1', '2', '3', '4', '5']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          selectedTypeParameterName[int.parse(value) - 1],
                        ),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
            Column(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.crossAxisCount,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    childAspectRatio: widget.childAspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/taskForm',
                          arguments: task,
                        );
                      },
                      child: FileInfoCard(info: task),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
