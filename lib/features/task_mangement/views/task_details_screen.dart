import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:napotest/features/task_mangement/model/task_model.dart';
import 'package:napotest/features/task_mangement/views/side_bar.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;
  const TaskDetailsScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: height,
            width: width * .15,
            child: NabuDashboard(),
          ),
          SizedBox(
            height: height,
            width: width * .85,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTaskInfoSection(task),
                    const SizedBox(height: 24),
                    _buildTaskDetailsSection(),
                    const SizedBox(height: 24),
                    _buildCommentsSection(),
                    const SizedBox(height: 24),
                    _buildAddCommentSection(),
                    const SizedBox(height: 24),
                    _buildCreatedBySection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskInfoSection(Task task) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Start date',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildInfoRow('Uignery'),
        _buildInfoRow('Status', value: 'In progress'),
        _buildInfoRow('Assigned to', value: 'Sanita Khoke'),
        _buildInfoRow('End date', value: 'September 5, 2024 11:59 PM'),
        _buildInfoRow('Assigned by', value: 'Motamed AI'),
        _buildInfoRow('Project', value: 'Annual Quota'),
        _buildInfoRow('Tags', value: 'Inventory Audit'),
        _buildInfoRow('Date created', value: 'September 1, 2024 12:00AM'),
        _buildInfoRow('Department', value: 'Operations'),
        _buildInfoRow('Description', value: 'Audit Inventory'),
      ],
    );
  }

  Widget _buildInfoRow(String label, {String? value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(value ?? '-'),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'September 1, 2024 12:00AM',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            '(High)',
            style: TextStyle(color: Colors.red),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          '(In progress)',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: 8),
        _buildTagChip('Annual Quota'),
        _buildTagChip('Motamed AI'),
        const SizedBox(height: 16),
        const Text(
          'September 5, 2024 11:59 PM',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Sanita Khoke'),
        const SizedBox(height: 8),
        const Text(
          'Inventory Audit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildTagChip('Audit Inventory'),
        _buildTagChip('Uigner'),
        const SizedBox(height: 16),
        const Text(
          'September 5, 2024 11:59 PM',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        _buildTagChip('Operations'),
      ],
    );
  }

  Widget _buildTagChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: Colors.grey[200],
        visualDensity: VisualDensity.compact,
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Comment: Attachments',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Log Activity'),
        const Divider(thickness: 1),
      ],
    );
  }

  Widget _buildAddCommentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Add comment',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(
            hintText: 'Add a comment...',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Post Comment'),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildCreatedBySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Main Branch',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Notifications'),
        const Divider(thickness: 1),
        const SizedBox(height: 16),
        const Text(
          'Ahmed Qalai',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text('ahmed.qalai@gmail.com'),
      ],
    );
  }
}
