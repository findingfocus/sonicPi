live_loop :mid1 do
  midi_cc 0, ring(3, 4, 5, 6, 7, 8, 9).tick
  use_synth :fm
  play :e1
  sleep 1

end

live_loop :mid2, sync: :mid1 do
  midi_cc 1, val_f: rand
  play :e2
  sleep 0.25
end

live_loop :mid3, sync: :mid1 do
  midi_cc 2, rrand_i(2, 7)
  midi_cc 3, rrand_i(2, 7)
  sleep 2
end

live_loop :mid4, sync: :mid1 do
  midi_cc 4, val_f: rand  
  sleep 0.5
  use_synth :saw
  play (octs :B2, 3).tick, release: rrand(0.1, 0.5), amp: 0.5, cutoff: 60
end
