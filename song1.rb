use_synth :hollow

with_fx :reverb, amp: 0.8 do
  live_loop :n1 do
    play choose([:f4, :c4]), attack: 5, release: 5
    sleep 6
  end

  live_loop :n2 do
    play choose([:a2, :b2]), attack: 5, release: 6
    sleep 7
  end

  live_loop :n3 do
    play choose([:f6, :c6]), attack: 4, release: 6, amp: 0.3
    sleep 9
  end
end

use_synth :tb303
use_bpm 35

with_fx :reverb, amp: 0.4 do
  with_fx(:echo, decay: 5, delay: 0.5) do
    live_loop :synth do
      play chord([:f3, :c1, :f2, :c2, :c3, :f1].choose, :major), cutoff: rrand(20, 80), attack: 0, release: rrand(1, 2)
      sleep [0.5, 0.75, 1, 1, 0.125, 0.6].choose
    end
  end
end
