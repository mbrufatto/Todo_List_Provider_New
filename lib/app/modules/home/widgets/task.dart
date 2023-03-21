import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.grey),
        ],
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        contentPadding: EdgeInsets.all(8),
        leading: Checkbox(
          value: true,
          onChanged: (value) {},
        ),
        title: Text(
          'Descrição da Task',
          style: TextStyle(
            decoration: true ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          '20/07/2021',
          style: TextStyle(
            decoration: true ? TextDecoration.lineThrough : null,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(width: 1),
        ),
      ),
    );
  }
}
