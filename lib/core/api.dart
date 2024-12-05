import 'dart:convert';
import 'package:egs/dashboard/data/task.dart';
import 'package:egs/login/data/user.dart';
import 'package:egs/project/data/journal.dart';
import 'package:egs/project/data/project.dart';
import 'package:http/http.dart' as http;
import 'package:egs/core/prefs.dart';
import 'package:egs/core/const.dart';

late ApiService apiService;

class ApiService {
  final http.Client httpClient;

  ApiService() : httpClient = http.Client();

  Uri _buildUri(String path) {
    return Uri.parse('$baseUrl$path');
  }

  Future<Response> sendRequest({
    required String method,
    required String url,
    Map<String, String>? headers,
    dynamic body,
    bool needToken = true,
    bool needBytes = true,
  }) async {
    Map<String, String> requestHeaders = headers ?? {};
    requestHeaders['Content-Type'] = 'application/json; charset=utf-8';
    String? token = prefs.getToken();
    if (token != null &&
        !requestHeaders.containsKey('Authorization') &&
        needToken) {
      requestHeaders['Authorization'] = 'Token $token';
    }

    http.Response response;
    Uri uri = _buildUri(url);

    switch (method.toUpperCase()) {
      case 'POST':
        response = await httpClient.post(uri,
            headers: requestHeaders, body: json.encode(body));
        break;
      case 'GET':
        response = await httpClient.get(uri, headers: requestHeaders);
        break;
      case 'PUT':
        response = await httpClient.put(uri,
            headers: requestHeaders, body: json.encode(body));
        break;
      case 'DELETE':
        response = await httpClient.delete(uri, headers: requestHeaders);
        break;
      default:
        throw Exception('Unsupported HTTP method: $method');
    }

    if (needBytes) {
      return Response(
        body: jsonDecode(utf8.decode(response.bodyBytes)),
        statusCode: response.statusCode,
      );
    }

    return Response(
      body: response.statusCode != 500
          ? jsonDecode(response.body)
          : response.body,
      statusCode: response.statusCode,
    );
  }

  Future<Response> register(String email, String password, String name,
      String surname, String lastName, int id) async {
    final response = await sendRequest(
      method: 'POST',
      url: '/user/register/',
      body: {
        'email': email,
        'password': password,
        'name': name,
        'surname': surname,
        'last_name': lastName,
        'id': id.toString(),
      },
      needToken: false,
    );
    return response;
  }

  Future<Response> login(String email, String password) async {
    final data = await sendRequest(
      method: 'POST',
      url: '/user/login/',
      body: {
        'email': email,
        'password': password,
      },
      needToken: false,
    );

    if (data.isSuccess) {
      prefs.setToken(data.body['token']);
    }
    return data;
  }

  Future<bool> logout() async {
    prefs.clear();
    return true;
  }

  Future<User> fetchUserData() async {
    final userData = await sendRequest(
      method: 'GET',
      url: '/user/profile/',
    );
    return User.fromJson(userData.body);
  }

  Future<List<User>> getUsers() async {
    final usersData = await sendRequest(
      method: 'GET',
      url: '/user/users/',
      needBytes: true,
    );
    if (usersData.isSuccess) {
      Iterable users = usersData.body;
      return List<User>.from(users.map((user) => User.fromJson(user)));
    } else {
      throw Exception('Error getting users');
    }
  }

  Future<Response> createUser(User user) async {
    final userData = await sendRequest(
      method: 'POST',
      url: '/user/register/',
      body: user.toJson(),
    );

    return userData;
  }

  Future<Response> updateUser({required userId, required User user}) async {
    final userData = await sendRequest(
      method: 'PUT',
      url: '/user/users/$userId/',
      body: user.toJson(),
    );

    return userData;
  }

  Future<Response> deleteUser(int userId) async {
    final response = await sendRequest(
      method: 'DELETE',
      url: '/user/users/$userId/',
    );

    return response;
  }

