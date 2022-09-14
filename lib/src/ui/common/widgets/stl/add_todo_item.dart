import 'package:flutter/material.dart';

class AddTodoItem extends StatelessWidget {
  const AddTodoItem({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
      ),
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      )
    );
  }
}