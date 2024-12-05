import 'package:egs/old/responsive.dart';
import 'package:egs/header/header.dart';
import 'package:egs/side_menu/ui/side_menu.dart';
import 'package:egs/core/const.dart';
import 'package:egs/old/screens/mails/components/table.dart';
import 'package:flutter/material.dart';

class MailsScreen extends StatefulWidget {
  const MailsScreen({super.key});

  @override
  State<MailsScreen> createState() => _MailsScreen();
}

class _MailsScreen extends State<MailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const SideMenu(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Мои письма",
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
                  Navigator.pushNamed(context, '/mailAdd');
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
    );
  }
}
