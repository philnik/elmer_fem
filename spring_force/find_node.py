import numpy as np

# Load Elmer node file
nodes = np.loadtxt("mesh.nodes", skiprows=1)
coords = nodes[:, 2:]  # skip node ID

# Desired spring location

points= [-4000,-3500,-3000,-2500,-2000,-1500,-1000,-500,-250, -200, -100, -50, 0,50, 100, 150, 200, 300, 400, 500,1000,1500,2000,2500,3000,3500,4000]
points= [-3000,-2000,-1000,-0,1000,2000,3000]

res = []
for i in points:
    res.append(np.array([i, 0.0, 1117.0]))

targets = res

res = []
for target in targets:
    # Find nearest node
    dists = np.linalg.norm(coords - target, axis=1)
    nearest_node = nodes[np.argmin(dists), 0]
    res.append(int(nearest_node))
    print("Nearest node ID:", int(nearest_node))

ids = ' '.join(str(i) for i in res)    

str_target = f"Target Nodes({len(res)}) = {ids}"
print(str_target)

