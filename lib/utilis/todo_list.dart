 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {

   TodoList({super.key,
   required this.taskName,
   required  this.onChanged,
   required  this.taskCompleted,
   required  this.deleteFunction,


   });
   late String taskName;
   late bool taskCompleted;
   final Function(bool?)? onChanged;
   final Function(BuildContext)? deleteFunction;



   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.only(left: 20, right: 20, top: 20.0, bottom: 3.0),

       child: Slidable(
         endActionPane: ActionPane(
           motion: StretchMotion(),
           children: [
             SlidableAction(onPressed: deleteFunction,
             icon: Icons.delete,
             borderRadius: BorderRadius.circular(20),
            backgroundColor: Colors.brown,
             )

           ],
         ),
         child: Card(
           color: Theme.of(context).colorScheme.secondary,
           child: ListTile(
             leading: Checkbox(
               value: taskCompleted,
               onChanged: onChanged,
             ),
             title: Text(taskName,
             style: TextStyle(decoration: taskCompleted == true? TextDecoration.lineThrough : TextDecoration.none),
             ),

             )
           ),
       ),
       );
     // );

   }
 }

