import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:napotest/features/task_mangement/widget/create_task_widget.dart';

class SearchAndFliterItem extends StatefulWidget {
  const SearchAndFliterItem({super.key});

  @override
  State<SearchAndFliterItem> createState() => _SearchAndFliterItemState();
}

class _SearchAndFliterItemState extends State<SearchAndFliterItem> {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(.5),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 40,
          width: 350,
          child: TextFormField(
            showCursor: false,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.grey.withOpacity(.5),
                    size: 15,
                  ),
                ),
                hintText: "Search...",
                contentPadding: EdgeInsets.only(
                  top: 10,
                ),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
                border: outlineInputBorder,
                errorBorder: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                focusedBorder: outlineInputBorder,
                disabledBorder: outlineInputBorder),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                FontAwesomeIcons.filter,
                color: Colors.black,
                size: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Fliters",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => const CreateTaskDialog(),
            );
          },
          child: Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.grey.withOpacity(.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  FontAwesomeIcons.add,
                  color: Colors.white,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Create Task",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.grey.withOpacity(.5),
            ),
          ),
          child: Icon(
            FontAwesomeIcons.ellipsis,
            color: Colors.black,
            size: 15,
          ),
        )
      ],
    );
  }
}
