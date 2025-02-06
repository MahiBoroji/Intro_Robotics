# MEC 529: Introduction to Robotics - Homework 3

## Overview
This repository contains the MATLAB code and report for Homework 3 of the MEC 529: Introduction to Robotics course, Spring 2023. 
The tasks include implementing MATLAB functions for rotation matrices, computing exponential coordinates, and converting between vector and skew-symmetric forms.

## Repository Structure
- **`Matrix_log.m`**: MATLAB function that takes a rotation matrix $\( R \)$ and returns the corresponding $\( so(3) \)$ representation of exponential coordinates.
- **`rotation_matrix.m`**: MATLAB function to compute the rotation matrix $\( R \)$ given a unit axis $\( \hat{\omega} \)$ and angle $\( \theta \)$.
- **`skew_symmetric.m`**: MATLAB function that takes the vector form of $\( \omega \)$ and converts it to a skew-symmetric matrix.
- **`vectorize.m`**: MATLAB function that takes the skew-symmetric form of $\( \omega \)$ and converts it back to a vector.
