import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key, required this.game});
  final FlappyBirdGame game;
  static const id = "mainMenu";

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          game.overlays.remove("mainMenu");
          game.resumeEngine();
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
