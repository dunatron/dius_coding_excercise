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
    // return frames.fold(0, (int acc, frame) => acc + frame.bowls.sum);
    return frames.fold(0, (int acc, frame) {
      int frameScore = frame.bowls.sum;
      // hmm the only problem here is that for a spare or strike we actually need balls from the next frame.
      // and actually if there is a series of strikes the balls needed could be two frames away...
      // not to mention that on the last frame the logic to get next frames would make your head spin
      return acc + frameScore;
    });
  }
}
