




def target_bodies(i):
    s = f"Target Bodies({i}) = "
    for j in range(1,i+1):
        s += f" {j}"
    return s


target_bodies(24)
