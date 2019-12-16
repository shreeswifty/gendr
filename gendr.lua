-- gendr


engine.name = "Gendr"

-- create Arcify class and arcify object
local Arcify = include("lib/arcify")
local arcify = Arcify.new()


local cs = require 'controlspec'

local gendr = {}

function gendr.params()
  -- first set
  params:add{type = "control", id = "init_cp", name = "init_cp",
    controlspec = cs.new(0, 1, "lin", 0, 12, ""), action = engine.init_cp}
  params:add{type = "control", id = "amp_dist", name = "amp_dist",
    controlspec = cs.new(0, 1, "lin", 0, 6, ""), action = engine.amp_dist}
  params:add{type = "control", id = "dur_dist", name = "dur_dist",
    controlspec = cs.new(0, 1, "lin", 0, 6, ""), action = engine.dur_dist}
  params:add{type = "control", id = "mod_osc", name = "mod_osc",
    controlspec = cs.new(0, 1, "lin", 0, 10, ""), action = engine.mod_osc}
  params:add{type = "control", id = "mod_adc", name = "mod_adc",
    controlspec = cs.new(0, 1, "lin", 0, 0, ""), action = engine.mod_adc}

  params:add{type = "control", id = "hz_min", name = "hz_min",
    controlspec = controlspec.new(100, 8000, "exp", 10, 220), ""), action = function(value)
      engine.hz_min(value)
      redraw()
    end}

  params:add{type = "control", id = "hz_max", name = "hz_max",
    controlspec = controlspec.new(100, 8000, "exp", 10, 220), action = engine.hz_max}


  params:add{type = "control", id = "gate", name = "gate",
    controlspec = cs.new(0, 1, "lin", 0, 1, ""), action = engine.gate}

  -- second set
  params:add{type = "control", id = "svf_hz", name = "svf_hz",
    controlspec = cs.new(0, 6, "lin", 0, 0, ""), action = engine.svf_hz}
  params:add{type = "control", id = "svf_res", name = "svf_res",
    controlspec = cs.new(0, 10000, "lin", 0, 8, ""), action = engine.svf_res}
  params:add{type = "control", id = "svf_lp", name = "svf_lp",
    controlspec = cs.new(0, 1, "lin", 0, 0, ""), action = engine.svf_lp}
  params:add{type = "control", id = "svf_hp", name = "svf_hp",
    controlspec = cs.new(0.01, 10, "lin", 0, 0.05, ""), action = engine.svf_hp}
  params:add{type = "control", id = "svf_bp", name = "svf_bp",
    controlspec = cs.new(0, 2, "lin", 0, 0.1, ""), action = engine.svf_bp}
  params:add{type = "control", id = "svf_peak", name = "svf_peak",
    controlspec = cs.new(0, 1, "lin", 0, 0.9, ""), action = engine.svf_peak}
  params:add{type = "control", id = "svf_notch", name = "svf_notch",
    controlspec = cs.new(0.01, 10, "lin", 0, 1, ""), action = engine.svf_notch}

  -- amp
  params:add{type = "control", id = "amp", name = "amp",
    controlspec = cs.new(0, 1, "lin", 0, 1, ""), action = engine.amp}

  params:add{type = "control", id = "pan", name = "pan",
    controlspec = cs.new(0, 1, "lin", -1, 1, ""), action = engine.pan}

arcify:register("hz", 10)
arcify:add_params()
end
function redraw()
    screen.clear()

    screen.move(16, 16)
    screen.text("Arcify Test")
    screen.move(16, 28)
    screen.text("Hz")
    screen.move(36, 28)
    screen.text(params:get("hz"))
    screen.move(16, 36)
    screen.text("Amp")
    screen.move(36, 36)
    screen.text(params:get("amp"))
    screen.move(16, 48)
    screen.text("See the PARAMS screen")
    screen.move(16, 56)
    screen.text("to assign Arc encoders")

    screen.update()
end




return gendr
