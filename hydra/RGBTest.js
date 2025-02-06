s0.initScreen()

src(s0)
  .layer(
    src(s0)
      .r() // Extract red channel
      .scale(()=>1 + 0.02 * Math.sin(time)) // Pulsate effect for depth
      .rotate(()=>0.01 * Math.sin(time)) // Subtle rotation to simulate depth
      .scrollX(()=>0.02 * Math.sin(time * 0.5)) // Apply horizontal wave motion
      .scrollY(()=>0.02 * Math.cos(time * 0.5)) // Apply vertical wave motion
      .color(1, 0, 0) // Strong red tint
      .brightness(0.5) // Increase brightness for glow effect
      .contrast(1.5) // Enhance contrast for more intensity
      .diff(
        src(s0).g()
          .scale(()=>1 - 0.02 * Math.sin(time))
          .rotate(()=>-0.01 * Math.sin(time)) // Opposing rotation for depth effect
          .scrollX(()=>0.02 * Math.cos(time * 0.5)) // Offset wave effect for variation
          .scrollY(()=>0.02 * Math.sin(time * 0.5))
          .color(0, 1, 0)
          .brightness(0.5)
          .contrast(1.5)
      )
      .diff(
        src(s0).b()
          .scale(()=>1 + 0.02 * Math.cos(time))
          .rotate(()=>0.01 * Math.cos(time)) // Complementary rotation for blue
          .scrollX(()=>0.02 * Math.sin(time * 0.5))
          .scrollY(()=>0.02 * Math.cos(time * 0.5))
          .color(0, 0, 1)
          .brightness(0.5)
          .contrast(1.5)
      )
  )
  .blend(src(s0), 0.5) // Mix with the original input

  .out()
