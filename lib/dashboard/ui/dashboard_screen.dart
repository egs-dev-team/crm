import 'package:egs/header/header.dart';
import 'package:egs/side_menu/ui/side_menu.dart';
import 'package:flutter/material.dart';
import 'tasks.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: SideMenu(),
      appBar: Header(),
      body: MyTasks(),
    );
  }
}
