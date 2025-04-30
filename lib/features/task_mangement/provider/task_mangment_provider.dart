// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:napotest/features/task_mangement/model/task_model.dart';
import 'package:napotest/features/users/model/user_model.dart';

class TaskMangemnetProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      id: 'task_1',
      name: 'Stock Audit',
      startDate: DateTime(2024, 9, 1),
      endDate: DateTime(2024, 9, 1),
      status: 'in progress',
      urgency: '(Kgs)',
      assignedTo: User(
        firstName: 'Annual',
        lastName: 'Ranked',
        role: 'Auditor',
        branch: 'Main Branch',
        emailAddress: 'annual.ranked@company.com',
      ),
      createdBy: User(
        firstName: 'Annual',
        lastName: 'Ranked',
        role: 'Auditor',
        branch: 'Main Branch',
        emailAddress: 'annual.ranked@company.com',
      ),
      createdAt: DateTime(2024, 8, 15),
    ),
    Task(
      id: 'task_2',
      name: 'Send April Sales Invoices',
      startDate: DateTime(2025, 3, 7, 15, 45),
      endDate: DateTime(2025, 3, 7, 15, 45),
      status: 'Completed',
      assignedTo: User(
        firstName: 'Total',
        lastName: 'Lossy',
        role: 'Accountant',
        branch: 'Main Branch',
        emailAddress: 'total.lossy@company.com',
      ),
      createdBy: User(
        firstName: 'Total',
        lastName: 'Lossy',
        role: 'Accountant',
        branch: 'Main Branch',
        emailAddress: 'total.lossy@company.com',
      ),
      createdAt: DateTime(2025, 2, 20),
    ),
    // Add other tasks similarly...
  ];

  List<Task> get tasks => _tasks;

  Future<void> addTask(Task task) async {
    _tasks.add(task);
    notifyListeners();
  }
}
