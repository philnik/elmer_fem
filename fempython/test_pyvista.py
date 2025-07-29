import pyvista as pv


vtk_fname = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/fan_pull/resu/case_t0001.vtu"
vtk_fname_list = [vtk_fname]

# Load the VTK file output from Elmer


mesh_fields = ["displacement", "vonmises"]

def get_mesh_fields_from_mesh1(mesh,mesh_fields):
    scalar_field_list = []
    for field in mesh_fields:
        scalar_field = mesh[field]
        scalar_field_list.append(scalar_field)
    return scalar_field_list


def get_mesh_fields_from_mesh(mesh, mesh_fields):
    l = get_mesh_fields_from_mesh1(mesh, mesh_fields)
    return dict(zip(mesh_fields, l))


class maxres():
    def __init__(self, mesh, scalar_field):
        self.value = scalar_field.max()
        self.index = scalar_field.argmax()  # Index of max value
        self.point = mesh.points[self.index]

    def print(self):
        print(f"Maximum Value: {self.value}")
        print(f"Coordinates of Maximum Point: {self.point}")


class vtkres():
    def __init__(self,fname=vtk_fname,fields = mesh_fields):
        self.fname = fname
        self.fields = fields
        self.mesh = pv.read(fname)
        self.scalar_fields = get_mesh_fields_from_mesh(self.mesh, fields)
        #self.maxim = [maxres(self.mesh, f) for f in self.scalar_fields]


def print_vres_max_values():
    v0 = vtkres()
    m_von = maxres(v0.mesh, v0.scalar_fields['vonmises'])
    m_displ = maxres(v0.mesh, v0.scalar_fields['displacement'])
    m_von.print()
    m_displ.print()
