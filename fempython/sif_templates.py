from string import Template


ROOT = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/fan_pull/"

sif_input_fname = ROOT+"pcase.sif"
sif_output_fname = ROOT+"ocase.sif"

def read_sif(ifname):
    with open(ifname, 'r') as file:
        file_content = file.read()
    return file_content

def write_sif(ofname,text):
    with open(ofname, 'w') as file:
        file.write(text)

    
class section():
    def __init__(self):
        self.text = ""


header = section()
simulation = section()
solver_elasticity = section()
boundary_pinned = section()

header.text = f"""
Header
  CHECK KEYWORDS Warn
  Mesh DB "." "./fan_pull_out/"
  Include Path ""
  Results Directory "./resu"
End
"""

simulation.text = f"""
Simulation
  Max Output Level = 5
  Coordinate System = Cartesian
  Coordinate Mapping(3) = 1 2 3
  Simulation Type = Steady state
  Steady State Max Iterations = 1
  Output Intervals(1) = 1
  Solver Input File = case.sif
  Post File = case.vtu
End
"""

"""iterative linear elasticity"""
solver_elasticity.text = f"""
Solver 1
  Equation = Linear_elasticity_0
  Procedure = "StressSolve" "StressSolver"
  Calculate Stresses = True
  Exec Solver = Always
  Stabilize = True
  Optimize Bandwidth = True
  Steady State Convergence Tolerance = 1.0e-6
  Nonlinear System Convergence Tolerance = 1.0e-7
  Nonlinear System Max Iterations = 20
  Nonlinear System Newton After Iterations = 3
  Nonlinear System Newton After Tolerance = 1.0e-3
  Nonlinear System Relaxation Factor = 1
  Linear System Solver = Iterative
  Linear System Iterative Method = BiCGStab
  Linear System Max Iterations = 50000
  Linear System Convergence Tolerance = 1.0e-10
  BiCGstabl polynomial degree = 2
  Linear System Preconditioning = ILU0
  Linear System ILUT Tolerance = 1.0e-3
  Linear System Abort Not Converged = False
  Linear System Residual Output = 10
  Linear System Precondition Recompute = 1
End
"""

"""
Solver 2
  Equation = "SaveData"
  Procedure = "SaveData" "SaveScalars"
  Filename = "point_data.dat"               ! Output filename
  !Output File = "point_data.dat"
  Variable 1 = Velocity                      ! Save velocity
  Variable 2 = Pressure                      ! Save pressure
  Save Coordinates(1,2) = 0.0 -0.25            ! Save data at point (x, y) = (0.5, 0.5)
  !Output Intervals = 1                       ! Save every timestep
End
"""


"""
we give pinned mount at coordinates
"""
boundary_pinned.text = f"""
Boundary Condition 4
         Name = "pinned"
         Target Coordinates(2,2) = -100.0 0.0
                                   600.0 0.0
         Displacement 1 = 0
         Displacement 2 = 0

End
"""


def read_sif_template(sif_fname):
    sif_content = read_sif(sif_fname)
    sif_template = Template(sif_content)
    return sif_template


def sif_example():
    sif_template = read_sif_template(sif_input_fname)
    new_sif = sif_template.substitute(HEADER=header.text,
                                      SIMULATION=simulation.text,
                                      SOLVER1 = solver_elasticity.text,
                                      BOUNDARY_PINNED = boundary_pinned.text)
    write_sif(sif_output_fname, new_sif)
    return new_sif


