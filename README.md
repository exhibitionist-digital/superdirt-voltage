<img src="https://cdn.sanity.io/images/os5aqg3v/production/1df428507bbab5a032dcb43701e80b4e9aeb29f5-2048x1475.jpg?auto=format" width="500" />

# SuperDirt Voltage

A small set of SuperDirt synths and Tidal helpers to control modular synths. No MIDI required!

### Pitch, with octave quantisation

```
-- change notes per octave on each cycle
d1 $ pitch "0 10 8 1" # octave "<12 31 8>" # x 0
```

`pitch` allows a pattern of note values. `octave` sets the amount of notes per octave. The pitch and scale values will be converted to `1v/octave`. Both `pitch` and `octave` can be sequenced for some microtonal madness...

`glide` accepts a strengh (in semitones, relative to scale), a rate (in step length).

```
-- glide to pitch
d1 $ pitch "0 10 8 1" # scale "<12 31 8>" # x 0 # glide 12 0.5
```



### Gate

```
-- sequence gate inputs
d2 $ gate "0 1 0 0 1 1 1" # x 1
```

`gate` will take a 0/1 pattern and return +5v signals for the `1` values. Use `-1` if you need a -5v.

### Voltage automation

```
-- create stepped automation
d3 $ volt "1 0.2 0.5 -0.2" # x 2
```

`volt` will allow you to sequence voltages however you like.

### AR (Attack + Release)

```
-- create ar
d4 $ trig "1 ~ 1 1" # ar 0 0.5 # x 3
```

```
-- patternise adsr
d5 $ trig "1 ~ 1 1" # ar (range 0.1 1 sine) "<0 0.4>" # x 4
```

`trig` will create a trigger sequence, `ar` will generate a new envelope for each trigger. Both of these can be sequenced.

In the second example, the attack time would grow for each triggered envelope over course of the cycle.

### Clock

```
-- clock cv output
d6 $ clock # x 5
```

`clock` will output a clock cv, which matches the bpm of your tidal project. You can `slow` / `fast` this as well.

---

### How to use

**These require a DC-coupled sound card.**

Add the `voltage.scd` synths to your active SuperDirt synth definitions.

Evaluate the `voltage.tidal` definitions after starting Tidal. These can also be added to your Tidal startup file.

In the above examples, `x` maps to a channel on your audio card. If you have an 8 output audio card, the `x` will likely be 0-7. If you are using an aggregate device, please refer to your Audio settings.

---

### Feedback and/or additions?

If you are actually using this, please join the community here and let me know: https://club.tidalcycles.org/t/using-tidal-to-control-modular-synths-with-cv/863
