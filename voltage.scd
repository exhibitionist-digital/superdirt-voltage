(
  (
    SynthDef (\pitch, { | out, n, channel, stepsPerOctave = 12, rate = 1, delta, begin, end, portamento = 0, accelerate = 0 |
      var slew, env, phase;
      n = n + (stepsPerOctave / 12);
      n = (n + (n / stepsPerOctave) * (1 / (stepsPerOctave + 1)) / 10);
      slew = (portamento * accelerate);
      slew = (slew + (slew / stepsPerOctave) * (1 / (stepsPerOctave + 1)) / 10);
      // slew = (slew * accelerate) * accelerate;
      env = Env ([n, n + slew], [delta / rate]);
      phase = Line.ar (begin, end, delta / rate);
      OffsetOut.ar (channel, IEnvGen.ar (env, phase));
    }).add
  );

  (
    SynthDef (\voltage, { | out, channel, n, rate = 1, delta, begin, end, portamento = 0, accelerate = 0 |
      var slew, env, phase;
      n = n * 5;
      slew = (portamento * accelerate);
      env = Env ([n, n + slew], [delta / rate]);
      phase = Line.ar (begin, end, delta / rate);
      OffsetOut.ar (channel, IEnvGen.ar (env, phase));
    }).add
  );

  (
    SynthDef (\adsr, { | out, channel, attack = 0.1, decay = 0.5, sustain = 0.5, release = 0.5, begin, end |
      var env, phase;
      env = Env.adsr (attack, decay, sustain, release);
      phase = Line.ar (begin, end, sustain);
      OffsetOut.ar (channel, IEnvGen.ar (env, phase));
    }).add
  );
)