  Future<bool> sendChangeTheme(
      {required bool isDark, required User? user}) async {
    if (user == null) {
      return true;
    } else {
      int userId = user.id ?? 0;
      final newUser = user.copyWith(is_dark: isDark);
      final result = await apiService.updateUser(userId: userId, user: newUser);
      if (result.isSuccess) {
        if (User.fromJson(result.body).is_dark == isDark) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    }
  }

  Future<List<Task>> fetchTasks() async {
    final response = await apiService.sendRequest(
      method: 'GET',
      url: '/task/tasks/',
      needBytes: true,
    );

    if (response.isSuccess) {
      Iterable data = response.body;
      return List<Task>.from(
        data.map((json) => Task.fromJson(json)),
      );
    } else {
      throw Exception('Ошибка загрузки задач.');
    }
  }

  Future<Response> createTask(Task task) async {
    final response = await apiService.sendRequest(
      method: 'POST',
      url: '/task/tasks/',
      body: task.toJson(),
      needBytes: true,
    );

    return response;
  }

  Future<Response> updateTask(int taskId, Task task) async {
    final response = await apiService.sendRequest(
      method: 'PUT',
      url: '/task/tasks/$taskId/',
      body: task.toJson(),
      needBytes: true,
    );

    return response;
  }

  Future<Response> deleteTask(int taskId) async {
    final response = await apiService.sendRequest(
      method: 'DELETE',
      url: '/task/tasks/$taskId/',
    );

//    if (response.statusCode != 204) {
    return response;
  }

  Future<Map<String, dynamic>?> fetchTasksByDate(int userId) async {
    final body = {'user_id': userId};

    final response = await apiService.sendRequest(
      method: 'POST',
      url: '/task/tasks_by_date/?user_id=$userId',
      body: body,
    );

    if (response.isSuccess) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Ошибка загрузки заданий');
    }
  }

  Future<List<Project>> getProjects() async {
    final response = await apiService.sendRequest(
      method: 'GET',
      url: '/project/projects/',
      needBytes: true,
    );

    if (response.isSuccess) {
      Iterable data = response.body;
      return List<Project>.from(
        data.map((json) => Project.fromJson(json)),
      );
    } else {
      throw Exception('Ошибка загрузки задач.');
    }
  }

  Future<Response> createProject(Project project) async {
    final response = await apiService.sendRequest(
      method: 'POST',
      url: '/project/projects/',
      body: project.toJson(),
    );

    return response;
  }

  Future<Response> updateProject(int projectId, Project project) async {
    final response = await apiService.sendRequest(
      method: 'PUT',
      url: '/project/projects/$projectId/',
      body: project.toJson(),
    );

    return response;
  }

  Future<Response> deleteProject(int projectId) async {
    final response = await apiService.sendRequest(
      method: 'DELETE',
      url: '/project/projects/$projectId/',
    );

    return response;
  }

  Future<List<Journal>> getJournal(int projectId) async {
    final response = await apiService.sendRequest(
      method: 'GET',
      url: '/project/status-choice-change/$projectId',
    );

    if (response.isSuccess) {
      final List<dynamic> jsonJournals = response.body;
      return jsonJournals.map((json) => Journal.fromJson(json)).toList();
    } else {
      throw Exception('Ошибка получения журнала.');
    }
  }

  Future<Response> createJournal(Journal journal) async {
    final response = await apiService.sendRequest(
      method: 'POST',
      url: '/project/status-choice-change/',
      body: journal.toJson(),
    );

    return response;
  }

  Future<Response> deleteJournal(int journalId) async {
    final response = await apiService.sendRequest(
      method: 'DELETE',
      url: '/project/status-choice-change/$journalId/',
    );

    return response;
  }
}

class Response {
  final dynamic body;
  final int statusCode;
  final bool isSuccess;
  final String? message;

  Response({
    required this.body,
    required this.statusCode,
    this.message,
  }) : isSuccess = statusCode >= 200 && statusCode < 300;
}
