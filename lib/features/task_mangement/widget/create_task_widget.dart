import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:napotest/config/routes/navigation_app.dart';
import 'package:napotest/features/task_mangement/model/task_model.dart';
import 'package:napotest/features/task_mangement/provider/task_mangment_provider.dart';
import 'package:napotest/features/users/model/user_model.dart';
import 'package:provider/provider.dart';

class CreateTaskDialog extends StatefulWidget {
  const CreateTaskDialog({super.key});

  @override
  State<CreateTaskDialog> createState() => _CreateTaskDialogState();
}

class _CreateTaskDialogState extends State<CreateTaskDialog> {
  final _formKey = GlobalKey<FormState>();

  final _taskNameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _assignedToController = TextEditingController();

  String? _selectedUrgency;

  @override
  void dispose() {
    _taskNameController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _assignedToController.dispose();
    super.dispose();
  }

  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      log("Done");
      context.read<TaskMangemnetProvider>().addTask(Task(
          id: "5",
          name: _taskNameController.text.trim(),
          description: _descriptionController.text.trim(),
          startDate: DateFormat('yyyy-MM-dd').parse(_startDateController.text),
          endDate: DateFormat('yyyy-MM-dd').parse(_endDateController.text),
          status: _selectedUrgency!,
          assignedTo: User(
            firstName: _assignedToController.text,
            lastName: _taskNameController.text.trim(),
          )));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(8));

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Create task',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Task name and Urgency
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _taskNameController,
                        decoration: InputDecoration(
                          labelText: 'Task name *',
                          border: border,
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Task name is required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedUrgency,
                        decoration: InputDecoration(
                          labelText: 'Urgency *',
                          border: border,
                        ),
                        items: const [
                          DropdownMenuItem(value: 'Low', child: Text('Low')),
                          DropdownMenuItem(
                              value: 'Medium', child: Text('Medium')),
                          DropdownMenuItem(value: 'High', child: Text('High')),
                        ],
                        onChanged: (value) {
                          setState(() => _selectedUrgency = value);
                        },
                        validator: (value) =>
                            value == null ? 'Urgency is required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Description
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: border,
                  ),
                ),
                const SizedBox(height: 16),

                // Dates
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _startDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Start date',
                          border: border,
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 365 * 2)),
                            initialDate: DateTime.now(),
                          );
                          if (date != null) {
                            _startDateController.text =
                                '${date.year}-${date.month}-${date.day}';
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _endDateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'End date',
                          border: border,
                          suffixIcon: const Icon(Icons.calendar_today),
                        ),
                        onTap: () async {
                          final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            lastDate: DateTime.now()
                                .add(const Duration(days: 365 * 2)),
                            initialDate: DateTime.now(),
                          );
                          if (date != null) {
                            _endDateController.text =
                                '${date.year}-${date.month}-${date.day}';
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Assigned to
                TextFormField(
                  controller: _assignedToController,
                  decoration: InputDecoration(
                    labelText: 'Assigned to *',
                    border: border,
                    suffixIcon: const Icon(Icons.search),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? 'Assigned to is required' : null,
                ),
                const SizedBox(height: 24),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => NavigationApp.pop(),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: Colors.grey.withOpacity(.3))))),
                      child: const Text('Cancel'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: _submitTask,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.black),
                          minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: Colors.grey.withOpacity(.3))))),
                      child: const Text('Create task'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
