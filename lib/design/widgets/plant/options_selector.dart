import 'dart:ui';

import 'package:flutter/material.dart';

optionsSelector() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _option(
              Icons.monetization_on_rounded,
              const Color.fromARGB(255, 66, 203, 70),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _option(IconData icon, Color color) {
  return IconButton(
    onPressed: () {},
    icon: Icon(
      icon,
      size: 40,
      color: color,
    ),
  );
}
