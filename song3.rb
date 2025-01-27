use_bpm 120

live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

#Drums
live_loop :kick, sync: :met1 do
  a = 2
  cu = 100
  sample :drum_heavy_kick, cutoff: cu, amp: a if pattern "x-----x---x--x--"
  sleep 0.25
end

live_loop :hihat, sync: :met1 do
  a = 1
  sample :hat_tap, amp: a if pattern "x---x---x---x-x-"
  sleep 0.125
end

live_loop :snare, sync: :met1 do
  a = 1
  sample :drum_snare_soft, cutoff: 120, amp: a if pattern "----x-------x---"
  sleep 0.5
end

live_loop :wind do
  use_synth :dark_ambience
  use_synth_defaults sustain: 15, release: 10, amp: 3, attack: 2
  play [:E1, :E2].choose, pan: rrand(-1, 1)
  sleep rrand(10, 20)
end

# Melody
live_loop :melody, sync: :met1 do
  use_synth :sine #saw, sine, pluck, tech_saws, tri
  
  notes = scale(:E2, :minor_pentatonic, num_octaves: 2)
  
  cu = line(60, 95, steps: 32).tick
  #cu = 95
  
  #Rest
  if one_in(4)
    sleep [0.25, 0.5].choose
  else
    note = notes.choose
    a = 1
    with_fx :reverb, room: rrand(0.5, 0.9), mix: 0.6 do
      with_fx :echo, phase: [0.25, 0.5].choose, decay: 2 do
        with_fx :tanh, krunch: 1 do
          play note, release: rrand(0.1, 0.5), cutoff: cu, amp: a
        end
      end
    end
    
    sleep [0.25, 0.5, 0.75].choose
  end
end

em_pent = (scale :E1, :minor_pentatonic, num_octaves: 2)

#Pad
live_loop :ambient_pad do
  use_synth :prophet
  a = 0.5
  cu = line(55, 85, steps: 32).tick
  use_synth_defaults attack: 2, sustain: 8, release: 6, amp: a
  play em_pent.choose, pan: rrand(-0.5, 0.5), cutoff: cu
  sleep rrand(8, 16)
end

#Bass
live_loop :bass, sync: :met1 do
  use_synth :fm
  a = 6
  notes = scale(:E1, :minor_pentatonic)
  play notes.tick, release: 0.3, amp: a if pattern "-x------x---x-x-"
  sleep 0.5
end