# UTF8HTML

UTF8HTML is NOT a general code converter between UTF-8 and HTML encodings.
UTF8HTML is a text file converter which replaces literal descriptions of UTF-8 special symbols to HTML special symbol codings.

For example, "\xc2\xbd" (1/2 in one character) is replaced with "&amp;frac12;".

```bash
Usage: perl utf8html.pl < text_with_utf8_symbols > text_with_html_symbols
```

Disclaimer: when there is no HTML special symbols corresponding to the UTF-8 literal symbol, the UTF-8 literal code is left as it is.

Since this script is motivated in coverting BioPython XML results from PubMed to more readable and processable text, some hypens and spaces are also converted. We do not convert to HTML hex codes because it is as non-readable as UTF-8 symbols. Therefore, we just leave some literal UTF-8 codes without any change.

Python version will be ready soon.

# Files

```bash
utf8html.pl: converter in Perl
utf8html-table.txt: conversion table (You can update as you like.)
```
NB: The table is tab separated pairs of UTF-8 and HTML symbols. There could be a space character in the second column, which is invisible in a usula editor. Regarding a space symbol, please notice that any kinds of spaces are all converted into a normal space.

# Licence
GPL2.0

# Author
Yutaka Sasaki, Toyota Technological Institute, Naogya, Japan
