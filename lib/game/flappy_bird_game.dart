import 'package:flame/game.dart';
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/ground.dart';

class FlappyBirdGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground()]);
  }
}
