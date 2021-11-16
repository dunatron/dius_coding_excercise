# Dius Coding Excercise

- The first thing we want to do is think about and understand the problem.
- Then come up with a model and install a testing suite

# Model

## `BowlingMatch`

There are 10 frames in a match

- `Player player`
- `BowlingFrames frames`

```
roll(int pins) - recieves user input for pins hit by a roll
```

```
score() - returns the score of the match
```

## `Player`

## `BowlingFrame`

- `int pins`
- `List bowls`

There are 10 Pins in a frame
each frame can have 1-3 bowls
frames can only calculate there frames by themselves if they did not get all pins
