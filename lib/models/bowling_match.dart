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
    if (frameIndex == 9) {
      int numOfBowls = frame.bowls.length;
      if (numOfBowls >= 2) {
        if (frame.isSpare || frame.isStrike) {
          if (numOfBowls >= 3) {
            frameIndex++;
          }
        } else {
          frameIndex++;
        }
      }
      return;
    }
    if (frame.isStrike || frame.isSpare || frame.numOfBowls >= 2) {
      frameIndex++;
    }
  }

  /// method to return the current match score
  get score {
    int _score = 0;
    int _rollIndex = 0;
    final _framesWithBowls =
        frames.where((frame) => frame.bowls.length > 0).toList();
    // for each frame work out its score
    for (int i = 0; i < _framesWithBowls.length; i++) {
      var frame = _framesWithBowls[i];
      // int pinScore = frame.pinScore;
      if (frame.isStrike) {
        _score += makeStrikeScore(_rollIndex);
        _rollIndex++;
        continue;
      }

      if (frame.isSpare) {
        // we will need to step through all rolls and determine what rollIndex the frame roll is from
        // that way we can get next rolls to calculate the frame
        _score += makeSpareScore(_rollIndex);
      } else {
        _score += frame.pinScore;
      }
      // after stepping through a frame with two bowls increment the index by 2
      _rollIndex += 2;
    }
    return _score;
  }

  /// gets a spare score by adding 10 + the value 2 balls away i.e next frames first ball
  int makeSpareScore(int rollIndex) {
    // we dont have all the balls needed to calculate this so i think nothing gets added...
    if (rollIndex + 2 >= rolls.length) {
      return 0;
    }
    return 10 + rolls[rollIndex + 2];
  }

  /// gets strike score by adding 10 + the values for the next 2 balls
  int makeStrikeScore(int rollIndex) {
    if (rollIndex + 2 >= rolls.length) {
      return 0;
    }
    return 10 + rolls[rollIndex + 1] + rolls[rollIndex + 2];
  }
}
