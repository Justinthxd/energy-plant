// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:energy_builder/design/widgets/opc_levels.dart';
import 'package:flutter/material.dart';

class LevelOptions extends StatelessWidget {
  const LevelOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(20, 2, 48, 2),
            Color.fromARGB(132, 9, 49, 1),
            Color.fromARGB(20, 18, 43, 1),
          ])),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              SizedBox(height: 35),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Text(
                  'Select Level',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              opcLevels(
                text: 'Level 01',
                icon: Icons.play_arrow_rounded,
                push: '/level1',
              ),
              SizedBox(height: 10),
              opcLevels(
                push: '',
                text: 'Level 02',
                icon: Icons.play_arrow_rounded,
              ),
              SizedBox(height: 40),
              Text(
                'Comming Soon',
                style: TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
