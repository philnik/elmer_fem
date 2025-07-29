


FUNCTION SpringForce() RESULT(f)
  USE DefUtils
  IMPLICIT NONE
  REAL(KIND=dp) :: f(3)
  REAL(KIND=dp) :: x(3), u(3)
  REAL(KIND=dp) :: k, K_total, dist
  INTEGER :: i, nPoints
  REAL(KIND=dp), PARAMETER :: tol = 1.0e-6_dp
  LOGICAL :: matched
  REAL(KIND=dp), DIMENSION(3, 3) :: springPoints


  
  ! p1: -4280, 0, 1110
  ! p2: 4280, 0, 1110
  
  ! Define spring stiffness
  k = 16000000_dp

  ! Coordinates of spring points (add more as needed)



  ! Set spring points (each column is a coordinate)
  springPoints(1,1) = -4000.1_dp
  springPoints(2,1) = 0.0_dp
  springPoints(3,1) = 1110.0_dp

  springPoints(1,2) = 0.2_dp
  springPoints(2,2) = 0.0_dp
  springPoints(3,2) = 1110.0_dp

  springPoints(1,3) = 4000.3_dp
  springPoints(2,3) = 0.0_dp
  springPoints(3,3) = 1110.0_dp


  ! Get current node info
  CALL GetCoordinates(x)
  CALL GetVectorComponent("Displacement", u)

  f = 0.0_dp
  matched = .FALSE.

  ! Each node checks all spring coordinates and applies to first match only
  DO i = 1, nPoints
    dist = SQRT((x(1) - springPoints(1,i))**2 + (x(2) - springPoints(2,i))**2 + (x(3) - springPoints(3,i))**2)
    IF (dist < tol) THEN
      f = -k * u
      matched = .TRUE.
      EXIT  ! Only apply to one coordinate per node
    END IF
  END DO

END FUNCTION
