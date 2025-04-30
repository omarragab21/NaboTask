import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RouteHeader extends StatelessWidget {
  const RouteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          FontAwesomeIcons.home,
          color: Colors.grey,
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text(
            "/",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text(
            "Task Mangement",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text(
            "/",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Padding(
          padding: EdgeInsets.only(top: 3),
          child: Text(
            "Tasks",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
