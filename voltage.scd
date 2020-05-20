(
  SynthDef(\pitch, { | out, n, channel, stepsPerOctave = 12 |
    n = n + (stepsPerOctave / 12);
    n = (n + (n / stepsPerOctave) * (1 / (stepsPerOctave + 1)) / 10);
    OffsetOut.ar(channel, DC.ar(n))
  }).add
);

(
  SynthDef(\voltage, { | out, channel, rate |
    rate = rate * 5;
    OffsetOut.ar(channel, DC.ar(rate));
  }).add
);

(
  SynthDef(\adsr, { | out, channel, attack = 0.1, decay = 0.5, sustain = 0.5, release = 0.5, begin, end |
    var env = Env.adsr(attack, decay, sustain, release);
    var phase = Line.ar(begin, end, sustain);
    OffsetOut.ar(channel, IEnvGen.ar(env, phase));
  }).add
);
