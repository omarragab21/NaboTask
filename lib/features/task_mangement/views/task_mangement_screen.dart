// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:napotest/features/task_mangement/provider/task_mangment_provider.dart';
import 'package:napotest/features/task_mangement/views/side_bar.dart';
import 'package:napotest/features/task_mangement/widget/pagination_widget.dart';
import 'package:napotest/features/task_mangement/widget/route_header.dart';
import 'package:napotest/features/task_mangement/widget/search_and_fliter_item.dart';
import 'package:napotest/features/task_mangement/widget/task_item.dart';
import 'package:napotest/features/users/model/user_model.dart';
import 'package:provider/provider.dart';

class TaskMangementScreen extends StatefulWidget {
  const TaskMangementScreen({super.key});

  @override
  State<TaskMangementScreen> createState() => _TaskMangementScreenState();
}

class _TaskMangementScreenState extends State<TaskMangementScreen> {
  @override
  Widget build(BuildContext context) {
    var taskMangementProviderWatch = context.watch<TaskMangemnetProvider>();
    var taskMangementProviderRead = context.read<TaskMangemnetProvider>();
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
            width: width * .19,
            child: NabuDashboard(),
          ),
          Container(
            height: height,
            width: width * .80,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //*Route Header
                  RouteHeader(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tasks",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SearchAndFliterItem(),
                  SizedBox(
                    height: 20,
                  ),
                  TaskItem(),
                  Spacer(),
                  PaginationWidget(
                      currentPage: 1,
                      totalItems: taskMangementProviderWatch.tasks.length,
                      onPageChanged: (value) {})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
