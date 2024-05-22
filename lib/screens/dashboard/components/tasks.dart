import 'package:egs/responsive.dart';
import 'package:flutter/material.dart';
import 'package:egs/ui/const.dart';
import 'package:egs/model/task.dart';
import 'package:egs/api/task_api.dart';
import 'task_info.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Text(
                "Мои задания",
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: ElevatedButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/taskForm');
                },
                icon: const Icon(Icons.add),
                label: const Text("Создать"),
              ),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: TaskInfoGridView(
            crossAxisCount: size.width < 650 ? 2 : 4,
            childAspectRatio: size.width < 650 ? 1.3 : 1,
          ),
          tablet: const TaskInfoGridView(),
          desktop: TaskInfoGridView(
            childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class TaskInfoGridView extends StatefulWidget {
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

class TaskInfoGridViewState extends State<TaskInfoGridView> {
  final TaskApi apiService = TaskApi();
  String _selectedTypeParameter = '1';
  final _selectedTypeParameterName = [
    'Эксплуатация',
    'Техническое обслуживание',
    'СМР',
    'Производство',
    'Без типа',
  ];
  List<Task> tasks = [];
  List<Task> filteredTasks = [];

  @override
  void initState() {
    super.initState();
    apiService.fetchTasks().then((value) {
      setState(() {
        tasks = value;
        filteredTasks = sortTasks();
      });
    });
  }

  List<Task> sortTasks() {
    List<Task> newTasks = [];
    for (var item in tasks) {
      if (item.type == int.parse(_selectedTypeParameter)) {
        newTasks.add(item);
      }
    }

    List<Task> sortedTasks = newTasks.toList()
      ..sort(
        (a, b) {
          return (a.completion?.compareTo(b.completion ?? DateTime.now()) ?? 0)
              .compareTo(0);
        },
      );

    return sortedTasks;
  }

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
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
                  value: _selectedTypeParameter,
                  onChanged: (String? newValue) {
                    if (newValue != _selectedTypeParameter) {
                      setState(() {
                        _selectedTypeParameter = newValue!;
                        filteredTasks = sortTasks();
                      });
                    }
                  },
                  items: <String>['1', '2', '3', '4', '5']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          _selectedTypeParameterName[int.parse(value) - 1],
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
                  itemCount: filteredTasks.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.crossAxisCount,
                    crossAxisSpacing: defaultPadding,
                    mainAxisSpacing: defaultPadding,
                    childAspectRatio: widget.childAspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    final task = filteredTasks[index];
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
