import 'dart:convert';
import 'package:egs/core/api.dart';
import 'package:egs/dashboard/data/task.dart';
import 'package:egs/login/data/user.dart';
import 'package:egs/messages/ui/messages.dart';
import 'package:egs/project/data/project.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io';

import 'package:egs/header/header.dart';
import 'package:egs/side_menu/ui/side_menu.dart';
import 'package:egs/core/const.dart';
import 'package:egs/dashboard/ui/dashboard_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart';

class TaskFormScreen extends StatefulWidget {
  final Task? initialTask;

  const TaskFormScreen({super.key, this.initialTask});

  @override
  TaskFormScreenState createState() => TaskFormScreenState();
}

class TaskFormScreenState extends State<TaskFormScreen> {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController completionController = TextEditingController();
  late TextEditingController doneController = TextEditingController();

  File? _doc;
  String? doc64;
  String? docName;

  final formKey = GlobalKey<FormState>();

  List<int>? _users;
  List<User>? selectedUsers = [];
  late List<User> allUsers = [];

  Project? selectedProject;
  late List<Project>? allProjects = [];


  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: widget.initialTask?.name);
    descriptionController =
        TextEditingController(text: widget.initialTask?.description);
    completionController = TextEditingController(
        text: widget.initialTask?.completion?.toLocal().toString());
    doneController = TextEditingController(
        text: widget.initialTask?.done?.toLocal().toString());
    _doc = widget.initialTask?.document;
    docName = widget.initialTask?.doc_name;
    _users = widget.initialTask?.task_to_user ?? [];

    fetchInitialData();
  }

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    completionController.dispose();
    doneController.dispose();
    super.dispose();
  }

  Future<void> fetchInitialData() async {
    try {
      final users = await apiService.getUsers();
      final projects = await apiService.getProjects();

      setState(() {
        users.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        allUsers = users;
        projects.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        allProjects = projects;

        if (_users != null) {
          for (var user in allUsers) {
            if (_users?.contains(user.id) ?? false) {
              addUser(user);
            }
          }
        }

        for (var project in projects) {
          if (project.id == widget.initialTask?.project) {
            selectedProject = project;
            break;
          }
        }
      });
    } catch (e) {
      String exception = e.toString().substring(10);
      if (!mounted) return;
      ScaffoldMessenger.of(this.context).showSnackBar(
        SnackBar(
          content: Text(exception),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void addUser(User user) {
    setState(() {
      selectedUsers?.add(user);
    });
  }

  void deleteUser(User user) {
    setState(() {
      selectedUsers?.remove(user);
    });
  }

  void addProject(Project project) {
    setState(() {
      selectedProject = project;
    });
  }

  void deleteProject() {
    setState(() {
      selectedProject = null;
    });
  }

  Future<void> convertWebFileToDartFile(html.File webFile) async {
    // Convert web file to base64
    final reader = html.FileReader();
    reader.readAsDataUrl(webFile);
    await reader.onLoad.first;
    final base64String = reader.result as String;

    setState(() {
      doc64 = base64String.split(',').last;
      docName = webFile.name;
    });
  }

  Future<void> _pickFile() async {
    if (kIsWeb) {
      final html.InputElement input = html.InputElement(type: 'file');
      input.click();

      input.onChange.listen((e) {
        final file = input.files!.first;
        convertWebFileToDartFile(file)
            .then((dartFile) {})
            .catchError((error) {});
      });
    } else {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.any);

      if (result != null) {
        // On mobile or desktop, use the path property to access the file path
        // _selectedFile = File(result.files.single.path!);

        setState(() {
          _doc = File(result.files.single.path!);
          doc64 = base64Encode(Uint8List.fromList(_doc!.readAsBytesSync()));
          docName = basename(_doc!.path);
        });
      }
    }
  }

  String constructDownloadUrl(String filePath) {
    return '$baseUrl/task/tasks/download/$filePath';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: widget.initialTask != null,
              child: Column(
                children: [
                  Text(
                    'Чат задачи',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: defaultPadding),
                  MessagesScreen(projectId: widget.initialTask?.id ?? 0),
                  const SizedBox(height: defaultPadding * 3),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        widget.initialTask == null
                            ? 'Добавить задачу'
                            : 'Изменить задачу',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),

            const SizedBox(height: defaultPadding),
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(labelText: 'Название'),
                        // validator to check if name is not empty
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Название не может быть пустым';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: defaultPadding),
                      TextFormField(
                        controller: descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Описание'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Описание не может быть пустым';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: defaultPadding),

                      TextFormField(
                        controller: completionController,
                        decoration: const InputDecoration(
                            labelText: 'Крайний срок выполнения'),
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            completionController.text =
                                date.toLocal().toString().substring(0, 10);
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Крайний срок выполнения не может быть пустым';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: defaultPadding),

                      TextFormField(
                        controller: doneController,
                        decoration:
                            const InputDecoration(labelText: 'Дата выполнения'),
                        onTap: () async {
                          DateTime? date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            doneController.text =
                                date.toLocal().toString().substring(0, 10);
                          }
                        },
                      ),
                      const SizedBox(height: defaultPadding * 3),
                      // File
                      GestureDetector(
                        onTap: () {
                          if (widget.initialTask != null) {
                            if (widget.initialTask?.doc_name != null) {
                              final downloadUrl = constructDownloadUrl(
                                  widget.initialTask?.doc_name! ?? '');
                              launchUrl(Uri.parse(downloadUrl));
                            }
                          }
                        },
                        child: Visibility(
                          visible: docName != null,
                          child: Row(
                            children: [
                              Text('Файл: ${docName ?? ''}'),
                              const Icon(Icons.download),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _pickFile,
                        child: const Text('Прикрепить документ'),
                      ),
                    ]),
              ),
            ),
            const SizedBox(height: defaultPadding),

            Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Проекты',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: defaultPadding),
                  DropdownButton<Project>(
                    isExpanded: true,
                    value: null,
                    items: allProjects?.map((user) {
                      return DropdownMenuItem<Project>(
                        value: user,
                        child: Text(user.name),
                      );
                    }).toList(),
                    onChanged: (user) {
                      if (user != null) {
                        addProject(user);
                      }
                    },
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: (selectedProject == null) ? 0 : 1,
                    itemBuilder: (context, index) {
                      final user = selectedProject;
                      return ListTile(
                        title: Text(user?.name ?? ''),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            if (user != null) {
                              deleteProject();
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            // Users
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Пользователи',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: defaultPadding),
                  DropdownButton<User>(
                    isExpanded: true,
                    value: null,
                    items: allUsers.map((user) {
                      return DropdownMenuItem<User>(
                        value: user,
                        child: Text('${user.name} ${user.surname}'),
                      );
                    }).toList(),
                    onChanged: (user) {
                      if (user != null) {
                        addUser(user);
                      }
                    },
                  ),

                  // List of selected users with delete button

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: selectedUsers?.length ?? 0,
                    itemBuilder: (context, index) {
                      final user = selectedUsers?[index];
                      return ListTile(
                        title: Text(user.toString()),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            if (user != null) {
                              deleteUser(user);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () {
                saveTask();
              },
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ),
    );
  }

  void saveTask() async {
    try {
      if (!formKey.currentState!.validate()) {
        ScaffoldMessenger.of(this.context).showSnackBar(const SnackBar(
          content: Text('Заполните все обязательные поля'),
        ));
      }

      User author = await ApiService().fetchUserData();
      final Task newTask = Task(
        name: nameController.text,
        description: descriptionController.text,
        author: author.id ?? 0,
        completion:  DateTime.parse(completionController.text),
        done: null,
        document: _doc,
        doc: doc64,
        doc_name: docName,
        project: selectedProject?.id,
        task_to_user: selectedUsers?.map((user) => user.id ?? 0).toList(),
      );

      if (widget.initialTask == null) {
        String name = newTask.name;
        await apiService.createTask(newTask);

        if (!mounted) return;
        ScaffoldMessenger.of(this.context).showSnackBar(
          SnackBar(
            content: Text('Задача $name успешно создана'),
            duration: const Duration(seconds: 3),
          ),
        );
        Navigator.push(
          this.context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        );
      } else {
        if (widget.initialTask?.id != null) {
          int myId = widget.initialTask?.id ?? 0;

          final response  = await apiService.updateTask(myId, newTask);
          Task updatedTask = Task.fromJson(response.body);
          // Task updatedTask = await apiService.updateTask(myId, newTask);
if (!mounted) return;
          ScaffoldMessenger.of(this.context).showSnackBar(
            const SnackBar(
              content: Text('Информация о задаче успешно обновлена'),
              duration: Duration(seconds: 3),
            ),
          );


          Navigator.push(
            this.context,
            MaterialPageRoute(
              builder: (context) => TaskFormScreen(
                initialTask: updatedTask,
              ),
            ),
          );
        }
      }
    } catch (e) {
      if (!mounted) return;
      String exception = e.toString().substring(10);
      ScaffoldMessenger.of(this.context).showSnackBar(
        SnackBar(
          content: Text(exception),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
