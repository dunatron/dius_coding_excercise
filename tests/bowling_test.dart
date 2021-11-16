import 'package:test/test.dart';

import '../lib/models/bowling_match.dart';
import '../lib/models/player.dart';

void main() {
  final player = Player("Dunatron");
  // easy test to pass...
  test('All gutter balls give a score of 0', () {
    final match = BowlingMatch(player);
    int i = 1;
    while (i <= 20) {
      match.roll(0);
      ++i;
    }
    expect(match.score, equals(0));
  });

  // next we will write a test where no strikes or spares are recorded
  test('Game with no strikes or spares', () {
    final match = BowlingMatch(player);
    int i = 1;
    while (i <= 20) {
      match.roll(4);
      ++i;
    }
    expect(match.score, equals(80));
  });

  test('Game with no strikes or spares with rolls overloaded', () {
    final match = BowlingMatch(player);
    int i = 1;
    while (i <= 50) {
      match.roll(4);
      ++i;
    }
    expect(match.score, equals(80));
  });

  // https://www.quora.com/What-is-the-highest-possible-score-in-bowling-if-you-never-get-a-strike
  test(
      'Test the highest possibe value without a strike using 9s should equal 190',
      () {
    final match = BowlingMatch(player);
    int i = 1;
    while (i <= 50) {
      match.roll(9);
      ++i;
    }
    expect(match.score, equals(190));
  });
}
