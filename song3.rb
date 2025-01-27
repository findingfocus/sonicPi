use_bpm 120

live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :kick, sync: :met1 do
  a = 1.8
  sample :drum_heavy_kick, cutoff: 105, amp: a if pattern "x-----x---x--x--"
  sleep 0.25
end

live_loop :hi, sync: :met1 do
  a = 0.6
  sample :hat_tap, amp: a if pattern "x-x-x-x-x-x-xxx-"
  sleep 0.125
end

live_loop :wind do
  use_synth :dark_ambience
  use_synth_defaults sustain: 15, release: 10, amp: 3, attack: 2
  play :E2, pan: rrand(-1, 1)
  sleep rrand(10, 20)
end

# Melody
live_loop :melody, sync: :met1 do
  use_synth :blade  #saw, pluck
  
  notes = scale(:E2, :minor_pentatonic, num_octaves: 2)
  
  #Rest
  if one_in(4)
    sleep [0.25, 0.5].choose
  else
    note = notes.choose
    
    with_fx :reverb, room: rrand(0.5, 0.9), mix: 0.6 do
      with_fx :echo, phase: [0.25, 0.5].choose, decay: 2 do
        play note, release: rrand(0.1, 0.5), amp: 0.8
      end
    end
    
    sleep [0.25, 0.5, 0.75].choose
  end
end

em_pent = (scale :E1, :minor_pentatonic, num_octaves: 2)

live_loop :ambient_pad do
  use_synth :prophet
  cu = rrand(50, 90)
  #cu = 100
  use_synth_defaults attack: 2, sustain: 8, release: 4, amp: 0.5
  play em_pent.choose, pan: rrand(-0.5, 0.5), cutoff: cu
  sleep rrand(8, 16)
end
