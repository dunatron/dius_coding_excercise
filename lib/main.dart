import './models/player.dart';
import './models/bowling_match.dart';

void main() {
  Player player = Player("Dunatron");
  BowlingMatch match = BowlingMatch(player);

  int i = 1;
  while (i <= 40) {
    match.roll(9);
    print("Game score: ${match.score}");
    ++i;
  }
}
