import 'package:egs/core/api.dart';
import 'package:egs/core/const.dart';
import 'package:egs/login/data/user.dart';
import 'package:egs/messages/ui/message_list.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  final int? projectId;
  final int? mailId;

  const MessagesScreen({super.key, this.projectId, this.mailId});

  @override
  MessagesScreenState createState() => MessagesScreenState();
}

class MessagesScreenState extends State<MessagesScreen> {
  late Future<User>? userFuture;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  Future<void> loadUser() async {
    setState(() {
      try {
        userFuture = apiService.fetchUserData();
      } catch (error) {
        print('Error fetching messages: $error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
        future: userFuture,
        builder: (context, snapshot) {
          if (userFuture == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Error while fetching data, show an error message
            return Text('Error: ${snapshot.error}');
          } else {
            int currentUser = snapshot.data?.id ?? 0;
            return Container(
              height: 500,
              padding: const EdgeInsets.all(defaultPadding),
              child: MessageList(
                userId: currentUser,
                taskId: widget.projectId,
                mailId: widget.mailId,
              ),
            );
          }
        });
  }
}
