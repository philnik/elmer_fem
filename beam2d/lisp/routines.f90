
subroutine factorial()
  ! define variables
  
integer :: nfact = 1
integer :: n = 1 ! compute factorials

do while (n <= 10)
nfact = nfact * n
n = n + 1
print*, n, " ", nfact
end do
end subroutine


subroutine fact(f, length,size)
  ! define variables
  real :: length, step
  integer :: i,j,size
  real :: f(size,size)
  
  do i = 1,size
     do j=1,size
        f(i,j)=0.0
     end do
  end do

  
  do i = 2,size
     step = length/i 
     do j=0,i
        f(i,j+1)=step*j
     end do
  end do

  
end subroutine



