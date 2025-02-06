use_bpm 85

live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

# Ambient Wind
live_loop :wind do
  use_synth :dark_ambience
  use_synth_defaults sustain: 15, release: 12, amp: 0.8, attack: 3
  #play [:E1, :E2].choose, pan: rrand(-0.5, 0.5), cutoff: rrand(100, 130)
  sleep rrand(10, 20)
end

# Kick
live_loop :kick, sync: :met1 do
  a = 0.65
  cu = 100
  sample :drum_heavy_kick, cutoff: cu, amp: a if pattern "x---x-----------"
  sleep 0.25
end

live_loop :clap, sync: :met1 do
  a = 0.65
  cu = 100
  sample :bd_chip, cutoff: cu, amp: a if pattern "----------------"
  sleep 0.25
end
