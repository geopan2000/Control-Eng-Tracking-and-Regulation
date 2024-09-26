# Control-Eng-Tracking-and-regulation

# Tracking and Regulation of an Inverted Pendulum on a Cart

## Overview
This project involves the modeling, linearization, and control of an inverted pendulum mounted on a moving cart. The coursework includes equilibrium analysis, state-space representation, and the design of a controller to achieve regulation and tracking. MATLAB is used for simulating both linearized and nonlinear systems to assess the performance of the designed control laws.

## Coursework Questions

### Part A: Analytical Tasks

#### A1) Equilibrium Points
- Compute the equilibrium points of the system for \( \mu(t) = d_1(t) = 0 \).

#### A2) Linearization
- Linearize the nonlinear system around the equilibrium point \( \phi = s = \dot{\phi} = \dot{s} = 0 \).

#### A3) State-Space Representation
- Express the linearized dynamics in standard state-space form:
  \[
  \dot{x} = Ax + Bu + Pd_1, \quad y = Cx
  \]
  where \( x(t) = [s(t), \dot{s}(t), \phi(t), \dot{\phi}(t)]^T \), \( u(t) = \mu(t) \), and \( y(t) = [s(t), \phi(t)] \).

#### A4) Controllability
- Show that the pair \( (A, B) \) is controllable.

#### A5) Regulator Problem Setup
- Formulate a regulator problem to reject the disturbance \( d_1 \) and make the first output \( s(t) \) track the reference signal \( d_2(t) = \alpha \sin(\omega t) \).

#### A6) Full Information Control Law
- Design a full information control law to solve the regulator problem.

#### A7) Error Feedback Control Law
- Design an error feedback control law to solve the regulator problem using the output \( y(t) \) and the error signal \( e(t) = s(t) - d_2(t) \).

### Part B: MATLAB Simulations

#### B1) Full Information Control Law
- Assume \( d_1(t) \) is a square wave with amplitude 0.5 and period 50s, \( \alpha = 1 \), and \( \omega = 0.1 \). Design a full information control law, show the steps, and provide the control law equations.

#### B2) Simulation of Linear System
- Simulate the linear system from B1 for \( x(0) = 0 \). Plot \( y(t) \) and \( u(t) \) and discuss why the disturbance \( d_1(t) \) does not affect the output.

#### B3) Nonlinear System Simulation
- Use the control law from B1 for the nonlinear model. Simulate for \( x(0) = 0 \), plot \( y(t) \) and \( u(t) \), and discuss why the disturbance \( d_1(t) \) does not affect the output and why regulation is only approximately achieved.

#### B4) Varying \( \omega \)
- Repeat the simulations for \( \omega = 1 \) and \( \omega = 10 \). Discuss the impact of \( \omega \) on system performance.

## Files Included
- **MATLAB Scripts**:
  - Scripts for designing the control law and simulating both the linear and nonlinear models.
  
## How to Run
1. Open the MATLAB files.
2. Modify the system parameters, disturbance, and reference signals as needed.
3. Run the simulations to observe the system's behavior and verify the control law.
4. Analyze the plots of system output and control input to evaluate performance.

## License
This project is provided for educational purposes only.


