import 'package:flutter/material.dart';

 

void main() => runApp(TaskListApp());

 

class TaskListApp extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Lista de Tarefas',

      theme: ThemeData(primarySwatch: Colors.teal),

      home: TaskListScreen(),

    );

  }

}

 

class TaskListScreen extends StatefulWidget {

  @override

  _TaskListScreenState createState() => _TaskListScreenState();

}

 

class _TaskListScreenState extends State<TaskListScreen> {

  List<String> tasks = [

    '1 - Estudar matemática',

    '2 - Estudar bioquímica',

    '3 - Estudar literatura',

    '4 - Fazer simulado de física',

    '5 - Ver vídeo aula de história',

    '6 - Ler A República de Platão',

  ];

 

  List<String> completedTasks = [];

 

  void toggleTaskCompletion(int index) {

    setState(() {

      if (completedTasks.contains(tasks[index])) {

        completedTasks.remove(tasks[index]);

      } else {

        completedTasks.add(tasks[index]);

      }

 

      // Reordena as tarefas

      String task = tasks[index];

      tasks.remove(task);

      tasks.add(task);

    });

  }

 

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Lista de Tarefas'),

      ),

      body: ListView.builder(

        itemCount: tasks.length,

        itemBuilder: (context, index) {

          String task = tasks[index];

          bool isCompleted = completedTasks.contains(task);

 

          return Dismissible(

            key: UniqueKey(),

            direction: DismissDirection.horizontal,

            onDismissed: (direction) {

              setState(() {

                completedTasks.add(task);

                tasks.remove(task);

              });

            },

            child: ListTile(

              title: Text(

                task,

                style: TextStyle(

                  decoration: isCompleted ? TextDecoration.lineThrough : TextDecoration.none,

                ),

              ),

              leading: Checkbox(

                value: isCompleted,

                onChanged: (value) {

                  toggleTaskCompletion(index);

                },

              ),

            ),

          );

        },

      ),

    );

  }

}

 