import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:napotest/config/routes/navigation_app.dart';
import 'package:napotest/features/task_mangement/model/task_model.dart';
import 'package:napotest/features/task_mangement/provider/task_mangment_provider.dart';
import 'package:napotest/features/task_mangement/views/task_details_screen.dart';
import 'package:napotest/features/users/model/user_model.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    var taskMangementProviderWatch = context.watch<TaskMangemnetProvider>();
    return DataTable(
        columnSpacing: 28,
        columns: [
          DataColumn(label: Checkbox(value: false, onChanged: (value) {})),
          DataColumn(label: Text('Task name')),
          DataColumn(label: Text('Start date')),
          DataColumn(label: Text('Urgency')),
          DataColumn(label: Text('Status')),
          DataColumn(
              label: Text(
            'Assignment to',
            style: TextStyle(fontSize: 12),
          )),
          DataColumn(label: Text('End date')),
          DataColumn(label: Text('Actions')),
        ],
        rows: taskMangementProviderWatch.tasks
            .map((task) => _buildTaskRow(
                task.name,
                task.startDate.toString(),
                task.name,
                task.status,
                task.assignedTo,
                task.endDate.toString(),
                context))
            .toList());
  }

  DataRow _buildTaskRow(String taskName, String startDate, String urgency,
      String status, User assignment, String endDate, BuildContext context) {
    return DataRow(
      cells: [
        DataCell(Checkbox(value: false, onChanged: (value) {})),
        DataCell(Text(taskName)),
        DataCell(Text(startDate)),
        DataCell(Text(urgency)),
        DataCell(
          Container(
            height: 40,
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _getStatusColor(status),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        DataCell(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueAccent,
              radius: 12,
              child: Icon(
                FontAwesomeIcons.person,
                color: Colors.white,
                size: 12,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              assignment.fullName,
              style: TextStyle(fontSize: 12),
            )
          ],
        )),
        DataCell(Text(endDate)),
        DataCell(
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskDetailsScreen(
                          task: Task(
                              id: "4",
                              name: taskName,
                              startDate:
                                  DateFormat('yyyy-MM-dd').parse(startDate),
                              endDate: DateFormat('yyyy-MM-dd').parse(endDate),
                              status: status,
                              assignedTo: assignment))));
            },
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'in progress':
        return Colors.orange;
      case 'draft':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
}
