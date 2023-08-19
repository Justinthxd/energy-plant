// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:energy_builder/bloc/level_bloc/level_bloc.dart';

class Panel extends StatelessWidget {
  const Panel({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  final TextStyle digitStyle = const TextStyle(
    color: Colors.white,
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );

  // ! - change panel design to battery

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LevelBloc, LevelState>(
      builder: (context, state) {
        if (state is LevelLoadedState) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white24,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Divider(
                  height: 5,
                  color: Colors.white.withOpacity(0.03),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(
                      Icons.bolt_rounded,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    Text(
                      '${state.level.currentEnergy}',
                      style: digitStyle,
                    ),
                    Text(
                      '/',
                      style: digitStyle.copyWith(color: Colors.white60),
                    ),
                    Text(
                      '${state.level.targetEnergy}',
                      style: digitStyle.copyWith(
                        fontSize: 19,
                        color: Colors.white60,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.attach_money_rounded,
                      color: Colors.green,
                      size: 25,
                    ),
                    Text(
                      '${state.level.money.round()}',
                      style: digitStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(width: 5),
                    SizedBox(
                      width: 130,
                      child: TweenAnimationBuilder<double>(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        tween: Tween(
                          begin: 0,
                          end: state.level.currentEnergy /
                              state.level.targetEnergy,
                        ),
                        builder: (context, value, _) => LinearProgressIndicator(
                          color: Colors.yellow,
                          backgroundColor: Colors.black26,
                          value: value,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
