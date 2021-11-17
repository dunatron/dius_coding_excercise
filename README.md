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

## Tools

I was a little unsure of what scores should be so I found this bowling calculator
https://www.bowlinggenius.com/

## Step Notes

- rolls is basically how you determine a frames score as for spares and strikes we must have future balls.
- `stepThroughFrame` needed to be altered as the logic is a bit different on the last frame as they may get an extra ball
