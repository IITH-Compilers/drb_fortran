program DB11

   implicit none
   integer::i, len, numNodes, numNodes2
   integer, dimension(0:99)::x
   len = 100
   numNodes = len
   numNodes2 = 0

   do i = 0, 99, 2
         x(i) = 5
   end do
      
   do i = 1, 99, 2
      x(i) = -5
   end do

      !$OMP         PARALLEL DO

   do i = numNodes - 1, 0, -1
      if (x(i) <= 0) then
         numNodes2 = numNodes2 - 1
      end if
   end do
!$OMP         end PARALLEL do
   print '("numNodes2=",I0)', numNodes2

end program DB11