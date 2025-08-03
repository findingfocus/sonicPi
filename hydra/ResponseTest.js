// First, set up the audio spectrum analysis
a.setBins(4); // Set the number of frequency bins for analysis
a.setSmooth(0.8); // Set the smoothing of the audio reactivity
a.show(); // Display the audio spectrum for visual feedback

// Create an oscillator that reacts to the first bin of the audio spectrum
osc(10, 0, () => a.fft[0] * 2)
  // Modulate it with noise based on the second bin for some texture
  .modulate(noise(2), () => a.fft[1] * 0.5)
  // Apply a color shift based on the third bin of the audio
  .colorama(() => a.fft[2] * 2)
  // Scale the whole thing based on the overall loudness (fourth bin)
  .scale(() => a.fft[3] + 1)
  // Output the result
  .out();
