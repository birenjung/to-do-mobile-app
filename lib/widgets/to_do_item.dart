import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box, color: Colors.blue[500],),
        title: Text('Check email.', style: TextStyle(fontSize: 17, decoration: TextDecoration.lineThrough),),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.red            
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete),
            iconSize: 18,
            color: Colors.white,
          ),
          ),
      ),
    );
  }
}