(
  (
    SynthDef (\pitch, { | out,
      n,
      channel,
      stepsPerOctave = 12,
      rate = 1,
      delta,
      begin,
      end,
      portamento = 0 |
      var slew, env, phase;
      n = n + (stepsPerOctave / 12);
      n = (n + (n / stepsPerOctave) * (1 / (stepsPerOctave + 1)) / 10);
      slew = (portamento);
      slew = (slew + (slew / stepsPerOctave) * (1 / (stepsPerOctave + 1)) / 10);
      env = Env ([n, n + slew], [delta / rate]);
      phase = Line.ar (begin, end, delta / rate);
      OffsetOut.ar (channel, IEnvGen.ar (env, phase));
    }).add
  );

  (
    SynthDef (\gate, { | out,
      channel,
      n |
      n = n * 5;
      OffsetOut.ar (channel, DC.ar (n));
    }).add
  );

  (
    SynthDef (\voltage, { | out,
      channel,
      n,
      rate = 1,
      delta,
      begin,
      end,
      portamento = 0 |
      var slew, env, phase;
      n = n * 5;
      slew = (portamento);
      rate = rate;
      env = Env ([n, n + slew], [delta / rate]);
      phase = Line.ar (begin, end, delta / rate);
      OffsetOut.ar (channel, IEnvGen.ar (env, phase));
    }).add
  );

  (
    SynthDef (\ar, { | out,
      channel,
      attack = 0.01,
      decay = 0.25,
      sustain = 0.25,
      release = 0.25,
      begin,
      end |
      var env, phase;
      env = Env.adsr (attack, decay, sustain, release);
      phase = Line.ar (begin, end, sustain);
      OffsetOut.ar (channel, IEnvGen.ar (env, phase));
    }).add
  );

)
