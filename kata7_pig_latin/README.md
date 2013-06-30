# Pig Latin Translator

## Rules

1. Words that start with a vowel (A, E, I, O, U) simply have "WAY" appended to the end of the word.

> "egg" → "eggway"
> "inbox" → "inboxway"
> "eight" → "eightway"

2. Words that start with a consonant have all consonant letters up to the first vowel moved to the end of the word (as opposed to just the first consonant letter), and "AY" is appended. ('Y' is counted as a vowel in this context)

> "happy" → "appyhay"
> "duck" → "uckday"
> "glove" → "oveglay"

## Special cases

After implementing your solution, cross check for following special case features:

* Ensures proper capitalization
* Correct upper case and lower case formatting
* Correctly translates "qu" (e.g., ietquay instead of uietqay)
* Differentiates between "Y" as vowel and "Y" as consonant (e.g. yellow = elloyay and style = ylestay) — (except for a very few exceptions)
* Correctly translates contractions
* Hyphenated words are treated as two words
* Words may consist of alphabetic characters only (A-Z and a-z)
* All punctuation, numerals, symbols and whitespace are not modified

[Source: English to Pig Latin translator](http://www.snowcrest.net/donnelly/piglatin.html)
