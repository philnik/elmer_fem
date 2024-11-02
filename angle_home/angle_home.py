import fempython.parametric_geo as pg
import fempython.sif_templates as sf

ROOT = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/angle_home/"
geo_input_file = ROOT + "raw_angle_home.geo"
geo_output_file = ROOT + "angle_home.geo"

sif_input_file = ROOT + "pcase.sif"
sif_output_file = ROOT + "angle_home.sif"

#pg.export_geo(ifile,ofile)
#pg.angle_home(ifile)
#pg.exp_geo(ifile,ofile)

p = pg.pgeo(geo_input_file, geo_output_file)
p.export_geo()

sif_template=sf.read_sif_template(sif_input_file)

header = sf.section()
boundary_conditions = sf.section()

header.text = f"""
Header
  CHECK KEYWORDS Warn
  Mesh DB "." "./angle_home/"
  Include Path ""
  Results Directory "./resu"
End
"""

boundary_conditions.text = """
Boundary Condition 2
  Target Boundaries(1) = 6
  Name = "force_fan"
  Force 1 = -100
  Force 2 = 0
End

Boundary Condition 3
  Target Boundaries(1) = 3
  Name = "force_motor"
  Displacement 1 =0
  Displacement 2 =0
End
"""



new_sif = sif_template.substitute(HEADER=header.text,
                                  SIMULATION=sf.simulation.text,
                                  SOLVER1 = sf.solver_elasticity.text,
                                  BOUNDARY_CONDITIONS = boundary_conditions.text)

sf.write_sif(sif_output_file, new_sif)
