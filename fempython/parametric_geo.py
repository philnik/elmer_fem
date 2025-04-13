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

def read_geo_file(input_fname):
    with open(input_fname, 'r') as file:
        file_content = file.read()
    return file_content


def find_all_numbers(file_content,escape=True):
    """
    get all numbers from geo file
    """
    nlist = re.findall("[\\+-][0-9]+\\.[0-9]+E\\+[0-9]+",file_content)
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



ov = [['param3', 500],# fan height
      ['param8', -100.0], # left side extend
      ['param7',600.0],
      ]

#ov = []


def export_geo0(input_fname,output_fname,ov=[]):
    """
    reads input_fname .geo file
    converts all numbers to parameters
    change values of the paramaeters according to ov array
    exports the new geo file
    """
    file_content = read_geo_file(input_fname)
    x = subst_them(file_content)
    y = define_parameters(file_content,ov)
    with open(output_fname, 'w') as file:
        file.write(y+'\n'+x)
    return y+x



class pg():
    def __init__(self):
        pass

class pgeo():
    def __init__(self,ifile,ofile,ov=[]):
        self.ifile = ifile
        self.ofile = ofile
        self.ov = ov
        
    def export_geo(self):
        print("input_file:"+self.ifile)
        print("output_file:"+self.ofile)
        export_geo0(self.ifile, self.ofile,self.ov)


# print(x)
def angle_home():
    ROOT = "c:/Users/filip/AppData/Roaming/fem/elmer_fem/angle_home/"
    #ifile = ROOT + "raw_angle_home.geo"
    ofile = ROOT + "angle_home.geo"
    export_geo(ifile,ofile)


