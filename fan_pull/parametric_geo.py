import re

"""
Reads a geo file, and converts all numbers to parameters

replac_list = [["+3.23725860080107E+02", "param0"],
               ["+2.36110638184250E+01", "param1"]]

"""

input_fname = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/fan_pull/fan_pull.geo"
output_fname = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/fan_pull/fan_pull_out.geo"

def escape_string(test_str):
    '''
    escapes a string so it can be processed by re
    '''
    sres = ""
    for s in test_str:
        match s:
            case '+':
                sres+=('\+')
            case '.':
                sres+=('\.')
            case _:
                sres+=(s)
    return sres

with open(input_fname, 'r') as file:
    file_content = file.read()


def find_all_numbers(file_content,escape=True):
    """
    get all numbers from geo file
    """
    nlist = re.findall("[\+-][0-9]+\.[0-9]+E\+[0-9]+",file_content)
    ut = sorted(list(set(nlist)))
    res = []
    for i, v in enumerate(ut):
        if escape:
            new_v = escape_string(v)
        else:
            new_v = v
        new_row = [new_v, "param"+str(i)]
        res.append(new_row)
    return res



ov = [['param3', 500],# fan height
      ['param8', -100.0], # left side extend
      ['param7',600.0],
      ]

#ov = []

def define_parameters(file_content,override):
    pairs = find_all_numbers(file_content,escape=False)
    sres = ""
    for row in pairs:
        sres+=f"""{row[1]}={row[0]};
"""
    if len(override)>1:
        for row in override:
            sres+=f"""{row[0]}={row[1]};
"""
    return sres


y=define_parameters(file_content,ov)
print(y)


def subst_them(file_content):
    """
    here we substitude the numbers with the parameters,
    returning a new string
    """
    all_numbers = find_all_numbers(file_content)
    print(all_numbers)

    x = file_content
    for row in all_numbers:
        x = re.sub(row[0],row[1],x)
    return x

x = subst_them(file_content)




with open(output_fname, 'w') as file:
    file.write(y+'\n'+x)


# print(x)
