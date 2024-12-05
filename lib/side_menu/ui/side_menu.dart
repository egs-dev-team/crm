import 'package:egs/header/theme/domain/theme_provider.dart';
import 'package:egs/side_menu/ui/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideMenu extends ConsumerWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeModeProvider);

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: theme == ThemeMode.dark
                ? Image.asset("assets/images/logo_white.png")
                : Image.asset("assets/logo.png"),
          ),
          DrawerListTile(
            title: "Сводка",
            svgSrc: "assets/icons/menu_dashboard.svg",
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/dashboard");
            },
          ),
          DrawerListTile(
            title: "Сотрудники",
            svgSrc: "assets/icons/menu_human.svg",
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/employees");
            },
          ),
          DrawerListTile(
            title: "Объекты",
            svgSrc: "assets/icons/menu_store.svg",
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/projects");
            },
          ),
          DrawerListTile(
            title: "Документы",
            svgSrc: "assets/icons/menu_doc.svg",
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/documents");
            },
          ),
          DrawerListTile(
            title: "Письма",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed("/mails");
            },
          ),
        ],
      ),
    );
  }
}

