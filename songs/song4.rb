use_bpm 120 

live_loop :met1 do
  sleep 1
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

bm_pent = (scale :B2, :minor_pentatonic, num_octaves: 2)

live_loop :kick do
  sample :bd_808, amp: 1 if pattern "x---x---xx----x-"
  sleep 0.25
end

live_loop :ticker do
  sample :bd_klub, amp: 1 if pattern "x"
  sleep 1
end

live_loop :test do
  sample :ambi_choir, amp: 0.2, cutoff: 70, rate: 0.2
  sleep 1
end

live_loop :clap, sync: :met1 do
  sample :hat_snap, cutoff: 90, amp: 0.2 if pattern "x-x-"
  sleep 1
end

live_loop :ambient_pad, sync: :met1 do
  use_synth :fm
  a = 1
  cu = 50
  use_synth_defaults attack: 2, sustain: 4, release: 6, amp: a
  play bm_pent.choose, cutoff: cu
  sleep rrand(8, 16)
end

