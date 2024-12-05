import 'package:egs/dashboard/ui/grid.dart';
import 'package:flutter/material.dart';
import 'package:egs/core/const.dart';

class MyTasks extends StatelessWidget {
  const MyTasks({super.key});

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.surface,
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
        // TODO here update responsive
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                TaskInfoGridView(
                  // crossAxisCount: 4,
                  // childAspectRatio: 1,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

