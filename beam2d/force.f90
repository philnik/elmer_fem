!-------------------------------------------------------------------------------
!> File: MyLibrary.f90
!> Written by: ML, 5 May 2010
!> Modified by: -
!-------------------------------------------------------------------------------
FUNCTION myforce(Model, n, f) RESULT(g)
USE DefUtils
TYPE(Model_t) :: Model
INTEGER :: n
REAL(KIND=dp) :: f, g

g = -1000*f
END FUNCTION myforce

SUBROUTINE mybc(Model, n, BC, state, dt, time, node, x, y, z)
  USE DefUtils
  USE SolverUtils
  ! USE BoundaryConditions, ONLY: BC_t
!  IMPLICIT NONE
  TYPE(Model_t) :: Model
 ! TYPE(BC_t) :: BC
  REAL(KIND=dp), DIMENSION(:), POINTER :: BC
  REAL(KIND=dp) :: state, dt, time, x, y, z
  INTEGER :: n, node
  INTEGER :: IX
  REAL(KIND=dp) :: val
  IX = NINT(x)
  ! Example: Apply a Dirichlet boundary condition based on the x-coordinate
  SELECT CASE (IX)
  CASE (0:10)
  CASE (1000:1010)
  CASE (2000:2010)
  CASE (3000:3010)
  CASE (3990:4000)
    val = 0.0_dp
  CASE DEFAULT
    val = 1.0_dp
  END SELECT
  ! Set boundary condition value
  BC(1) = val
!  CALL SetDirichletBC(BC, val)

END SUBROUTINE mybc


