import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DataFromApi extends StatefulWidget {
  const DataFromApi({Key? key}) : super(key: key);

  @override
  _DataFromApiState createState() => _DataFromApiState();
}

class _DataFromApiState extends State<DataFromApi> {
  Future gettaskData() async {
    var response = await http
        .get(Uri.https('jsonplaceholder.typicode.com', 'todos?_limit=5'));
    var jsonData = jsonDecode(response.body);
    List<Tasks> tasks = [];

    for (var u in jsonData) {
      Tasks tasks = Tasks(u["title"], u["userId"], u["id"], u["completed"]);
      tasks.add(tasks);
    }
    print(tasks.length);
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks Data'),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: gettaskData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data[i].title),
                        subtitle: Text(snapshot.data[i].userId),
                        trailing: Text(snapshot.data[i].completed),
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}

class Tasks {
  final String title;
  final int userId, id;
  final Float completed;

  Tasks(this.title, this.userId, this.id, this.completed);
}
