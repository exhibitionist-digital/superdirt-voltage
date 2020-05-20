# SuperDirt Voltage

A small set of SuperDirt synths and Tidal helpers to control modular synths. No MIDI required!

### Pitch, with scale quantisation

```
-- change notes per octave on each cycle
d1 $ pitch "0 10 8 1" # scale "<12 31 8>" # x 0
```

`pitch` allows a pattern of note values. `scale` sets the amount of notes per octave. The pitch and scale values will be converted to `1v/octave`. Both `pitch` and `scale` can be paternised for some microtonal madness...

### Gate

```
-- patternise gate inputs
d2 $ gate "0 1 0 0 1 1 1" # x 1
```

`gate` will take a 0/1 pattern and return +5v signals for the `1` values. Use `-1` if you need a -5v.

### Voltage automation

```
-- create stepped automation
d3 $ volt "1 0.2 0.5 -0.2" # x 2
```

`volt` will allow you to patternise voltages however you like.

### ADSR

```
-- create adsr
d4 $ adsr 0.001 0.2 0.25 1 # x 3
```

![envelope](https://www.dropbox.com/s/rmsxurs03brmsug/envelope.png?raw=1)

```
-- patternise adsr
d5 $ adsr "<0.05 0.9>" "<0 0.4>" 1 1 # x 4
```

![patternised envelopes](https://www.dropbox.com/s/qd6kxn22mexpyhq/pattterned-envelopes.png?raw=1)

`adsr` will generate a new envelope per cycle.

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
