import 'package:flame/game.dart';
import 'package:flame/timer.dart';
import 'package:flappybird/components/background.dart';
import 'package:flappybird/components/bird.dart';
import 'package:flappybird/components/ground.dart';
import 'package:flappybird/components/pipe_group.dart';
import 'package:flappybird/game/configuration.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  @override
  Future<void> onLoad() async {
    addAll([Background(), Ground(), bird = Bird(), PipeGroud()]);

    interval.onTick = () => add(PipeGroud());
  }

  @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
    interval.update(dt);
  }
}
