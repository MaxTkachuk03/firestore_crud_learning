import 'package:flutter/material.dart';

class MyFloatButton extends StatelessWidget {
  const MyFloatButton({super.key, this.onPressed, required this.child});

  final void Function()? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      onPressed: onPressed,
      child: child,
    );
  }
}
