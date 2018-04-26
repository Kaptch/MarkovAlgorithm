# Markov algorithm interpreter
## CS203 extra task
### input: file with substitution formulas and init word
### output: prints steps
```shell
usage: <filename> <input word>
substitution file should consist of lines: <left>->[.]<right>
empty word is "//", it can be configured in Main.hs (emptyWord)

usage example:
    > :main test ddddaaaaaaaaa
    ddddaaaaaaaaa -> dddaaaaaaaaa (0)
    dddaaaaaaaaa -> ddaaaaaaaaa (0)
    ddaaaaaaaaa -> daaaaaaaaa (0)
    daaaaaaaaa -> aaaaaaaaa (0)
    aaaaaaaaa -> baaaaaa (1)
    baaaaaa -> bbaaa (1)
    bbaaa -> bbb (1)
    bbb ->. qb (3)
```
