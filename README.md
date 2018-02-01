# Trailer Parking Controller
MATLAB project to display and control a trailer going backwards.

## Authors
* **Alfredo Hernández**, aldomann.designs@gmail.com
* **David Massip**, david26694@gmail.com
* **Martí Municoy**, mail@martimunicoy.com
* **Jan-Hendrik Niemann**, janhendrik.niemann@e-campus.uab.cat

## Problem description
Backing up a car can sometimes be a stressful experience.
When you have something attached to your car, it gets even more nerve-racking.
The problem is that the motion control while moving forward is stable, while reversing the motion is unstable.

We think that our problem is mainly a control theory based problem. The aim is to design a controller for the system to drive the state ɸ to the wished state by changing the steering angle δ. We have constructed a linear controller which applies to the nonlinear model.

## Instructions
To run the simulation script, run `main.m` on MATLAB or Octave (although it may not have some of the required functions; it has not been tested).

## References

* [1] Nilsson, J., Abraham, S. (2013). Trailer Parking Assist (TPA) (Doctoral dissertation). Chalmers University of Technology
