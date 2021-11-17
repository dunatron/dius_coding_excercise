# Dius Coding Excercise

A simple dart programme to record a bowling match score for a player

When a match is created all 10 frames are initialized

when the roll method is called on the match it will add the roll to the frame and then determine if we should move onto the next frame

# Model

## `BowlingMatch`

methods

- roll(int pins): method to knock down pins

- score: static method to get the match score

example usage

```dart
// to create a new bowling match
final player = Player("username");
final match = BowlingMatch();
// to add a roll score to the match
match.roll(int pins);
// to get the score of the match
int _currScore = match.score;
```

## Testing

There is testing included in the `/tests` directory  
from the root of the project run the following  
`dart run test tests`

## Tools

I was a little unsure of what scores should be so I found this bowling calculator
https://www.bowlinggenius.com/
