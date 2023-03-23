import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/services/tasks/tasks_service.dart';
import '../../../models/task_model.dart';

class Task extends StatelessWidget {
  final TaskModel model;
  final dateFormat = DateFormat('dd/MM/y');

  Task({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthProvider>().user?.uid ?? '';
    final homeController = context.read<HomeController>();
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: Key(model.id.toString()),
      confirmDismiss: (DismissDirection direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Excluir Task'),
              content:
                  const Text('Você tem certeza que deseja deletar essa task?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () async {
                    Loader.show(context);
                    await homeController.delete(model, userId);
                    Loader.hide();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Confirmar'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            );
          },
        );
      },
      background: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: Container(
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
            value: model.finished,
            onChanged: (value) => context
                .read<HomeController>()
                .checkOrUncheckTask(model, userId),
          ),
          title: Text(
            model.description,
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(
            dateFormat.format(model.dateTime),
            style: TextStyle(
              decoration: model.finished ? TextDecoration.lineThrough : null,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(width: 1),
          ),
        ),
      ),
    );
  }
}
