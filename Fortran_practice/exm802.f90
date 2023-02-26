program exam4
    integer:: i, j, k
    character(len=40) :: str1,str2
    str1='125,250,375'
    read(str1,*) i,j,k
    write(str2,100) i,j,k,i+j+k
100 format('i=',i3,' j=',i3,' k=',i3,' i+j+k=',i3)
    write(*,*) "str1=",str1
    write(*,*) "str2=",str2
end
