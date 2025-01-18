import 'package:flutter/material.dart';
import 'package:to_do_list/pages/utils/todo_list.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList=[
    ['Learn web developpement',false],
    ['Drink coffee',false],
  ];
void checkBoxChanged(int index){
  setState(() {
    toDoList[index][1]=!toDoList[index][1];
  });
  }
  final _Controller=TextEditingController();
  void saveNewTask(){
    setState(() {
      toDoList.add([_Controller.text,false]);
      _Controller.clear();
    });
  }
  void deleteTask(int index) {
  setState(() {
    toDoList.removeAt(index);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title:Text(
          'Simple Todo List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
          

        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body:ListView.builder(itemCount: toDoList.length,itemBuilder: (BuildContext context, index) {
        
       return TodoList(
        taskName: toDoList[index][0],
        taskCompleted: toDoList[index][1],
        onChanged: (value) =>checkBoxChanged(index),
        onDelete: () => deleteTask(index),
       );
      }),
      floatingActionButton: Row(
        children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
            controller:_Controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurple,
                  ),
                borderRadius: BorderRadius.circular(10),  

                ),
                hintText: 'Enter a task',
                hintStyle: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
            ),
          ),
        ),
          FloatingActionButton(
        onPressed: saveNewTask,
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
      ),
        ],
        
      ) ,
    );
  }
}