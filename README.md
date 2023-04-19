# Numerical-Analysis

## Part 1: Course summary

### A brief introduction to Numerical Analysis based on MATLAB and Fortran.

### Reference book: R. Burden and J. Faires. Numerical Analysis. Cengage Learning, 2010.


### Main topics:

        topic 1: Introduction to MATLAB & algorithms.
        Reading recommendation: 1.2, 1.3.
        topic 2: Algorithms for finding a function’s zeros.
        Reading recommendation: 2.1-2.4
        topic 3: Polynomial interpolation.
        Reading recommendation: 3.1-3.4
        topic 4: Complete polynomial interpolation.
        topic 5: Numerical differentiation and integration techniques.
        Reading recommendation: 4.1-4.3
        topic 6: Initial Value Problems (IVPs).
        Reading recommendation: 5.2-5.4.
        topic 7: Complete IVPs.
        topic 8: Solving linear systems of equations & matrix inversion.
        Reading recommendation: 6.1, 6.3, 6.5
        topic 9: Iterative methods to solve linear system.

## Part 2: Computational physics course summary(by Fortran):

Lagrange polynomial 分段拉氏插值公式

Successive Over Relaxation iterative Method for PDE超松弛迭代法求偏微分方程

Runge-Kutta methods for ODE龙格库塔法求常微分方程

Monte Carlo method for integration

Successive Over Relaxation iterative Method for PDE超松弛迭代法求偏微分方程2

## Part 3: Finite element analysis(FEA)

Finite Element Analysis (FEA) is a **numerical technique** used to solve complex engineering/scientific problems involving **partial differential equations (PDEs)**. It is widely employed in various fields such as physics, chemistry, and materials.

The FEA process involves discretizing the domain of the problem into smaller, simpler finite elements, such as triangles, quadrilaterals, or tetrahedra. Each element has a set of nodes or points where the unknown variables (such as displacement, stress, or temperature) are to be calculated. These elements are then connected to form a mesh, which represents the geometry of the problem.

(P.S. the discretize method is similar to one of the parallelism method in **high performance computing: Geometric decomposition**, which split up a problem into many parts so that it can be parallelized. In this method, we take advantage of the geometric properties of a problem(2D for image, 3D for model or space)

### The main steps in the FEA process are:

**Pre-processing:**

    a. Define the geometry of the problem.
    b. Discretize the geometry into finite elements.
    c. Assign material properties to the elements.
    d. Apply boundary conditions (such as constraints and loads).

**Formulation:**

    a. Develop the governing equations (usually PDEs) for the problem.
    b. Choose an appropriate interpolation function (shape function) to represent the unknown variables within each element.
    c. Apply the finite element method to the governing equations, which typically involves integrating the equations over each element and assembling them into a global system of equations.

**Solution:**

    a. Solve the global system of equations to obtain the values of the unknown variables at the nodes.
    b. Use the interpolation functions to compute the unknown variables at any point within the elements.

**Post-processing:**

    a. Analyze and visualize the results, such as displacements, stresses, or temperatures.
    b. Perform additional calculations, such as error estimation or optimization.

FEA is a powerful tool that allows engineers and scientists to predict the behavior of structures, materials, and systems under various conditions. It has numerous applications, including heat transfer, fluid flow, and electromagnetics.

### FEniCS package

FEniCS is an open-source computing platform for solving partial differential equations (PDEs) using the **finite element method (FEM)**. It is a collection of software libraries and tools that provide an efficient and easy-to-use interface for solving various types of PDEs, which are commonly found in many scientific and engineering applications.

FEniCS is primarily written in Python and C++, which makes it highly extensible and user-friendly. It allows users to express PDEs in a high-level mathematical notation, close to the actual mathematical formulation. The platform then automatically generates the finite element code needed to solve the problem.

FEniCS is widely used in various fields, including fluid dynamics, solid mechanics, electromagnetics, heat transfer, and more. It is an excellent tool for researchers, engineers, and students who want to solve complex PDEs.

**Key features of FEniCS include:**

-Automatic code generation: Users can define the PDEs symbolically, and FEniCS will generate the corresponding finite element code.

-High-performance solvers: FEniCS provides efficient solvers for linear and nonlinear problems.

-Parallel computing: The platform supports parallel computing for solving large-scale problems efficiently.(Combined with HPC)

-Flexibility and extensibility: FEniCS can be extended with user-defined finite elements, materials, and boundary conditions.

-Interoperability: FEniCS can be used with other popular scientific computing libraries and tools, such as NumPy, SciPy, and MATLAB.

### Installation

Here is how you can install FEniCS using Docker on mac OS X:

1. Install Docker Desktop for Mac from the official website: https://www.docker.com/products/docker-desktop/

2. Once Docker Desktop is installed and running, open a Terminal and pull the FEniCS Docker image

    docker pull quay.io/fenicsproject/stable
    
3. Run the FEniCS Docker container

    docker run -ti -v $(pwd):/home/fenics/shared -w /home/fenics/shared --name fenics-container quay.io/fenicsproject/stable
    
This command starts a FEniCS Docker container, mounts the current working directory to the container's shared folder, and sets the working directory inside the container to the shared folder. Now you can use FEniCS inside the Docker container. To exit the container, type exit.

4. To restart the FEniCS container later, use the following command

    docker start -ai fenics-container
    

