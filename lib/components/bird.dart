import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/bird_movement.dart';
import 'package:flappybird/game/flappy_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame> {
  @override
  FutureOr<void> onLoad() async {
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);

    size = Vector2(50, 40);
    current = BirdMovement.mid;
    sprites = {
      BirdMovement.up: birdUpFlap,
      BirdMovement.mid: birdMidFlap,
      BirdMovement.down: birdDownFlap,
    };


  // Place sprite in the middle of the screen
    position = Vector2(10, gameRef.size.y / 2 - size.y / 2);
  }
}
