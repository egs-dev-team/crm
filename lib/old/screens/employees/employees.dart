import 'package:egs/old/responsive.dart';
import 'package:egs/old/screens/employees/components/table.dart';
import 'package:egs/header/header.dart';
import 'package:egs/side_menu/ui/side_menu.dart';
import 'package:egs/core/const.dart';
import 'package:flutter/material.dart';

class EmployeesScreen extends StatefulWidget {
  const EmployeesScreen({super.key});

  @override
  State<EmployeesScreen> createState() => _EmployeesScreen();
}

class _EmployeesScreen extends State<EmployeesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const Header(),
        drawer: const SideMenu(),
        body: SingleChildScrollView(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              const SizedBox(height: defaultPadding),
              Container(
                  width: Responsive.screenWidth(context) * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Сотрудники",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding * 1.5,
                            vertical: defaultPadding /
                                (Responsive.isMobile(context) ? 2 : 1),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/userForm');
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Создать"),
                      ),
                    ],
                  )),
              const SizedBox(height: defaultPadding),
              const MyTable(),
            ],
          ),
        ])));
  }
}
