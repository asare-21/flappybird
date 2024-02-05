import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  static const id = "gameover";
  final FlappyBirdGame game;
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.gameOver),
            ElevatedButton(onPressed: onRestart, child: const Text("Restart"))
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove("gameover");
    game.resumeEngine();
  }
}
