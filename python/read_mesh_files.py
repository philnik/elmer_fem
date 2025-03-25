import numpy as np


fname = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/porous/porous_square/mesh.boundary"
# Load the mesh.boundary file

def read_mesh_boundary_file(fname):
    d = {}
    mesh_boundary = np.loadtxt(fname, dtype=int)
    # Extract columns
    d["element_id"] = mesh_boundary[:, 0]   # Boundary element IDs
    d["boundary_id"] = mesh_boundary[:, 1]    # Parent element IDs
    d["bc_id"] = mesh_boundary[:, 2]        # Boundary condition IDs
    d["node_indice"] = mesh_boundary[:, 3:] # Nodes forming the boundary elements
    return d


def print_boundary(dboundary):
    # Print the extracted data
    print("Element ID:", dboundary["element_id"])
    print("Boundary ID:", dboundary["boundary_id"])
    print("Boundary Condition IDs:", dboundary["bc_id"])
    print("Node Indices:\n", dboundary["node_indice"])

print_boundary(dboundary)



def read_mesh_nodes(fname):
    d = {}
    mesh_boundary = np.loadtxt(fname, dtype=None)
    # Extract columns
    d["element_id"] = mesh_boundary[:, 0].astype(int)   # Boundary element IDs
    d["coords"] = mesh_boundary[:, 2:].astype(float)        # coords
    return d


def read_mesh_elements(fname):
    d = {}
    mesh_boundary = np.loadtxt(fname, dtype=None)
    # Extract columns
    d["element_id"] = mesh_boundary[:, 0].astype(int)
    d["material_id"] = mesh_boundary[:, 1].astype(int)
    d["nodes"] = mesh_boundary[:, 2:].astype(int)        # Boundary condition IDs
    return d

fname_boundary = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/porous/porous_square/mesh.boundary"
fname_nodes = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/porous/porous_square/mesh.nodes"
fname_elements = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/porous/porous_square/mesh.elements"

dboundary = read_mesh_boundary_file(fname_boundary)

dnodes = read_mesh_nodes(fname_nodes)
dc = dnodes["coords"]
did = dnodes["element_id"]

delements = read_mesh_elements(fname_elements)

# for i,v in delements.items():
#     print(i,v)

def print_dict(d):
    for i,v in d.items():
        print(i,v)
