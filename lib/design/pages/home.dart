import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 24, 27, 35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.bolt,
              size: 120,
              color: Color.fromARGB(255, 4, 202, 11),
            ),
            const SizedBox(height: 20),
            const Text(
              'Energy Builder',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black54,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            // create a good start button
            ElevatedButton(
              onPressed: () {
                context.go('/levelOpc');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 2, 100, 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Start',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
