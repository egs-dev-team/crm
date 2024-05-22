import 'package:egs/api/message_api.dart';
import 'package:egs/api/service.dart';
import 'package:egs/model/message.dart';
import 'package:egs/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:egs/responsive.dart';

import 'package:path/path.dart';

import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'dart:io';

import '../../../ui/const.dart';

class MessageList extends StatefulWidget {
  final int userId;
  final int? taskId;
  final int? mailId;

  const MessageList({Key? key, required this.userId, this.taskId, this.mailId})
      : super(key: key);

  @override
  MessageListState createState() => MessageListState();
}

class MessageListState extends State<MessageList> {
  late Future<List<Message>>? messagesFuture;

  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();
  File? _selectedFile;
  String? doc64;
  String? docName;

  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  Future<void> loadMessages() async {
    setState(() {
      try {
        messagesFuture = MessageApi().fetchMessages();
      } catch (error) {
        // Handle errors here
        print('Error fetching messages: $error');
      }
    });
  }

  Future<void> convertWebFileToDartFile(html.File webFile) async {
    // Convert web file to base64
    final reader = html.FileReader();
    reader.readAsDataUrl(webFile);
    await reader.onLoad.first;
    final base64String = reader.result as String;
    doc64 = base64String.split(',').last;
    docName = webFile.name;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Message>>(
      future: messagesFuture,
      builder: (context, snapshot) {
        if (messagesFuture == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Error while fetching data, show an error message
          return Text('Error: ${snapshot.error}');
        } else {
          // Data has been fetched, build the ListView
          List<Message> originalMessages = snapshot.data ?? [];
          List<Message> taskMessages = [];
          for (var message in originalMessages) {
            if (message.task == widget.taskId || message.mail == widget.mailId) {
              taskMessages.add(message);
            }
          }
          List<Message> messages = List.from(taskMessages.reversed);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 300,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.grey,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/menu_notification.svg",
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Автор: ${messages[index].author}'),
                                    Text(
                                      'Дата отправки: ${messages[index].created.toString().substring(0, 11)}',
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (messages[index].docName != null) {
                                      final downloadUrl = constructDownloadUrl(
                                          messages[index].docName!);
                                      launch(downloadUrl);
                                    }
                                  },
                                  child: Visibility(
                                    visible: messages[index].docName != null,
                                    child: Row(
                                      children: [
                                        Text(
                                            'Файл: ${messages[index].docName ?? ''}'),
                                        const Icon(Icons.download),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: defaultPadding),
                                Text(
                                  messages[index].message ?? 'Нет текста',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: defaultPadding),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            if (kIsWeb) {
                              final html.InputElement input =
                                  html.InputElement(type: 'file');
                              input.click();

                              input.onChange.listen((e) {
                                final file = input.files!.first;
                                convertWebFileToDartFile(file)
                                    .then((dartFile) {})
                                    .catchError((error) {
                                  print(
                                      'Error converting file to base64: $error');
                                });
                              });
                            } else {
                              FilePickerResult? result = await FilePicker
                                  .platform
                                  .pickFiles(type: FileType.any);

                              if (result != null) {
                                // On mobile or desktop, use the path property to access the file path
                                // _selectedFile = File(result.files.single.path!);

                                _selectedFile = File(result.files.single.path!);
                                doc64 = base64Encode(Uint8List.fromList(
                                    _selectedFile!.readAsBytesSync()));
                                docName = basename(_selectedFile!.path);
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Icon(
                            Icons.file_present,
                            size: 24.0,
                          ),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _messageController,
                            decoration:
                                const InputDecoration(labelText: 'Сообщение'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Введите сообщение';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Form is valid, submit the message
                              Message message = Message(
                                message: _messageController.text,
                                author: widget.userId,
                                task: widget.taskId,
                                mail: widget.mailId,
                                doc: _selectedFile,
                                docBase64: doc64,
                                docName: docName,
                              );

                              try {
                                // Await the completion of the createMessage method
                                await MessageApi().createMessage(message);

                                // After successful submission, load messages
                                _formKey.currentState?.reset();
                                _selectedFile = null;
                                await loadMessages();
                              } catch (error) {
                                // Handle errors during message submission
                                print('Error submitting message: $error');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: const Icon(Icons.send),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }

  String constructDownloadUrl(String filePath) {
    return '$baseUrl/message/messages/download/$filePath';
  }
}
