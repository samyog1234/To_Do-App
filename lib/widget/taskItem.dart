import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  final bool value;
  final String title;
  final void Function(bool?)? onCharged;
  final void Function(BuildContext)? onDelete;
  final void Function(BuildContext)? onEdit;

  const TaskItem({
    Key? key,
    required this.value,
    required this.title,
    required this.onCharged,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, top: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SizedBox(width: 5),
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.orange.shade300,
              onPressed: onEdit,
              icon: Icons.edit,
            ),
            SizedBox(width: 5),
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              backgroundColor: Colors.red,
              onPressed: onDelete,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 226, 225, 225),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: value,
                      onChanged: onCharged,
                      activeColor: Colors.green,
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: value ? Colors.grey.shade400 : Colors.black,
                        decoration: value
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
