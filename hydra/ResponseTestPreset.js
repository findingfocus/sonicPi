a.setBins(4)
a.setSmooth(0.5)

osc(10, 0, () => a.fft[0] * 2) // Bass affects oscillator frequency
  .color(() => a.fft[0], () => a.fft[1], () => a.fft[2]) // RGB based on different frequency ranges
  .rotate(() => a.fft[3] * 5) // Treble affects rotation
  .modulate(noise(3, 0.1), () => a.fft[0]) // Bass modulates noise pattern
  .out()
