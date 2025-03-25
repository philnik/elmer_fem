import numpy as np

"""
mesh header:
number_of_nodes  number_of_elements  number_of_boundary_elements
number_of_materials(bodies)
202 number_of_boundary_elements
303 number_of_elements
"""


def read_mesh_boundary_file(fname):
    """"
    0 boundary_element_id
    1 boundary_id as used in sif files
    2 mesh element 1 
    3 mesh element 2 (0 if is not shared by 2 elements
    4 202 for 2d (defined by 2 points and it can belong up to 2 triangle elements)
    5 mesh node 1
    6 mesh node 2
    
    elements in 2d are triangles defined by 3 edges
    order of 2-3 and 5-6 have some meaning
    """
    d = {}
    mesh_boundary = np.loadtxt(fname, dtype=int)
    # Extract columns
    d["element_id"] = mesh_boundary[:, 0]   # Boundary element IDs
    d["boundary_id"] = mesh_boundary[:, 1]    # Parent element IDs
    d["bc_id"] = mesh_boundary[:, 2]        # Boundary condition IDs
    d["node_indice"] = mesh_boundary[:, 3:] # Nodes forming the boundary elements
    return d

def read_mesh_nodes(fname):
    """
    0 node id
    1 -1
    2 x coords
    3 y coords
    4 z coords / 0 for 2d


    """
    d = {}
    mesh_boundary = np.loadtxt(fname, dtype=None)
    # Extract columns
    d["element_id"] = mesh_boundary[:, 0].astype(int)   # Boundary element IDs
    d["coords"] = mesh_boundary[:, 2:].astype(float)        # coords
    return d


def read_mesh_elements(fname):
    """
    0 element id
    1 material id / body id
    2 303 for 2d (triangle)
    3 node 1
    4 node 2
    5 node 3

    order of 3-4-5 has some meaning
    """
    d = {}
    mesh_boundary = np.loadtxt(fname, dtype=None)
    # Extract columns
    d["element_id"] = mesh_boundary[:, 0].astype(int)
    d["material_id"] = mesh_boundary[:, 1].astype(int)
    d["element_type"] = mesh_boundary[:,2].astype(int)
    d["nodes"] = mesh_boundary[:, 3:].astype(int)     
    return d

fname_boundary = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/porous/porous_square/mesh.boundary"
fname_nodes = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/porous/porous_square/mesh.nodes"
fname_elements = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/porous/porous_square/mesh.elements"

dboundary = read_mesh_boundary_file(fname_boundary)

dnodes = read_mesh_nodes(fname_nodes)
dc = dnodes["coords"]
did = dnodes["element_id"]

delements = read_mesh_elements(fname_elements)

def print_dict(d):
    for i,v in d.items():
        print(i,v)
