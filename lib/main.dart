import 'package:flame/game.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
  ));
}
