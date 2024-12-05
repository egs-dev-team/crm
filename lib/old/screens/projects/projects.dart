import 'package:egs/old/responsive.dart';
import 'package:egs/header/header.dart';
import 'package:egs/side_menu/ui/side_menu.dart';
import 'package:egs/core/const.dart';
import 'package:egs/old/screens/projects/components/table.dart';
import 'package:flutter/material.dart';

import 'components/edit_project.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreen();
}

class _ProjectsScreen extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Мои объекты",
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 1.5,
                      vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddEditProjectScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Создать"),
                ),
              ],
            ),
            const SizedBox(height: defaultPadding),
            const MyTable(),
          ],
        ),
      ),
    );
  }
}
