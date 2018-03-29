# Boundless Take Home Test - Scrabble

![Scrabble](./scrabble.jpg)

[Scrabble](https://en.wikipedia.org/wiki/Scrabble) is a word game where players
compete by creating words with tiles. Each tile contains a letter and a point
value for that letter. In this exercise we will write an application which can
find the first move in a game of Scrabble.

## Rules

Our application will use:

1. 7 letters that it obtains from the user via command line interface
2. A file that contains the list of letters and the point value for each letter
3. A dictionary that contains the valid words in English

Using these, it will calculate and output the highest point word that can be
played with the given letters. Point value for a word is calculated by summing
up the point values of the letters used in the word.

### Blank Tile

Scrabble also has a blank tile. Its point value is zero but it can be used as a
substitute for any letter while constructing words. Our application needs to be
able to use the blank tile when needed while finding the highest point word.

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

Here are some examples:

```
> bin/scrabble ARPNNLA
PLANAR - 8

> bin/scrabble CREB_AL
BLAZER - 16

> bin/scrabble YPOBINX
BOXY - 16
PIXY - 16
POXY - 16
```

## What are we looking for?

1. Well-factored code: We will not evaluate your solution as a PASS or FAIL
   based on the correctness of its output. Readability, maintainability and
   fundamental concepts like single responsibility are important for us.
2. Intentional decisions: You probably do not have time to build the most
   performant solution but it's important to be aware of performance and runtime
   characteristics of your solution. You can update this file with notes about
   fundamental trade-offs you made while developing your solution.
3. Handling invalid input and error conditions: Make sure to handle important
   error conditions with helpful messages for the user about how to recover from
   these errors and use your application.
4. Tests that exercise the critical branching logic: You can extend the test
   files under `./spec` and you can run the tests with `rake spec` command.
5. Clear instructions: Make sure to update this file with the instructions about
   how to setup and run your application (if any).
6. Extensibility: In your interview loop we will do a code review with you where
   we talk about your solution and decisions. We will also talk about how to add
   a new feature to your solution.

## Questions

If you have any questions about this problem or about your interview process
reach out to: serdar@boundless.co
