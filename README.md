# Control-Eng-Tracking-and-regulation

## Overview
This project involves analyzing and controlling the nonlinear dynamics of an inverted pendulum on a cart. The coursework tasks cover equilibrium point analysis, linearization, state-space modeling, and the design of controllers to regulate the system in the presence of external disturbances. MATLAB simulations are used to verify the control design.

## Coursework Tasks

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
- Pose the regulator problem to reject the disturbance \( d_1 \) and make the output \( s(t) \) track the reference signal \( d_2(t) = \alpha \sin(\omega t) \).

#### A6) Full Information Control Law
- Design a full information control law to solve the regulator problem from A5).

#### A7) Error Feedback Control Law
- Design an error feedback control law to solve the regulator problem from A5).

### Part B: MATLAB Simulations

#### B1) Design a Full Information Control Law
- Assume \( d_1(t) \) is a square wave of amplitude 0.5 and period 50 s, \( \alpha = 1 \), and \( \omega = 0.1 \). Design a full information control law and provide the equations.

#### B2) Plot \( y(t) \) and \( u(t) \)
- Simulate the linear system for \( x(0) = 0 \) and plot the system output \( y(t) \) and control input \( u(t) \). Discuss the results and the effect of the disturbance \( d_1(t) \).

#### B3) Nonlinear Model Simulation
- Simulate the nonlinear system using the same control law from B1 and plot \( y(t) \) and \( u(t) \). Discuss why the regulation goal is only approximately achieved.

#### B4) Varying \( \omega \)
- Repeat simulations for \( \omega = 1 \) and \( \omega = 10 \). Discuss how changing \( \omega \) affects the results.

## Files Included
- **MATLAB Scripts**:
  - Scripts for solving the regulator problem and running simulations for both linear and nonlinear models.
