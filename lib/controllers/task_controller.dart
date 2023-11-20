import 'package:flutter_remind_me_app/DB/database_initializer.dart';
import 'package:flutter_remind_me_app/models/task.dart';
import 'package:get/state_manager.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  Future<int> addTask({Task? task}) async {
    return await DataBaseInitializer.insert(task);
  }
}
