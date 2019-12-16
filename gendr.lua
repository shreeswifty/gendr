-- gendr
engine.name = "Gendr"

local cs = require 'controlspec'

local gendr = {}

  
  function init()
    -- add some params for arcify to tap into
      params:add {
        type = "control",
        id = "init_cp",
        name = "Control Points",
        controlspec = controlspec.new(1, 20, "lin", 0, 12),
        action = function(value)
            engine.init_cp(value)
            redraw()
        end
    }
    
              params:add {
        type = "control",
        id = "osc_hz",
        name = "Osc Hz",
        controlspec = controlspec.new(0.01, 100, "exp", 10, 100),
        action = function(value)
            engine.osc_hz(value)
            redraw()
        end
    }
    
    params:add {
        type = "control",
        id = "hz_min",
        name = "Min Frequency",
        controlspec = controlspec.new(1, 8000, "lin", 10, 220),
        action = function(value)
            engine.hz_min(value)
            redraw()
        end
    }
    
     params:add {
        type = "control",
        id = "hz_max",
        name = "Max Frequency",
        controlspec = controlspec.new(1, 8000, "lin", 10, 220),
        action = function(value)
            engine.hz_max(value)
            redraw()
        end
    }
         params:add {
        type = "control",
        id = "gate",
        name = "Gate",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.gate(value)
            redraw()
        end
    }
    
          params:add {
        type = "control",
        id = "amp",
        name = "Amp",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.amp(value)
            redraw()
        end
    }
    
          params:add {
        type = "control",
        id = "dur_dist",
        name = "Dur Dist",
        controlspec = controlspec.new(0, 6, "lin", 0, 1),
        action = function(value)
            engine.dur_dist(value)
            redraw()
        end
    }
    
          params:add {
        type = "control",
        id = "dur_scale",
        name = "Dur Scale",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.dur_scale(value)
            redraw()
        end
    }
    
           params:add {
        type = "control",
        id = "amp_dist",
        name = "Amp Dist",
        controlspec = controlspec.new(0, 6, "lin", 0, 1),
        action = function(value)
            engine.amp_dist(value)
            redraw()
        end
    }
    
          params:add {
        type = "control",
        id = "amp_scale",
        name = "Amp Scale",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.amp_scale(value)
            redraw()
        end
    }
    
            params:add {
        type = "control",
        id = "svf_hz",
        name = "Filter Freq",
        controlspec = controlspec.new(0, 8000, "lin", 10, 220),
        action = function(value)
            engine.svf_hz(value)
            redraw()
        end
    }
    
             params:add {
        type = "control",
        id = "svf_res",
        name = "Filter Res",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.svf_res(value)
            redraw()
        end
    }
    
            params:add {
        type = "control",
        id = "mod_osc",
        name = "Modulation Osc",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.mod_osc(value)
            redraw()
        end
    }
    
              params:add {
        type = "control",
        id = "mod_adc",
        name = "Modulation Input",
        controlspec = controlspec.new(0, 0, "lin", 0, 1),
        action = function(value)
            engine.mod_adc(value)
            redraw()
        end
    }
    
                 params:add {
        type = "control",
        id = "ad_param",
        name = "ad_param",
        controlspec = controlspec.new(0.0001, 1, "lin", 0, 1),
        action = function(value)
            engine.ad_param(value)
            redraw()
        end
    }
    
                 params:add {
        type = "control",
        id = "dd_param",
        name = "dd_param",
        controlspec = controlspec.new(0.0001, 1, "lin", 0, 1),
        action = function(value)
            engine.dd_param(value)
            redraw()
        end
    }
    
                 params:add {
        type = "control",
        id = "svf_lp",
        name = "Low Pass",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.svf_lp(value)
            redraw()
        end
    }
    
                 params:add {
        type = "control",
        id = "svf_hp",
        name = "high Pass",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.svf_hp(value)
            redraw()
        end
    }
    
                 params:add {
        type = "control",
        id = "svf_bp",
        name = "Bandpass",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.svf_bp(value)
            redraw()
        end
    }
    
                 params:add {
        type = "control",
        id = "svf_notch",
        name = "Notch",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.svf_notch(value)
            redraw()
        end
    }
    
                 params:add {
        type = "control",
        id = "svf_peak",
        name = "Filter Peak",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.svf_peak(value)
            redraw()
        end
    }
    
                  params:add {
        type = "control",
        id = "fadeTime",
        name = "Fade Time",
        controlspec = controlspec.new(0, 1, "lin", 0, 1),
        action = function(value)
            engine.fadeTime(value)
            redraw()
        end
    }
 
end

return gendr





