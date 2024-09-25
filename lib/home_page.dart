import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/utilis/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController _controller = TextEditingController();

  List toDoList =[
    ['Reading ', false],
    ['Meditation', false],
    ['Drink Coffee', false]
  ];


  void checkBoxChanged (int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        toDoList.add([_controller.text.trim(), false]);
        _controller.clear();
      });
    } else {
      // Optionally show a message to the user indicating the text field is empty
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a task!'))
      );
    }
  }

  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(title: Text('Todo Note', style: Theme.of(context).textTheme.displayLarge,),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.secondary,
      ),


      body: SingleChildScrollView(
        child: Column(
          
          children: [
            SizedBox(
              height: 700,
              child: ListView.builder(
                // padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
                itemCount:toDoList.length,
                  itemBuilder: (context, index){
                  return TodoList(
                    taskName: toDoList[index][0],
                    taskCompleted: toDoList[index][1],
                    onChanged: (value) => checkBoxChanged(index),
                    deleteFunction:(context) => deleteTask(index),
                  );
        
                  }
              ),
            ),
          ],

        
        
        ),

      ),
      floatingActionButton: Row(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: _controller,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Add new todo items',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder:OutlineInputBorder(
                        borderSide: const  BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),

                ),
              )
          ),
          FloatingActionButton(
            // tooltip: 'shree',
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: saveNewTask,
            child: Icon(Icons.add),
          ),
        ],
      ),

    );

  }
}
