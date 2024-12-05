import 'package:egs/core/api.dart';
import 'package:egs/core/const.dart';
import 'package:egs/project/data/journal.dart';
import 'package:flutter/material.dart';

class JournalScreen extends StatefulWidget {
  final int projectId;

  const JournalScreen({Key? key, required this.projectId}) : super(key: key);

  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  late Future<List<Journal>> statusChanges;
  Journal journal = Journal(projectId: 1, type: '2');
  TextEditingController typeController = TextEditingController(text: '2');
  TextEditingController valueController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    journal = Journal(projectId: widget.projectId, type: '2');

    fetchData();
  }

  @override
  void dispose() {
    typeController.dispose();
    valueController.dispose();
    statusController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    statusChanges = ApiService().getJournal(widget.projectId);
  }

  void _showNewStatusChoiceChangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Добавить изменение цены/статуса'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: typeController.text,
                items: const [
                  DropdownMenuItem(
                    value: '1',
                    child: Text('Статус'),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text('Цена'),
                  ),
                ],
                onChanged: (value) {
                  journal = journal.copyWith(type: value! );
                  setState(() {
                    typeController.text = value!;
                    print(typeController.text);
                  });
                },
                decoration: const InputDecoration(labelText: 'Тип изменения'),
              ),
              if (typeController.text == '2')
                TextFormField(
                  controller: valueController,
                  onChanged: (value) {
                    journal = journal.copyWith(value: double.parse(value));
                  },
                  decoration: const InputDecoration(labelText: 'Значение'),
                )
              else
                DropdownButtonFormField<String>(
                  value: statusController.text,
                  items: const [
                    DropdownMenuItem(
                      value: '1',
                      child: Text('В работе'),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text('ПНР'),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: Text('Сезон откл.'),
                    ),
                    DropdownMenuItem(
                      value: '4',
                      child: Text('СМР'),
                    ),
                    DropdownMenuItem(
                      value: '5',
                      child: Text('Аварийное откл.'),
                    ),
                  ],
                  onChanged: (value) {
                    journal = journal.copyWith(status: value);
                    setState(() {
                      statusController.text = value!;
                    });
                  },
                  decoration:
                      const InputDecoration(labelText: 'Статус объекта'),
                ),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(labelText: 'Дата'),
                onTap: () async {
                  DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null) {
                    dateController.text =
                        date.toLocal().toString().substring(0, 10);
                    journal = journal.copyWith(date: date);
                  }
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Отменить'),
            ),
            TextButton(
              onPressed: () {
                ApiService().createJournal(journal);
                setState(() {
                  statusChanges =
                      ApiService().getJournal(widget.projectId);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: defaultPadding),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Журнал', style: Theme.of(context).textTheme.titleMedium),
          ElevatedButton(
            onPressed: () {
              _showNewStatusChoiceChangeDialog(context);
            },
            child: const Text('Добавить изменение цены/статуса'),
          ),
        ],
      ),
      const SizedBox(height: defaultPadding),
      Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 300,
        child: SingleChildScrollView(
            child: Column(children: [
          FutureBuilder<List<Journal>>(
              future: statusChanges,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final responseStatusChnages = snapshot.data ?? [];

                  List<DataRow> rows = responseStatusChnages!.map((row) {
                    return DataRow(cells: [
                      DataCell(Text(row.date.toString().substring(0, 10))),
                      DataCell(Text(row.value.toString())),
                    ]);
                  }).toList();

                  return SizedBox(
                    height: 300,
                    width: double.maxFinite,
                    child: DataTable(
                      border: TableBorder.all(
                            width: 3,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                      columnSpacing: defaultPadding,
                      // minWidth: 600,
                      columns: const [
                        DataColumn(
                          label: Text("Дата"),
                        ),
                        DataColumn(
                          label: Text("Цена"),
                        ),
                      ],
                      rows: rows,
                    ),
                  );
                }
              })
        ])),
      ),
    ]);
  }
}
