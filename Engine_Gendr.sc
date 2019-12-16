// CroneEngine_Gendr
// simple Xenakis Gendy

// Inherit methods from CroneEngine
Engine_Gendr : CroneEngine {
	// Define a getter for the synth variable
	var <synth;

	// Define a class method when an object is created
	*new { arg context, doneCallback;
		// Return the object from the superclass (CroneEngine) .new method
		^super.new(context, doneCallback);
	}
	// Rather than defining a SynthDef, use a shorthand to allocate a function and send it to the engine to play
	// Defined as an empty method in CroneEngine
	// https://github.com/monome/norns/blob/master/sc/core/CroneEngine.sc#L31
	alloc {
		// Define the synth variable, whichis a function
		synth = {
			// define arguments to the function
			arg
				low=0.1,
				band=0.0,
				high=0.0,
				notch=0.0,
				peak=0.0,
				out=0,
				gate=0,
				fadeTime=0.1,
				amp=0.2,
				pan=0,
			    amp_dist=6,
				dur_dist=6,
				ad_param=1.0,
				dd_param=1.0,
				hz_min=440,
				hz_max=660,
				amp_scale= 0.5,
				dur_scale=0.5,
				init_cp=12,
				osc_hz=10,
				mod_osc=0.0,
				mod_adc=0.0,
				svf_hz=880,
				svf_res=0.0,
				svf_lp=1,
				svf_bp=0,
				svf_hp=0,
				svf_notch=0,
				svf_peak=0;
			// initialize variables
			var sig, adc, osc, gen, snd, env;
			// the instrument stuff
				env = EnvGen.ar(Env.asr(attackTime:fadeTime, releaseTime:fadeTime), gate);
				adc = SoundIn.ar(0);
				osc = Dust.ar(osc_hz);
				ad_param = K2A.ar(ad_param) + (adc * mod_adc) + (osc * mod_osc);
				snd = Gendy2.ar(amp_dist, dur_dist, ad_param, dd_param,hz_min, hz_max, amp_scale, dur_scale, init_cp);
				snd = SVF.ar(snd, svf_hz, svf_res, svf_lp, svf_bp, svf_hp, svf_notch, svf_peak);
			// Create an output object with two copies,
			// passing the Lag'd amp and frequency as args
			Out.ar(out, Pan2.ar(snd * env * amp, pan).dup);
			//Out.ar(out, (SinOsc.ar(hz_) * amp_).dup);
		// Send the synth function to the engine as a UGen graph.
		// It seems like when an Engine is loaded it is passed an AudioContext
		// that is used to define audio routing stuff (Busses and Groups in SC parlance)
		// These methods are defined in
		// https://github.com/monome/norns/blob/master/sc/core/CroneAudioContext.sc
		// pass the CroneAudioContext method "out_b" as the value to the \out argument
		// pass the CroneAudioContext method "xg" as the value to the target.
		}.play(args: [\out, context.out_b], target: context.xg);

		// Export argument symbols as modulatable paramaters
		// This could be extended to control the Lag time as additional params
		this.addCommand("osc_hz", "f", { arg msg;
			synth.set(\osc_hz, msg[1]);
		});

		this.addCommand("amp", "f", { arg msg;
			synth.set(\amp, msg[1]);
		});

		this.addCommand("pan", "f", { arg msg;
			synth.set(\pan, msg[1]);
		});

		this.addCommand("gate", "f", { arg msg;
			synth.set(\gate, msg[1]);
		});

		this.addCommand("fadeTime", "f", { arg msg;
			synth.set(\fadeTime, msg[1]);
		});

		this.addCommand("hz_min", "f", { arg msg;
			synth.set(\hz_min, msg[1]);
		});

		this.addCommand("hz_max", "f", { arg msg;
			synth.set(\hz_max, msg[1]);
		});

		this.addCommand("amp_dist", "f", { arg msg;
			synth.set(\amp_dist, msg[1]);
		});

		this.addCommand("dur_dist", "f", { arg msg;
			synth.set(\dur_dist, msg[1]);
		});

		this.addCommand("init_cp", "f", { arg msg;
			synth.set(\init_cp, msg[1]);
		});

		this.addCommand("amp_scale", "f", { arg msg;
			synth.set(\amp_scale, msg[1]);
		});

		this.addCommand("dur_scale", "f", { arg msg;
			synth.set(\dur_scale, msg[1]);
		});

		this.addCommand("mod_osc", "f", { arg msg;
			synth.set(\mod_osc, msg[1]);
		});

		this.addCommand("mod_adc", "f", { arg msg;
			synth.set(\mod_adc, msg[1]);
		});

		this.addCommand("svf_hz", "f", { arg msg;
			synth.set(\svf_hz, msg[1]);
		});

		this.addCommand("svf_res", "f", { arg msg;
			synth.set(\svf_res, msg[1]);
		});

		this.addCommand("svf_lp", "f", { arg msg;
			synth.set(\svf_lp, msg[1]);
		});

		this.addCommand("svf_bp", "f", { arg msg;
			synth.set(\svf_bp, msg[1]);
		});

		this.addCommand("svf_hp", "f", { arg msg;
			synth.set(\svf_hp, msg[1]);
		});

		this.addCommand("svf_notch", "f", { arg msg;
			synth.set(\svf_notch, msg[1]);
		});

		this.addCommand("svf_peak", "f", { arg msg;
			synth.set(\svf_peak, msg[1]);
		});

		this.addCommand("ad_param", "f", { arg msg;
			synth.set(\ad_param, msg[1]);
		});

		this.addCommand("dd_param", "f", { arg msg;
			synth.set(\dd_param, msg[1]);
		});

	}
	// define a function that is called when the synth is shut down
	free {
		synth.free;
	}
}
