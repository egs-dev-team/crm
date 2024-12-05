import 'package:egs/old/responsive.dart';
import 'package:egs/header/header.dart';
import 'package:egs/side_menu/ui/side_menu.dart';
import 'package:egs/core/const.dart';
import 'package:egs/old/screens/documents/components/table.dart';
import 'package:egs/old/screens/documents/components/document_form.dart';
import 'package:flutter/material.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreen();
}

class _DocumentsScreen extends State<DocumentsScreen> {
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
                "Мои документы",
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
                      builder: (context) => const DocumentForm(),
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
    );
  }
}
