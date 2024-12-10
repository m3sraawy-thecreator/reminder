import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reminder/controllers/task_controller.dart';
import 'package:reminder/ui/add_task_page.dart';

class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final _taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Feeding',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    DateFormat.yMMMd().format(DateTime.now()),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                dateTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                monthTextStyle: const TextStyle(
                  fontSize: 0,
                  fontWeight: FontWeight.bold,
                ),
                dayTextStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                selectionColor: Colors.black,
                initialSelectedDate: DateTime.now(),
              ),
              _showTasks(),

            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
           await Get.to(const AddTaskPage());
             _taskController.getTasks();
          },
          backgroundColor: Colors.black,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _showTasks(){
    return Expanded(
      child:Obx((){
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, context){
              print(_taskController.taskList.length);
              return Container(
                width: 100,
                height: 50,
                color: Colors.green,
              );
        });
      }) ,
    );

  }
}
