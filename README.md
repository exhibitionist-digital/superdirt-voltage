<img src="https://cdn.sanity.io/images/os5aqg3v/production/1df428507bbab5a032dcb43701e80b4e9aeb29f5-2048x1475.jpg?auto=format" width="500" />

# SuperDirt Voltage

A small set of SuperDirt synths and Tidal helpers to control modular synths. No MIDI required!

**2023 updates:**

- Added `saw`, `lfo` triggered LFOs
- `amp` now controls the scale of `gate`, `voltage`, `saw`, `ar`, and `lfo`

---

### Pitch, with octave quantisation

```
-- change notes per octave on each cycle
d1 $ pitch "0 10 8 1" # octave "<12 31 8>" # x 1
```

`pitch` allows a pattern of note values. `octave` sets the amount of notes per octave. The pitch and scale values will be converted to `1v/octave`. Both `pitch` and `octave` can be sequenced for some microtonal madness...

`glide` accepts a strengh (in semitones, relative to scale), a rate (in step length).

```
-- glide to pitch
d1 $ pitch "0 10 8 1" # scale "<12 31 8>" # x 1 # glide 12 0.5
```

### Gate

```
-- sequence gate inputs
d2 $ gate "0 1 0 0 1 1 1" # x 2
```

`gate` will take a 0/1 pattern and return +5v signals for the `1` values. Use `-1` if you need a -5v.

### Voltage automation

```
-- create stepped automation
d3 $ volt "1 0.2 0.5 -0.2" # x 3
```

`volt` will allow you to sequence voltages however you like.

### ADSR/AR

```
--- adsr
d4 $ adsr 0 0.2 1 0.2 # x 4
```

There is also just an `ar` helper too, which has a default D and S value.

```
-- create ar
d5 $ struct "t f t t" # ar 0 0.5 # x 5
```

```
-- patternise ar
d5 $ struct "t f t t" # ar (range 0.1 1 sine) "<0 0.4>" # x 5
```

In the above example, the attack time would grow for each triggered envelope over course of the cycle.

### Sine LFO

This will create an sine waveform, the sine will restart with each cycle, which gives a neat synced/trigger effect for modulations.

```
d6 $ lfo 0.5 # x 6
```

### Saw LFO

This will create a sawtooth waveform, the sawtooth will restart with each cycle, which gives a neat synced/trigger effect for modulations.

```
d6 $ saw 0.5 # x 6
```

### Clock

```
-- clock cv output
d6 $ clock # x 6
```

`clock` will output a clock cv, which matches the bpm of your tidal project. You can `slow` / `fast` this as well.

### Amp

Using the `amp` modifier in Tidal Cycles will scale the output of `gate`, `voltage`, `saw`, `ar`, and `lfo`. Awesome for creating more suble modulations.

```
d6 $ saw 0.5 # x 6 # amp 0.3
```

---

### How to use

**These require a DC-coupled sound card.**

Add the `voltage.scd` synths to your active SuperDirt synth definitions.

Evaluate the `voltage.tidal` definitions after starting Tidal. These can also be added to your Tidal startup file.

In the above examples, `x` maps to a channel on your audio card. If you have an 8 output audio card, the `x` will likely be 0-7. If you are using an aggregate device, please refer to your Audio settings.

---

### Feedback and/or additions?

If you are actually using this, please join the community here and let me know: https://club.tidalcycles.org/t/using-tidal-to-control-modular-synths-with-cv/863
