import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  final Widget child; // ----- 1
  final Function() onTap; // ----- 2
  const Btn({
    super.key,
    required this.child, // ----- 3
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          color: const Color(0xffED7738),
          child: child,
        ),
      ),
    );
  }
}
