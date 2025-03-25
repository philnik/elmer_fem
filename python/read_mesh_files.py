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


def check_if_elements_repeat_edges():
    """
    each element has  3 nodes,
    if the edge is shared by 2 elements, or it is an outside boundary
    it will be repeated
    each node since it belongs to 3 elements the most, it will be repeated 6 times
    or it will belong to 3 edges.

    """
    den = delements['nodes']
    val = 80
    mask = (den[:,0]==val) | (den[:,1]==val) | (den[:,2]==val)
    fr = den[mask]
    for row in fr:
        print(f"{row[0]}-{row[1]}-{row[2]}")

check_if_elements_repeat_edges()
def print_dict(d):
    for i,v in d.items():
        print(i,v)


def check_points_on_lines(lines, points):
    """
    Checks if each point in 'points' belongs to any of the given 'lines'.
    
    Parameters:
    - lines: NumPy array of shape (N, 3) where each row is (A, B, C) representing Ax + By + C = 0
    - points: NumPy array of shape (M, 2) where each row is (x, y)

    Returns:
    - A boolean array of shape (M, N) where True means the point lies on the corresponding line.
    """
    A, B, C = lines[:, 0], lines[:, 1], lines[:, 2]  # Extract A, B, C from lines
    x, y = points[:, 0], points[:, 1]  # Extract x, y from points

    # Compute Ax + By + C for each point-line combination
    result = A[:, None] * x + B[:, None] * y + C[:, None]  # Shape (N, M)
    
    return result.T == 0  # Transpose to match (M, N)


def check_it():
    # Example usage:
    lines = np.array([[2, -3, 6], [1, -1, -2]])  # Two lines: 2x - 3y + 6 = 0 and x - y - 2 = 0
    points = np.array([[3, 0], [1, 3], [4, 6]])  # Three points

    result = check_points_on_lines(lines, points)
    print(result)  # Boolean matrix (M points × N lines)


def check_points_on_lines_by_points2(lines, points, tol=1e-9):
    """
    Checks if each point belongs to any of the given lines defined by two points.

    Parameters:
    - lines: NumPy array of shape (N, 4), where each row is (x1, y1, x2, y2) defining a line.
    - points: NumPy array of shape (M, 2), where each row is (x, y).
    - tol: Tolerance for floating-point precision issues.

    Returns:
    - A boolean array of shape (M, N), where True means the point lies on the corresponding line.
    """

    x1, y1, x2, y2 = lines[:, 0], lines[:, 1], lines[:, 2], lines[:, 3]
    x, y = points[:, 0], points[:, 1]


    # Reshape to enable broadcasting
    x1, y1, x2, y2 = x1[:, np.newaxis], y1[:, np.newaxis], x2[:, np.newaxis], y2[:, np.newaxis]
    x, y = x[np.newaxis, :], y[np.newaxis, :]

    # Compute determinant (collinearity condition)
    det = (x2 - x1) * (y - y1) - (y2 - y1) * (x - x1)

    return np.abs(det) < tol  # Check if determinant is close to zero


# Example usage:
def check2():
    lines = np.array([[0, 0, 1, 0], [0, 0, 4, 4]])  # Two lines: (1,2)-(3,4) and (0,0)-(4,4)
    points = np.array([[20, 0], [8, 8], [3, 3]])  # Three points

    result = check_points_on_lines_by_points2(lines, points)
    print(result)  # Boolean matrix (M points × N lines)

check2()
