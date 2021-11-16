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
}
