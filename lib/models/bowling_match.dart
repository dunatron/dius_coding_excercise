import 'package:collection/collection.dart';

import './player.dart';
import './bowling_frame.dart';

class BowlingMatch {
  Player player;
  int frameIndex = 0;
  final frames = List<BowlingFrame>.generate(10, (i) => BowlingFrame());

  BowlingMatch(this.player);

  /// roll method for the match to roll pins
  void roll(int pinsHit) {
    if (canRoll == false) return;
    final frame = frames[frameIndex];
    frame.knockDownPins(pinsHit);
    // decide if we should move onto the next frame
    stepThroughFrame(frame);
  }

  bool get canRoll {
    if (frameIndex < 10) return true;
    return false;
  }

  void stepThroughFrame(BowlingFrame frame) {
    if (frame.isStrike || frame.isSpare || frame.numOfBowls >= 2) {
      frameIndex++;
    }
  }

  /// method to return the current match score
  get score {
    return frames.fold(0, (int acc, frame) => acc + frame.bowls.sum);
  }
}
