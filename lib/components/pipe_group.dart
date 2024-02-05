import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird/components/pipe.dart';
import 'package:flappybird/game/configuration.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flappybird/game/pipe_position.dart';
import 'package:flutter/material.dart';

class PipeGroud extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroud();
  final _random = Random();
  @override
  FutureOr<void> onLoad() async {
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + _random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Pipe(PipePosition.top, centerY - spacing / 2),
      Pipe(PipePosition.bottom, heightMinusGround - (centerY + spacing / 2)),
    ]);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (position.x < -10) {
      removeFromParent();
      debugPrint("Removed");
    }
    position.x -= Config.gameSpeed * dt;
    super.update(dt);
  }
}
