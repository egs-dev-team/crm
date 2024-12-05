import 'package:egs/core/api.dart';
import 'package:egs/dashboard/data/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = ChangeNotifierProvider<TaskNotifier>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends ChangeNotifier {
  String _selectedTypeParameter = '1';
  final _selectedTypeParameterName = [
    'Эксплуатация',
    'Техническое обслуживание',
    'СМР',
    'Производство',
    'Без типа',
  ];

  String get selectedTypeParameter => _selectedTypeParameter;

  List<String> get selectedTypeParameterName => _selectedTypeParameterName;

  void setSelectedTypeParameter(String value) {
    _selectedTypeParameter = value;
    notifyListeners();
  }

  List<Task> tasks = [];
  List<Task> sortedTasks = [];

  Future<void> updateTasks() async {
    tasks = await apiService.fetchTasks();
    sortTasks();
    notifyListeners();
  }

  void sortTasks() {
    sortedTasks = tasks
        .where((task) =>
            task.type == _selectedTypeParameter ||
            _selectedTypeParameter == '5')
        .toList()
      ..sort(
        (a, b) {
          return (a.completion?.compareTo(b.completion ?? DateTime.now()) ?? 0)
              .compareTo(0);
        },
      );
    notifyListeners();
  }
}
