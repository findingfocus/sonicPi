use_bpm 55

notes = (scale :D3, :minor_pentatonic, num_octaves: 2)

live_loop :ambient_pad do
  use_synth :hollow
  use_synth_defaults attack: 2, sustain: 8, release: 4, amp: 0.5
  play notes.choose, pan: rrand(-0.5, 0.5), cutoff: rrand(70, 100)
  sleep rrand(8, 16)
end

live_loop :soft_melody do
  use_synth :fm
  use_synth_defaults attack: 0.5, sustain: 2, release: 2, amp: 0.3
  play_pattern_timed notes.shuffle.take(5), [4, 3, 3, 4, 4].shuffle, pan: rrand(-0.2, 0.2)
  sleep 16
end

live_loop :wind do
  use_synth :dark_ambience
  use_synth_defaults sustain: 15, release: 10, amp: 0.8, attack: 2
  play :d2, pan: rrand(-1, 1)
  sleep rrand(10, 20)
end

live_loop :high_ambience do
  use_synth :pretty_bell
  use_synth_defaults attack: 2, sustain: 2, release: 5, amp: 0.03
  play choose([:a4, :d3]), cutoff: rrand(90, 120)
  sleep rrand(5, 10)
end

live_loop :slow_bass do
  use_synth :bass_foundation
  use_synth_defaults attack: 1, sustain: 8, release: 3, amp: 0.04
  play :d3
  sleep 16
end
