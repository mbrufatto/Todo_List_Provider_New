import 'package:todo_list_provider/app/models/task_model.dart';
import 'package:todo_list_provider/app/models/week_task_model.dart';

abstract class TasksService {
  Future<void> save(DateTime date, String description, String userId);
  Future<List<TaskModel>> getToday(String userId);
  Future<List<TaskModel>> getTomorrow(String userId);
  Future<WeekTaskModel> getWeek(String userId);
  Future<void> checkOrUncheckTask(TaskModel task);
  Future<void> delete(TaskModel task);
}
