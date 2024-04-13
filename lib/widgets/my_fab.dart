import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      foregroundColor: Colors.white,
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      tooltip: "Click to add habit",
      child: const Icon(Icons.add),
    );
  }
}
