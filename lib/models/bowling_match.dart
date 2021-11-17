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

  BowlingFrame get currentFrame {
    return frames[frameIndex];
  }

  bool get canRoll {
    if (frameIndex < 10) return true;
    return false;
  }

  bool get getsExtraBall {
    return isLastFrame && (currentFrame.isSpare || currentFrame.isStrike);
  }

  bool get isLastFrame {
    return frameIndex == 9;
  }

  void stepThroughFrame(BowlingFrame frame) {
    // will stop frameIndex from incrementing early on the last frame and allow third ball
    if (getsExtraBall && frame.bowls.length < 3) {
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
      if (frame.isStrike) {
        _score += makeStrikeScore(_rollIndex);
        _rollIndex++;
        continue;
      }

      if (frame.isSpare) {
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
