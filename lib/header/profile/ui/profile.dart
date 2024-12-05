import 'package:egs/core/api.dart';
import 'package:egs/core/const.dart';
import 'package:egs/header/theme/domain/theme_provider.dart';
import 'package:egs/login/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileCard extends ConsumerWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.surname,
  });

  final String name;
  final String surname;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.notifier);
    final theme = ref.watch(themeModeProvider);

    return PopupMenuButton<String>(
      itemBuilder: (context) {
        return [
          const PopupMenuItem<String>(
            value: 'logout',
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: defaultPadding / 4),
              leading: Icon(Icons.exit_to_app),
              title: Text('Выйти'),
            ),
          ),
        ];
      },
      onSelected: (value) {
        if (value == 'logout') {
          apiService.logout();
          user.clearUser();
          Navigator.pushNamed(context, '/login');
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.person,
            color: theme == ThemeMode.dark ? Colors.black : Colors.white,
          ),
          Text(
            "$name $surname",
            style: TextStyle(
              color: theme == ThemeMode.dark ? Colors.black : Colors.white,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: theme == ThemeMode.dark ? Colors.black : Colors.white,
          ),
        ],
      ),
    );
  }
}
