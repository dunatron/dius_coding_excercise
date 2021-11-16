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

  List<int> get rolls {
    return frames.fold([], (acc, frame) => [...acc, ...frame.bowls]);
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
    int _score = 0;
    final _framesWithBowls =
        frames.where((frame) => frame.bowls.length > 0).toList();
    // for each frame work out its score
    for (int i = 0; i < _framesWithBowls.length; i++) {
      var frame = _framesWithBowls[i];
      int pinScore = frame.bowls[0] + frame.bowls[1];
      if (frame.isSpare) {
        // we will need to step through all rolls and determine what rollIndex the frame roll is from
        // that way we can get next rolls to calculate the frame
        // _score = 10 +
      }
      _score += pinScore;
    }
    return _score;
  }
}
