import 'package:egs/core/api.dart';
import 'package:egs/header/theme/ui/switch.dart';
import 'package:egs/login/domain/user_provider.dart';
import 'package:egs/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController emailController =
      TextEditingController(text: "tt@tt.ru");
  final TextEditingController passwordController =
      TextEditingController(text: "tt");

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Вход', style: TextStyle(color: Colors.black)),
        actions: const [
          ThemeSwitch(),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Row(
        children: [
          const Spacer(
            flex: 3,
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const Spacer(flex: 5),
                Expanded(
                  flex: 9,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).splashColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: TextField(
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                controller: emailController,
                                decoration: const InputDecoration(
                                  labelText: email,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  prefixIcon: Icon(Icons.mail_outline),
                                  hintText: 'Электронная почта',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: TextField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    labelText: password,
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.transparent,
                                    prefixIcon: Icon(Icons.lock_outline),
                                    hintText: 'Пароль',
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: ElevatedButton(
                                onPressed: () async {
                                  final response = await apiService.login(
                                    emailController.text,
                                    passwordController.text,
                                  );

                                  if (response.isSuccess) {
                                    await user.loadUser();
                                    if (!context.mounted) return;
                                    Navigator.pushNamed(context, '/dashboard');
                                  } else {
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            'Ошибка входа. Проверьте почту и пароль или зарегистрируйтесь\nДетали: ${response.body}'),
                                        duration: const Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(login),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text(dontHaveAccount),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
