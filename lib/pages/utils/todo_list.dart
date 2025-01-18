import 'package:flutter/material.dart';
import 'package:to_do_list/pages/utils/todo_list.dart';
import 'package:to_do_list/pages/home_page.dart';
class TodoList extends StatefulWidget {
  const TodoList({super.key,
   required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onDelete,});
final String taskName;
final bool taskCompleted;
final Function (bool?)?onChanged;
final Function()?onDelete;
  
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
     return Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 0,
          ),
         

        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
          children:[
            Checkbox(
              value: widget.taskCompleted,
              onChanged: widget.onChanged,
              checkColor: Colors.deepPurple,
              activeColor: Colors.white,
              side: BorderSide(
                color: Colors.white,
            
              ),
            ),
            Text(
            widget.taskName,
            style:TextStyle(
              color: Colors.white,
              fontSize: 20,
              decoration: widget.taskCompleted ? TextDecoration.lineThrough
              : TextDecoration.none,
              decorationColor: Colors.white,
              decorationThickness: 2,
            ),
            ),  
            const Spacer(),
            IconButton(
              onPressed: widget.onDelete,
              icon: const Icon(Icons.delete, color: Colors.white),
            ),
        
          ],
          
        ),
        ),
     );
  }
}