#!/usr/bin/env python
# coding: utf-8

# Basic example of a 1D FDTD implementation in Python for a free space with a Gaussian pulse source. This example demonstrates the basic structure and principles of an FDTD simulation.

# In[1]:


import numpy as np
import matplotlib.pyplot as plt

# Set simulation parameters
n_steps = 500  # n_steps is the number of time steps for the simulation
n_cells = 200  #  n_cells is the number of cells in the 1D grid
c = 1.0  # Speed of light in free space




# Initialize electric and magnetic field arrays
# Ez and Hy are the electric and magnetic field arrays, respectively, initialized with zeros.

Ez = np.zeros(n_cells)
Hy = np.zeros(n_cells)


# Set the Gaussian pulse parameters
# t0 is the time delay of the Gaussian pulse, and spread controls the width of the pulse.
t0 = 40
spread = 12

# FDTD loop. The FDTD loop iterates over the time steps, updating the electric and magnetic fields.

for time_step in range(n_steps):
    
    # Update magnetic field Hy
    # For each cell in the 1D grid (excluding the last cell), the magnetic field Hy is updated based on the difference in the electric field Ez between adjacent cells.
    
    for i in range(n_cells - 1):
        Hy[i] += 0.5 * (Ez[i + 1] - Ez[i])

        
        
    # Update electric field Ez
    # For each cell in the 1D grid (excluding the first cell), the electric field Ez is updated based on the difference in the magnetic field Hy between adjacent cells.
    
    for i in range(1, n_cells):
        Ez[i] += 0.5 * (Hy[i] - Hy[i - 1])

    # Add Gaussian pulse source at the left boundary
    # At each time step, the electric field Ez at the left boundary (cell 0) is updated with a Gaussian pulse value.
    
    Ez[0] = np.exp(-(time_step - t0)**2 / (2 * spread**2))

    # Visualization. Every 10 time steps, the electric field Ez is plotted. The label shows the current time step.
    
    if time_step % 10 == 0:
        plt.plot(Ez, label=f"Step {time_step}")
        
# Set the axis labels, title, and legend for the plot and display the simulation results.

plt.xlabel("Grid cell")
plt.ylabel("Electric field (Ez)")
plt.title("1D FDTD Simulation of a Gaussian Pulse in Free Space")
plt.legend()
plt.show()


# In this example, we initialize the electric and magnetic field arrays, set up a Gaussian pulse source, and then run the FDTD loop to update the fields at each time step. The simulation visualizes the propagation of the Gaussian pulse in free space.
# 
# This is a simple 1D FDTD example in free space without any **boundaries or material properties**. For more complex simulations, you might want to use specialized libraries like **Meep**, which provide advanced features and higher dimensions.

# In[ ]:




