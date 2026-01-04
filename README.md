# Noise-induced-explosive-synchronization

This repository contains the MATLAB source code for simulating the stochastic Kuramoto model with higher-order interactions (HOI). It implements the numerical integration scheme used to investigate noise-induced synchronization transitions and explosive phenomena.

**Reference:** *Interplay between noise and higher-order interactions in the stochastic Kuramoto model: from enhancement to explosive transitions* by Yu et al., *Phys. Rev. E Submission*.

---

## 1. File Structure

Please ensure the following three MATLAB files and the data file are located in the same directory. The workflow relies on the interaction between the main script and the calculation modules.

* **`main.m`**: The main execution script. It sets up the simulation parameters (coupling strengths, noise intensities), loads initial conditions, runs the ensemble simulations, and aggregates the results for the order parameter.
* **`trail.m`**: The core simulation engine. It implements the stochastic Euler-Heun integration for the Kuramoto model with both pairwise ($K_1$) and higher-order ($K_2$) interactions under multiplicative noise.
* **`Lorentzian_distribution.m`**: A utility function that generates random natural frequencies ($\omega_i$) drawn from a Lorentzian distribution using inverse transform sampling.
* **`Ini_node10000_beta=0_K2=8_step=0.01-NoGPU.mat`**: (Data File) Contains the pre-calculated initial states for the oscillators. This file is required to strictly reproduce the transitions with specific initial conditions.

> **Note:** The main entry point is `main.m`. Do not rename these files, as the script calls them directly.

## 2. Usage Instructions

### 2.1 Prerequisites
* MATLAB (Recommended version: R2018b or later).
* No specific toolboxes are required beyond standard MATLAB functions.

### 2.2 Configuration
In `main.m`, you can modify the system parameters to reproduce different figures from the paper. **The default configuration provided in this repo is set to generate the data for Figure 6(a) (Melting of Synchrony).**

* **Coupling Parameters**:
    * `K1`: Pairwise coupling strength (default `0.5` for Fig 6a).
    * `K2`: Higher-order coupling strength (default `8`).
* **Noise Parameters**:
    * `D1`: Pairwise interaction noise intensity. The script generates a logarithmic range (`Dmin` to `Dmax`).
    * `D2`: Higher-order interaction noise intensity (default `0`).
* **Simulation Settings**:
    * `N_nod`: Number of oscillators (defined inside `trail.m`, default `10000`).
    * `xIni`: Initial conditions loaded from the `.mat` file.

### 2.3 Running the Simulation
1. Open `main.m` in the MATLAB editor.
2. Ensure the data file `Ini_node10000_beta=0_K2=8_step=0.01-NoGPU.mat` is in the MATLAB path.
3. Run the script by clicking the **Run** button or typing `main` in the Command Window.

**What the program does:**
* Initializes $N=10,000$ oscillators with Lorentzian natural frequencies.
* Simulates the stochastic evolution of the phase order parameter $r(t)$ under multiplicative common noise.
* Specifically reproduces the **Melting of Synchrony** transition observed in **Figure 6(a)**, where the system is initialized in a synchronized state ($K_1=0.5$) and subjected to increasing pairwise noise.

### 2.4 Reproducing Other Results
**Important:** All numerical simulation results presented in the paper can be reproduced by simply adjusting the parameters in `main.m`:

* **For Noise-Induced Ordering (Fig 6d):** Change `K1` to `1.8` and ensure the initial condition (`xIni`) corresponds to the incoherent state.
* **For HON effects (Fig 7):** Set `D1 = 0` and vary `D2` (High-order interaction noise).
* **For Global Phase Diagrams (Fig 2, 4, 5):** Set up a loop over `K1` and `K2` values.
