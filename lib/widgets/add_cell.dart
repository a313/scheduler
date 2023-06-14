import 'package:flutter/material.dart';

class AddCell extends StatelessWidget {
  const AddCell({
    super.key,
    required this.onTapped,
    required this.title,
  });
  final Function() onTapped;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Row(
        children: [
          IconButton(
              onPressed: onTapped,
              icon: const Icon(
                Icons.add,
                color: Colors.green,
              )),
          Text(title),
        ],
      ),
    );
  }
}
