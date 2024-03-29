import 'package:flame/game.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/screens/game_over_screen.dart';
import 'package:flappybird/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      "mainMenu": (context, _) => MainMenuScreen(game: game),
      "gameover": (context, _) => GameOverScreen(
            game: game,
          ),
    },
  ));
}
