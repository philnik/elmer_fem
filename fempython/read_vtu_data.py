#!/usr/bin/env python
# -*- coding: utf-8 -*-

import vtkmodules.all as vtk
from vtk.numpy_interface import dataset_adapter as dsa
from vtkmodules.util.numpy_support import vtk_to_numpy 


def get_program_parameters():
    import argparse
    description = 'Read an unstructured grid file.'
    epilogue = ''''''
    parser = argparse.ArgumentParser(description=description, epilog=epilogue,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('filename', help='tetra.vtu.')
    args = parser.parse_args()
    return args.filename


def main():
    colors = vtk.vtkNamedColors()

    #file_name = get_program_parameters()
    reader.ReadAllScalarsOn()
    file_name = "case001_t0002.vtu"
    # Read the source file.
    reader = vtk.vtkXMLUnstructuredGridReader()
    reader.SetFileName(file_name)
    reader.Update()  # Needed because of GetScalarRange
    output = reader.GetOutput()
    # scalar_range = output.GetScalarRange()

    # Create the mapper that corresponds the objects of the vtk.vtk file
    # into graphics elements
    mapper = vtk.vtkDataSetMapper()
    mapper.SetInputData(output)
    # mapper.SetScalarRange(scalar_range)
    mapper.ScalarVisibilityOff()

    # Create the Actor
    actor = vtk.vtkActor()
    actor.SetMapper(mapper)
    actor.GetProperty().EdgeVisibilityOn()
    actor.GetProperty().SetLineWidth(2.0)
    actor.GetProperty().SetColor(colors.GetColor3d("MistyRose"))

    backface = vtk.vtkProperty()
    backface.SetColor(colors.GetColor3d('Tomato'))
    actor.SetBackfaceProperty(backface)

    # Create the Renderer
    renderer = vtk.vtkRenderer()
    renderer.AddActor(actor)
    renderer.SetBackground(colors.GetColor3d('Wheat'))

    # Create the RendererWindow
    renderer_window = vtk.vtkRenderWindow()
    renderer_window.SetSize(640, 480)
    renderer_window.AddRenderer(renderer)
    renderer_window.SetWindowName('ReadUnstructuredGrid')

    # Create the RendererWindowInteractor and display the vtk_file
    interactor = vtk.vtkRenderWindowInteractor()
    interactor.SetRenderWindow(renderer_window)
    interactor.Initialize()
    interactor.Start()


if __name__ == '__main__':
    main()


def main2():
    colors = vtk.vtkNamedColors()

    #file_name = get_program_parameters()
    file_name = "case001_t0002.vtu"
    # Read the source file.
    reader = vtk.vtkXMLUnstructuredGridReader()
    reader.SetFileName(file_name)
    reader.Update()  # Needed because of GetScalarRange
    output = reader.GetOutput()
    # scalar_range = output.GetScalarRange()

    # Create the mapper that corresponds the objects of the vtk.vtk file
    # into graphics elements
    mapper = vtk.vtkDataSetMapper()
    mapper.SetInputData(output)
    # mapper.SetScalarRange(scalar_range)
    mapper.ScalarVisibilityOff()

    # Create the Actor
    actor = vtk.vtkActor()
    actor.SetMapper(mapper)
    actor.GetProperty().EdgeVisibilityOn()
    actor.GetProperty().SetLineWidth(2.0)
    actor.GetProperty().SetColor(colors.GetColor3d("MistyRose"))

    backface = vtk.vtkProperty()
    backface.SetColor(colors.GetColor3d('Tomato'))
    actor.SetBackfaceProperty(backface)
    numpy_array_of_points = dsa.WrapDataObject(output).Points
    return output



output = main2()
    
#nodes_vtk = output.GetPoints().GetData()
#data = output.GetCellData().GetArray("pressure")

pnt = dsa.WrapDataObject(output).Points
vel = vtk_to_numpy(output.GetPointData().GetArray("velocity"))
press = vtk_to_numpy(output.GetPointData().GetArray("pressure"))

i=500
print(f"""
{pnt[i]}
{vel[i]}
{press[i]}
""")
