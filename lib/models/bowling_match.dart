import './player.dart';
import './bowling_frame.dart';

class BowlingMatch {
  Player player;
  List<BowlingFrame> frames = [];
  BowlingMatch(this.player);

  /// roll method for the match to roll pins
  void roll(int pinsHit) {}

  /// method to return the current match score
  get score {
    return 0;
  }
}
