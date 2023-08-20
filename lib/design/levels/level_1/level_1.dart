import 'package:energy_builder/design/bloc/level_bloc/level_bloc.dart';
import 'package:energy_builder/data/dictionary/dictionary.dart';
import 'package:energy_builder/design/widgets/panels/panel.dart';
import 'package:flutter/material.dart';

import 'package:energy_builder/data/constants/constants.dart';
import 'package:energy_builder/design/widgets/plant/square.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Level1 extends StatefulWidget {
  const Level1({
    Key? key,
  }) : super(key: key);

  @override
  State<Level1> createState() => _Level1State();
}

class _Level1State extends State<Level1> {
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
            return Center(
              child: Row(
                children: [
                  const SizedBox(width: 100),
                  IconButton(
                    onPressed: () {
                      context
                          .read<LevelBloc>()
                          .add(LevelLoadedEvent(levels[1]));
                      context.pushNamed('/level2');
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Level Finished',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white30,
                    ),
                  ),
                ],
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
        const Panel(title: 'Level 1'),
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
