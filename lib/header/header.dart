import 'package:egs/core/const.dart';
import 'package:egs/header/profile/ui/profile.dart';
import 'package:egs/header/search/ui/field.dart';
import 'package:egs/header/theme/ui/switch.dart';
import 'package:egs/login/domain/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Header extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  ConsumerState<Header> createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header> {
  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        InkWell(
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Icon(Icons.menu, size: 32),
            ),
          ),
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        Expanded(
          child: SearchField(),
        ),
        const ThemeSwitch(),
        (user == null)
            ? const CircularProgressIndicator()
            : ProfileCard(
                name: user.name,
                surname: user.surname,
              ),
      ],
    );
  }
}
