import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappybird/game/assets.dart';
import 'package:flappybird/game/bird_movement.dart';
import 'package:flappybird/game/configuration.dart';
import 'package:flappybird/game/flappy_bird_game.dart';
import 'package:flutter/widgets.dart';

class Bird extends SpriteGroupComponent<BirdMovement>
    with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
  Bird();

  int score = 0;

  @override
  FutureOr<void> onLoad() async {
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    final birdMidFlap = await gameRef.loadSprite(Assets.birdMidFlap);
    add(CircleHitbox()); // collision detection
    size = Vector2(50, 40);
    current = BirdMovement.down;
    sprites = {
      BirdMovement.up: birdUpFlap,
      BirdMovement.mid: birdMidFlap,
      BirdMovement.down: birdDownFlap,
    };

    // Place sprite in the middle of the screen
    position = Vector2(10, gameRef.size.y / 2 - size.y / 2);
  }

  void fly() {
    add(MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(
        duration: 0.2,
        curve: Curves.decelerate,
      ),
      onComplete: () => current = BirdMovement.down,
    ));

    current = BirdMovement.up;
  }

  @override
  void update(double dt) {
    position.y += Config.birdVelocity * dt;

    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    gameOver();
    debugPrint("Collision detected");
  }

  void gameOver() {
    gameRef.pauseEngine();
    gameRef.overlays.add("gameover");
    game.isHit = true;
  }

  void reset() {
    position = Vector2(10, gameRef.size.y / 2 - size.y / 2);
  }
}
