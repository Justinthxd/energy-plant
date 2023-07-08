import 'package:energy_builder/data/constants/constants.dart';
import 'package:energy_builder/design/provider/provider.dart';
import 'package:energy_builder/design/widgets/levels_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Levels extends StatelessWidget {
  const Levels({super.key});

  @override
  Widget build(BuildContext context) {
    final main = context.watch<MainProvider>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(width: 20),
                Text(
                  'Select Level',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              height: size.height * 0.31,
              decoration: const BoxDecoration(),
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: main.levels.length,
                itemBuilder: (context, index) {
                  return LevelsItem(
                    level: main.levels[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
