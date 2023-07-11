// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:energy_builder/data/constants/constants.dart';

import '../widgets/home_menu_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: -60,
            left: -60,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 159, 5).withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -100,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 159, 5).withOpacity(0.05),
                shape: BoxShape.circle,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
          SizedBox(
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                const Icon(
                  Icons.bolt,
                  size: 150,
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
                GestureDetector(
                  onTap: () => context.pushNamed('/levels'),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 120,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (var i = 0; i < 4; i++)
                        MenuButton(
                          icon: icons[i],
                          index: i,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
