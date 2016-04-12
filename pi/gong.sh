#!/bin/bash
PWM_PIN=1 # wPi Pin 1 = Physical Pin 12

gpio mode $PWM_PIN pwm  # Set pin mode to PWM
gpio pwm-ms             # Set PWM mode to mark:space
gpio pwmc 1920          # Set the clock divisor to 1920
gpio pwmr 200           # Set the range to 200

gpio pwm $PWM_PIN 15    # Raise hammer
sleep 0.6               # Wait for servo to reach position
gpio pwm $PWM_PIN 8     # Swing hammer
sleep 0.2               # Wait for servo to reach position
gpio pwm $PWM_PIN 15    # Move hammer off the gong to allow resonation
sleep 2                 # Hold for a moment before disabling

# Slowly return to neutral position
for p in `seq 14 -1 10`; do
  gpio pwm $PWM_PIN $p
  sleep 0.1
done
