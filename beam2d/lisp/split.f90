
program main
  integer, parameter :: size = 12
  integer :: i
  real :: length
  real :: f(size, size)
  
write(*,*) "hello"
call factorial()

length=4000.0
call fact(f, length,size)

do i = 1,size
      Write(*,*) (f(i,j), j=1,size)
end do

end program main


