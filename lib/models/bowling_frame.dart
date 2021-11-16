class BowlingFrame {
  int pins = 10; // only ever 10 pins in a frame
  List<int> bowls = []; // 0-3 bowls

  void knockDownPins(int pinsHit) {
    if (pinsHit >= pins) {
      bowls = [...bowls, pins];
      pins = 10;
    } else {
      bowls = [...bowls, pinsHit];
      pins = pins - pinsHit;
    }
  }

  /// determins frame scored a spare
  bool get isSpare {
    if (bowls.length < 2) return false;
    if (bowls[0] + bowls[1] == 10) return true;
    return false;
  }

  /// determines if frames scored a strike
  bool get isStrike {
    if (bowls.length == 0) return false;
    return bowls[0] == 10;
  }

  int get numOfBowls {
    return bowls.length;
  }
}
