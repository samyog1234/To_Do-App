import "package:flutter/material.dart";
import "package:todo_app/widget/ButtonCreated.dart";

class popUpBox extends StatelessWidget {
  final VoidCallback onTaskSave;
  final TextEditingController textController;
  final String hintText, buttonName1, buttonName2;

  popUpBox(
      {Key? key,
      required this.hintText,
      required this.onTaskSave,
      required this.textController,
      required this.buttonName1,
      required this.buttonName2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade300,
      content: Container(
        height: 125,
        decoration: const BoxDecoration(),
        child: Column(children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey.shade500),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonCreated(
                  label: buttonName1,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(
                width: 10,
              ),
              ButtonCreated(
                label: buttonName2,
                onPressed: onTaskSave,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
