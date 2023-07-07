import 'package:flutter/material.dart';

class EmptyBlock extends StatelessWidget {
  const EmptyBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white.withOpacity(0.03),
        ),
      ),
      child: const Icon(
        Icons.add_rounded,
        size: 40,
        color: Colors.white38,
      ),
    );
  }
}
