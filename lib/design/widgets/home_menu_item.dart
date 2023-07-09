// ignore: must_be_immutable
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {Key? key, required this.icon, required this.index, required this.notify})
      : super(key: key);

  final IconData icon;
  final int index;
  final bool notify;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            size: 27,
            color: Colors.white70,
          ),
        ),
      ),
      onTap: () async {},
    );
  }
}
