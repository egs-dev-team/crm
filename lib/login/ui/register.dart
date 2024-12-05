import 'package:egs/core/api.dart';
import 'package:egs/core/const.dart';
import 'package:egs/header/theme/ui/switch.dart';
import 'package:egs/login/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

 

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    surnameController.dispose();
    lastnameController.dispose();
    super.dispose();
  }

  Future<void> makeRegister() async {
    final response = await apiService.register(
      emailController.text,
      passwordController.text,
      nameController.text,
      surnameController.text,
      lastnameController.text,
      DateTime.now().millisecondsSinceEpoch,
    );

    if (response.isSuccess) {
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    } else {
      String message = '';
      if (emailController.text.isEmpty) {
        message = "Поле '$email' не должно быть пустым";
      } else if (passwordController.text.isEmpty) {
        message = "Поле '$password' не должно быть пустым";
      } else if (nameController.text.isEmpty) {
        message = "Поле '$name' не должно быть пустым";
      } else if (surnameController.text.isEmpty) {
        message = "Поле '$surname' не должно быть пустым";
      } else if (lastnameController.text.isEmpty) {
        message = "Поле '$lastName' не должно быть пустым";
      } else if (response.statusCode == 500) {
        message = 'Пользователь с такой почтой уже существует';
      } else {
        message = 'Ошибка, попробуйте еще раз :(';
      }

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Регистрация', style: TextStyle(color: Colors.black)),
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
            flex: 6,
            child: Column(
              children: [
                const Spacer(flex: 3),
                Expanded(
                  flex: 15,
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
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: name,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Имя',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: TextField(
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                controller: surnameController,
                                decoration: const InputDecoration(
                                  labelText: surname,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Фамилия',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: TextField(
                                textAlign: TextAlign.start,
                                textAlignVertical: TextAlignVertical.center,
                                controller: lastnameController,
                                decoration: const InputDecoration(
                                  labelText: lastName,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  prefixIcon: Icon(Icons.person),
                                  hintText: 'Отчество',
                                ),
                              ),
                            ),
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
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await makeRegister();
                                },
                                child: const Text(register),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text(alreadyHaveAccount),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
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
