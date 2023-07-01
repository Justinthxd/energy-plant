import 'package:flutter/material.dart';

class EmptyBlock extends StatelessWidget {
  const EmptyBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: const Icon(
        Icons.add_rounded,
        size: 40,
        color: Colors.white10,
      ),
    );
  }
}
