import numpy as np

def read_elmer_nodes(filename="mesh.nodes"):
    """
    Reads Elmer mesh.nodes file.
    Returns:
        nodes: dict {node_id: (x, y, z)}
        coords: numpy array of shape (N, 3)
        ids: numpy array of node numbers
    """
    nodes = {}
    
    with open(filename, "r") as f:
        lines = f.readlines()
    
    # First line: number of nodes and dimension
    dim = 3
    rows = 8867
    coords = []
    ids = []
    
    for i in range(0, rows):
        parts = lines[i].split()
        node_id = int(parts[0])
        x = float(parts[2])
        y = float(parts[3])
        z = float(parts[4]) if dim == 3 else 0.0
        
        nodes[node_id] = (x, y, z)
        ids.append(node_id)
        coords.append([x, y, z])

    return nodes, np.array(coords), np.array(ids)


def find_closest_node(target_coord, coords, ids):
    """
    Finds closest mesh node to a given coordinate.
    Args:
        target_coord: (x, y, z)
        coords: Nx3 numpy array of node coordinates
        ids: node numbers corresponding to coords
    Returns:
        (closest_node_id, distance)
    """
    target = np.array(target_coord)
    dists = np.linalg.norm(coords - target, axis=1)
    idx = np.argmin(dists)
    return int(ids[idx]), dists[idx]


# --- Example usage ---
if __name__ == "__main__":
    # Load mesh data
    nodes, coords, ids = read_elmer_nodes("mesh.nodes")

    # Coordinate to search for
    targets = [(-4500,1119,2000),
              (-4500,-1119,2000),
              (-3000,1119,2000),
              (-3000,-1119,2000),
              (-1500,1119,2000),
              (-1500,-1119,2000),
              (4000,1119,2000),
              (4000,-1119,2000),
              ]

    res = []
    for target in targets:
        closest_id, dist = find_closest_node(target, coords, ids)
        print(f"Closest node to {target}: Node {closest_id}, distance = {dist}")
        res.append(closest_id)
    lent = len(targets)
    print(f"Target Nodes({lent}) = {' '.join(str(n) for n in res)}")
