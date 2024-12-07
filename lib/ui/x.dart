// import 'package:get/get.dart';
// import 'z.dart';
// class TaskController extends GetxController {
//   var tasks = <Map<String, dynamic>>[].obs;
//
//   void fetchTasks() async {
//     final data = await DatabaseHelper.instance.readAllTasks();
//     tasks.assignAll(data);
//   }
//
//   void addTask(String title) async {
//     await DatabaseHelper.instance.createTask(title);
//     fetchTasks();
//   }
//
//   void updateTask(int id, String title) async {
//     await DatabaseHelper.instance.updateTask(id, title);
//     fetchTasks();
//   }
//
//   void deleteTask(int id) async {
//     await DatabaseHelper.instance.deleteTask(id);
//     fetchTasks();
//   }
// }
