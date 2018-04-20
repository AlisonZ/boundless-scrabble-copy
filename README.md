# Boundless Take Home Test - Scrabble

![Scrabble](./scrabble.jpg)

[Scrabble](https://en.wikipedia.org/wiki/Scrabble) is a word game where players
compete by creating words with tiles. Each tile contains a letter and a point
value for that letter. In this exercise we will write an application which can
find the first move in a game of Scrabble.

## Play
The game is played from the console and is run through the game.rb. From command line, cd to folder holding the Scrabble game and cd to the lib file. Run $ruby game.rb and the game will begin! Command line instructions walk the user through entering input.

## Decisions

For this game I chose to have 5 classes of Dictionary, LetterPoints, Game, Player and Scoring. I opted to keep the Dictionary and LetterPoints separate so that the Game could be played with different languages which would affect both the dictionary and letter point values. I debated combining the letter points with either Scoring or the Dictionary, but it felt like a distinct entity and I could see a few use cases for wanting to only access the LetterPoints, such as a user wanting to reference the points values to inform their word play. Player, Scoring and Game seemed like fairly straightforward decisions. Future iterations would allow for Player to be expanded to keep track of items such as all_words_played, total_points_scored, game_history etc. Game could also be expanded to keep track of several players at one time, hold an instance of a Tilebag of tiles that is shared by all players throughout the game and so forth. Scoring contains logic for scoring the words once they are deemed valid by the dictionary.

## Room for Improvement
### Permutations:
As can be seen in the code, I used the Ruby .permutation functionality to create all permutations of the letters ranging from 2 letter to all 7 letters. This approach is greedy in regards to efficiency, but solves the problem and is a readable solution. I originally toyed around with the idea of creating anagrams or a system that would match letters to unique numbers. I chose this approach because it works (unlike the anagram idea) and is much less complicated than employing a unique number system.

### Blank Tiles:
The current version of this Scrabble game successfully handles input with one blank tile. I achieved this by creating all permutations for each string with a letter from the alphabet. Admittedly this is not efficient and requires creating permutations for 26 strings. When I was considering expanding this approach to account for two blank tiles it did not seem reasonable from an efficiency perspective. I am curious to hear of other approaches to this problem and will continue to think about how to refactor the code to account for two tiles. An additional point is that the handling of Blank Tiles adds Nil elements to the array of all valid_words. In order to have the program running, I used .compact! on this array to delete any Nil items. This is purely a stop-gap approach to have a working version. Ideally I would find where this is being wrongly generated in the code and fix the problem there.

## Testing
In the spec folder there is a new file game_spec.rb which holds the outline for the tests that I would include for this project. With the time constraints I was unable to write all the tests. The  outline demonstrates what I test for and my approach to testing. Additionally, I have enjoyed working with testing suites that detail the percentage of coverage and the lines that are not accounted for. I usually begin by testing for the major working pieces, as shown in the outline, then I use the % of coverage to inform areas that may be under-tested.

## Rules

Our application will use:

1. 7 letters that it obtains from the user via command line interface
2. A file that contains the list of letters and the point value for each letter
3. A dictionary that contains the valid words in English

Using these, it will calculate and output the highest point word that can be
played with the given letters. Point value for a word is calculated by summing
up the point values of the letters used in the word.

### Blank Tile

Scrabble also has **two** blank tiles. Its point value is zero but it can be
used as a substitute for any letter while constructing words. Our application
needs to be able to use the blank tile when needed while finding the highest
point word.

## Data

You will find 2 files under `./data`:

1. `points.txt`: contains the point value for each letter.
2. `dictionary.txt`: contains the valid words that can be played.

You can use these files in any way you'd like to while building your
application.

## Input

We will run our application via command line by passing 7 letters as a
parameter. We will denote the blank tile with `_`. The expected output of the
application is the highest point word and the point value of the word.

Here are some examples. Your solution should match the output exactly:

```
> bin/scrabble ARPNNLA
PLANAR - 8

> bin/scrabble CREB_AL
BLAZER - 17

> bin/scrabble YPOBINX
BOXY - 16
PIXY - 16
PNYX - 16
POXY - 16

> bin/scrabble istf
FIST - 7
FITS - 7
SIFT - 7
```

## What are we looking for?

1. **Well-factored code:** We will not evaluate your solution as a PASS or FAIL
   based on the correctness of its output. Readability, maintainability and
   fundamental concepts like single responsibility are important for us.
2. **Intentional decisions:** You probably do not have time to build the most
   performant solution but it's important to be aware of performance and runtime
   characteristics of your solution. You can update this file with notes about
   fundamental trade-offs you made while developing your solution.
3. **Handling invalid input and error conditions:** Make sure to handle
   important error conditions with helpful messages for the user about how to
   recover from these errors and use your application.
4. **Tests that exercise the critical branching logic:** You can extend the test
   files under `./spec` and you can run the tests with `rake spec` command.
5. **Clear instructions:** Make sure to update this file with the instructions
   about how to setup and run your application (if any).
6. **Extensibility:** In your interview loop we will do a code review with you
   where we talk about your solution and decisions. We will also talk about how
   to add a new feature to your solution.

Feel free to use any tools, resources, and libraries that will make the solution
faster and more clear. Do not feel yourself forced to reinvent the wheel.

## Submitting your solution

There is no hard time limit on this exercise but we estimate it to take about
four hours. Once you feel like you are complete or once you reach four hours
push your code to this repository and email
[serdar@boundless.co](mailto:serdar@boundless.co).

## Questions

If you have any questions about this problem or about your interview process
reach out to: [serdar@boundless.co](mailto:serdar@boundless.co).
