import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final Color? color;

  const Btn({super.key, required this.child, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          color: color ?? const Color(0xffED7738),
          child: child,
        ),
      ),
    );
  }
}
