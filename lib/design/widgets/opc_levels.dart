import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class opcLevels extends StatelessWidget {
  final String push;
  final String text;
  final IconData icon;
  const opcLevels({
    Key? key,
    required this.push,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Row(children: [
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            context.goNamed(push);
          },
          icon: Icon(
            icon,
            size: 50,
            color: Colors.white54,
          ),
        ),
        const SizedBox(width: 10),
      ]),
    );
  }
}
