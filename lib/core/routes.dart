import 'package:egs/core/responsive.dart';
import 'package:egs/dashboard/data/task.dart';
import 'package:egs/login/data/user.dart';
import 'package:egs/old/model/mail.dart';
import 'package:egs/dashboard/ui/task_form.dart';
import 'package:egs/dashboard/ui/dashboard_screen.dart';
import 'package:egs/old/screens/documents/documents.dart';
import 'package:egs/old/screens/employees/employees.dart';
import 'package:egs/login/ui/login.dart';
import 'package:egs/old/screens/mails/mails.dart';
import 'package:egs/messages/ui/messages.dart';
import 'package:egs/old/screens/projects/projects.dart';
import 'package:egs/login/ui/register.dart';
import 'package:egs/old/screens/employees/components/employee_form.dart';
import 'package:egs/old/screens/mails/components/add_mail.dart';
import 'package:egs/old/screens/mails/components/mail_form.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const ResponsiveWrapper(child: LoginScreen()),
          settings: const RouteSettings(name: '/login'),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (context) =>
              const ResponsiveWrapper(child: RegistrationScreen()),
          settings: const RouteSettings(name: '/register'),
        );
      case '/dashboard':
        return MaterialPageRoute(
          builder: (context) =>
              const ResponsiveWrapper(child: DashboardScreen()),
          settings: const RouteSettings(name: '/dashboard'),
        );
      case '/documents':
        return MaterialPageRoute(
          builder: (context) =>
              const ResponsiveWrapper(child: DocumentsScreen()),
          settings: const RouteSettings(name: '/documents'),
        );
      case '/employees':
        return MaterialPageRoute(
          builder: (context) =>
              const ResponsiveWrapper(child: EmployeesScreen()),
          settings: const RouteSettings(name: '/employees'),
        );
      case '/mails':
        return MaterialPageRoute(
          builder: (context) => const ResponsiveWrapper(child: MailsScreen()),
          settings: const RouteSettings(name: '/mails'),
        );
      case '/messages':
        return MaterialPageRoute(
          builder: (context) => ResponsiveWrapper(
              child: MessagesScreen(projectId: settings.arguments as int)),
          settings: const RouteSettings(name: '/messages'),
        );
      case '/projects':
        return MaterialPageRoute(
          builder: (context) =>
              const ResponsiveWrapper(child: ProjectsScreen()),
          settings: const RouteSettings(name: '/projects'),
        );
      case '/taskForm':
        return MaterialPageRoute(
          builder: (context) => ResponsiveWrapper(
              child: TaskFormScreen(initialTask: settings.arguments as Task?)),
          settings: const RouteSettings(name: '/taskForm'),
        );
      case '/userForm':
        return MaterialPageRoute(
          builder: (context) => ResponsiveWrapper(
              child: EmployeeForm(user: settings.arguments as User?)),
          settings: const RouteSettings(name: '/userForm'),
        );
      case '/mailAdd':
        return MaterialPageRoute(
          builder: (context) => const ResponsiveWrapper(child: AddMail()),
          settings: const RouteSettings(name: '/mailAdd'),
        );
      case '/mailForm':
        return MaterialPageRoute(
          builder: (context) => ResponsiveWrapper(
              child: MailFormScreen(initialMail: settings.arguments as Mail?)),
          settings: const RouteSettings(name: '/mailForm'),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Error: Route not found!'),
        ),
      );
    });
  }
}
