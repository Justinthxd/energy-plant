import 'package:energy_builder/bloc/level_bloc/level_bloc.dart';
import 'package:energy_builder/data/constants/constants.dart';
import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/design/widgets/panels/panel.dart';
import 'package:energy_builder/design/widgets/plant/square.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Level2 extends StatefulWidget {
  const Level2({super.key});

  @override
  State<Level2> createState() => _Level2State();
}

class _Level2State extends State<Level2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocConsumer<LevelBloc, LevelState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LevelLoadedState) {
            return _levelBody(size);
          } else if (state is LevelFinishedState) {
            return const Center(
              child: Text(
                'Level Finished',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white30,
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Column _levelBody(Size size) {
    final state = context.read<LevelBloc>().state as LevelLoadedState;
    return Column(
      children: [
        const SizedBox(height: 50),
        const Panel(title: 'Level 2'),
        Expanded(
          child: Center(
            child: Container(
              height: size.height * 0.5,
              decoration: const BoxDecoration(
                  // color: Colors.purple.withOpacity(0.1),
                  ),
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getColumns(state.level.plants.length),
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: state.level.plants.length,
                itemBuilder: (context, index) {
                  return Square(id: index, level: state.level);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
