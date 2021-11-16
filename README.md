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

- At this point we have a failing test because score returns a hard coded 0
- We will try to knock down pins on rolls now
- frames is actually always 10 and so frames can be pre init
- the match needs a way of determing what frame we are on to record the roll into
- A frame while not able to calculate itself, can determine if it is a strike or spare
- at this point there is a test which fails because spares and strikes are not considered
