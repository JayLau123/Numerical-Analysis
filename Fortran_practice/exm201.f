C------������ƽ����------
      PROGRAM Example_1_1
      REAL a, b, av1, av2

      WRITE(*,*) 'Input two real numbers:'
      READ (*,*) a, b
      av1 = (a + b)/2
      av2 = sqrt(a*b)
      WRITE(*,*) av1, av2
      END
